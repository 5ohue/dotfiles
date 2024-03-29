; Перевел для себя, и для пользователей сайта Gimp-master.moy.su пользуйтесь кому надо. Проверено на GIMP 2.8.2
; Расположен в Изображение\Направляющие\* Направляющие по центру...*
;; -*-scheme-*-
;; Alan Horkan 2004.  No copyright.  Public Domain.
(define (script-fu-guide-new-center image drawable)
  (let* ((width (car (gimp-image-width image)))
      	(height (car (gimp-image-height image)))
        (positionH (* height 0.5))
        (positionV (* width  0.5)))
    (if (<= positionH height) (gimp-image-add-hguide image positionH))
	(if (<= positionV width) (gimp-image-add-vguide image positionV))
    (gimp-displays-flush)))
(script-fu-register "script-fu-guide-new-center"
  _"Guides at center"
  _"Добавляет две направляющие по центру изображения"
  "Pedro Paixao"
  "Pedro Paixao, 2012"
  "December 2012"
  "*"
  SF-IMAGE      "Input Image"      0
  SF-DRAWABLE   "Input Drawable"   0)
(script-fu-menu-register "script-fu-guide-new-center""<Image>/Image/Guides")
