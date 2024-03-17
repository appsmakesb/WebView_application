image_url="$1"
keystore_url="$2"

# Extract the filename from the URL
filename="ic_launcher_foreground.webp"
keyname="keystore.jks"

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

local_file_path="$script_dir/app/src/main/res"
file_path="$script_dir/app/$keyname"

mkdir -p "$local_file_path/mipmap-xxxhdpi"
mkdir -p "$local_file_path/mipmap-xxhdpi"
mkdir -p "$local_file_path/mipmap-xhdpi"
mkdir -p "$local_file_path/mipmap-mdpi"
mkdir -p "$local_file_path/mipmap-hdpi"

# Download the image using curl
curl -o "$filename" "$image_url"
curl -o "$file_path" "$keystore_url"

# Check if the download was successful
if [ $? -ne 0 ]; then
  echo "Failed to download the image."
  exit 1
fi

# Extract arguments
file_name="keystore.properties"
store_file="keystore.jks"
store_password=$3
key_alias=$4
key_password=$5

# Create the file and add details
cat <<EOF > "$file_name"
storeFile=$store_file
storePassword=$store_password
keyAlias=$key_alias
keyPassword=$key_password
EOF

echo "File $file_name created with the following details:"
echo "storeFile=$store_file"
echo "storePassword=$store_password"
echo "keyAlias=$key_alias"
echo "keyPassword=$key_password"

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
