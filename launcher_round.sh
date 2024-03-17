image_url="$1"

# Extract the filename from the URL
filename="ic_launcher_round.webp"

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
convert "$filename" -resize 192x192 "$local_file_path"/mipmap-xxxhdpi/"$filename"

# Resize and save to mipmap-xxhdpi
convert "$filename" -resize 144x144 "$local_file_path"/mipmap-xxhdpi/"$filename"

# Resize and save to mipmap-xhdpi
convert "$filename" -resize 96x96 "$local_file_path"/mipmap-xhdpi/"$filename"

# Resize and save to mipmap-mdpi
convert "$filename" -resize 48x48 "$local_file_path"/mipmap-mdpi/"$filename"

# Resize and save to mipmap-hdpi
convert "$filename" -resize 72x72 "$local_file_path"/mipmap-hdpi/"$filename"

echo "Image resized and saved to mipmap directories."