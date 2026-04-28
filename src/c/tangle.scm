(use-modules (ice-9 format) (ice-9 ftw) (ice-9 textual-ports) (srfi srfi-1) (srfi srfi-13))

(define (tangle-c-or-h-file noweb-file-basename
                            #:key root output-file redirection-op tangleopts version specifier)
  (let* ((src-dir "../src/c")
         ;; Determine output file
         (output-file
          (or output-file
              (if (not root)
                  (string-append src-dir "/" noweb-file-basename ".c")
                  (string-append src-dir "/" noweb-file-basename ".h")))))

    ;; Ensure output looks correct
    (when (not root)
      (unless (string-suffix? ".c" output-file)
        (format #t "Warning: ~a is not a .c file!~%" output-file)))
    (when root
      (unless (string-suffix? ".h" output-file)
        (format #t "Warning: ~a is not a .h file!~%" output-file)))

    ;; Build noweb_file path
    (let* ((noweb-file (if (absolute-file-name? noweb-file-basename)
                           noweb-file-basename
                           (string-append src-dir "/"
                                          (if (string-suffix? ".nw" noweb-file-basename)
                                              noweb-file-basename
                                              (string-append noweb-file-basename ".nw"))))))

      ;; Handle specifier (nocond-like chunk rewriting)
      (let ((translated-file
             (if specifier
                 (let* ((lines (call-with-input-file noweb-file
                                 (lambda (p) (string-split (get-string-all p) #\newline))))
                        (new-lines
                         (map (lambda (line)
                                (let ((m (string-match
                                          (string-append "^<<(.+) *\\\\(\\(" specifier "\\)\\)>>=$")
                                          line)))
                                  (if m
                                      (string-append "<<" (match:substring m 1) ">>=")
                                      line))))
                         lines)))
                 (let ((tmp (tmpnam)))
                   (call-with-output-file tmp
                     (lambda (p) (for-each (lambda (l) (format p "~a~%" l)) new-lines)))
                   tmp))
             noweb-file)))

      ;; Build command
      (let* ((root-opt (if root (format #f "-R\"~a\"" root) ""))
             (redir (or redirection-op ">"))
             (tangle-opts (or tangleopts ""))
             (cmd (format #f "~a ~a -L\"#line %L \\\"~a.nw\\\"%N\" ~a ~a ~a"
                          translated-file tangle-opts noweb-file-basename
                          root-opt redir output-file)))

        (cond
         ((not (or (eq? version 2) (eq? version 3)))
          (error "version must be 2 or 3"))
         ((= version 2)
          (system (string-append "notangle" cmd)))
         (else
          (system (string-append "no tangle" cmd))))

        (when (and (string? translated-file) (not (equal? translated-file noweb-file)))
          (delete-file translated-file))))))

(display "Generating H sources with bundled Noweb (version 2)...")
(define headers
  '("cargs" "columns" "cpif" "env-lua" "errors" "fromascii"
    "getline" "ipipe" "ipipe-lua" "lua-help" "lua-main"
    "markparse" "markup" "match" "misc-lua" "modtrees"
    "modules" "mpipe" "mpipe-lua" "notangle" "noweb-lua"
    "nwbuffer" "nwprocess" "nwtime" "precompiled" "recognize"
    "stages" "strsave" "sys" "util" "xpipe" "xpipe-lua"))
(for-each (lambda (header)
            (tangle-c-or-h-file header #:root "header" #:version 2))
          headers)

(display "Generating C sources with bundled Noweb (version 2)...")
(define sources
  '("columns" "cpif" "errors" "env-lua" "finduses" "fromascii"
    "getline" "ipipe" "ipipe-lua" "lua-help" "lua-main" "main"
    "markup" "markparse" "misc-lua" "modtrees" "modules"
    "mpipe" "mpipe-lua" "notangle" "noweb-lua" "nwbuffer"
    "nwprocess" "nwmtime" "nwtime" "recognize" "stages"
    "strsave" "sys" "util" "xpipe" "xpipe-lua"))
(for-each (lambda (source)
            (tangle-c-or-h-file source #:version 2))
          sources)

(tangle-c-or-h-file "nwbuffer" #:root "nwbuffer-lua.c" #:output-file "../src/c/nwbuffer-lua.c" #:version 2)
