;; Example from https://www.gimp.org/tutorials/Basic_Batch/

  (define (batch-unsharp-mask pattern
                              radius
                              amount
                              threshold)
  (let* ((filelist (cadr (file-glob pattern 1))))
    (while (not (null? filelist))
           (let* ((filename (car filelist))
                  (image (car (gimp-file-load RUN-NONINTERACTIVE
                                              filename filename)))
                  (drawable (car (gimp-image-get-active-layer image))))
             (plug-in-unsharp-mask RUN-NONINTERACTIVE
                                   image drawable radius amount threshold)
             (gimp-file-save RUN-NONINTERACTIVE
                             image drawable filename filename)
             (gimp-image-delete image))
           (set! filelist (cdr filelist)))))

;; Example from http://www.adp-gmbh.ch/misc/tools/script_fu/ex_09.html

  (define (batch-resize-image pattern
                              new-width
                              new-height)
  (let* ((filelist (cadr (file-glob pattern 1))))
    (while (not (null? filelist))
           (let* ((filename (car filelist))
                  (image (car (gimp-file-load RUN-NONINTERACTIVE
                                              filename filename)))
                  (drawable (car (gimp-image-get-active-layer image))))

             (gimp-image-scale image new-width new-height)
             (gimp-file-save RUN-NONINTERACTIVE
                             image drawable filename filename)
             (gimp-image-delete image))
           (set! filelist (cdr filelist)))))

;; http://photo.stackexchange.com/questions/63692/how-can-i-get-a-uniform-white-balance-on-a-batch-of-jpeg-images
(define (batch-auto-levels pattern)
(let* ((filelist (cadr (file-glob pattern 1))))
  (while (not (null? filelist))
         (let* ((filename (car filelist))
                (image (car (gimp-file-load RUN-NONINTERACTIVE
                                            filename filename)))
                (drawable (car (gimp-image-get-active-layer image))))
           (gimp-levels-stretch drawable)
           (gimp-file-save RUN-NONINTERACTIVE
                           image drawable filename filename)
           (gimp-image-delete image))
         (set! filelist (cdr filelist)))))

;; https://stackoverflow.com/questions/23554843/batch-rotate-files-with-gimp
  (define (batch-rotate pattern)
  (let* ((filelist (cadr (file-glob pattern 1))))
    (while (not (null? filelist))
           (let* ((filename (car filelist))
                  (image (car (gimp-file-load RUN-NONINTERACTIVE
                                              filename filename)))
                  (drawable (car (gimp-image-get-active-layer image))))

             (gimp-image-rotate image 0)

             (gimp-file-save RUN-NONINTERACTIVE
                             image drawable filename filename)
             (gimp-image-delete image))
           (set! filelist (cdr filelist)))))


