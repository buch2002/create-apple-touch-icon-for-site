#!/bin/sh

# Конвертирование изображения в формат .ico
# с заданными размерами (соотношение — все к одному).

# Имя конвертируемого файла исходника.
original_image='sample-image.png'
# Задаём полный путь к файлу-исходнику (Обязательно в конце слеш /).
img_filepath='/var/www/data/'
# Название получаемого файла .ico
ico_image='favicon.ico'
# Куда положить иконку — задаём полный путь (Обязательно в конце слеш /).
ico_filepath='/var/www/data/'
# =======================================================================
ico_allpatch=$ico_filepath$ico_image
img_allpatch=$img_filepath$original_image
echo "Производится конвертирование изображения в иконку..."
echo "Конвертирование в иконку с размерами - 8x8, 16x16, 32x32, 64x64 - 256 цветов"
echo "Конвертируемый файл -" $original_image
echo "Полный путь к файлу -" $img_allpatch
# Конвертирование
convert $original_image  \
          \( -clone 0 -resize 8x8 \) \
          \( -clone 0 -resize 16x16 \) \
          \( -clone 0 -resize 32x32 \) \
          \( -clone 0 -resize 64x64 \) \
          -delete 0 -colors 256 $ico_allpatch
echo "Иконка находится по этому пути -" $ico_allpatch
