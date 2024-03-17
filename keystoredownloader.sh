image_url="https://firebasestorage.googleapis.com/v0/b/uploadtesting-aaed4.appspot.com/o/images%2F01e7dd46-c4f8-43c2-abb4-0e59a0f63aef?alt=media&token=70018e4c-1b85-425e-8df2-9d66f5af3809"

# Extract the filename from the URL
filename="ic_launcher_foreground.webp"

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

local_file_path="$script_dir/app/src/main/res"


mkdir -p "$local_file_path/mipmap-xxxhdpi"
mkdir -p "$local_file_path/mipmap-xxhdpi"
mkdir -p "$local_file_path/mipmap-xhdpi"
mkdir -p "$local_file_path/mipmap-mdpi"
mkdir -p "$local_file_path/mipmap-hdpi"

# Download the image using curl
curl -o "$filename" "$image_url"

# Check if the download was successful
if [ $? -ne 0 ]; then
  echo "Failed to download the image."
  exit 1
fi

# Resize and save to mipmap-xxxhdpi
convert "$filename" -resize 432x432 "$local_file_path"/mipmap-xxxhdpi/"$filename"

# Resize and save to mipmap-xxhdpi
convert "$filename" -resize 324x324 "$local_file_path"/mipmap-xxhdpi/"$filename"

# Resize and save to mipmap-xhdpi
convert "$filename" -resize 216x216 "$local_file_path"/mipmap-xhdpi/"$filename"

# Resize and save to mipmap-mdpi
convert "$filename" -resize 108x108 "$local_file_path"/mipmap-mdpi/"$filename"

# Resize and save to mipmap-hdpi
convert "$filename" -resize 162x162 "$local_file_path"/mipmap-hdpi/"$filename"

echo "Image resized and saved to mipmap directories."
