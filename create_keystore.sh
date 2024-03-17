#!/bin/bash

# Check if arguments are provided
if [ $# -lt 5 ]; then
  echo "Usage: $0 <file_name> <store_file> <store_password> <key_alias> <key_password>"
  exit 1
fi

# Extract arguments
file_name="keystore.properties"
store_file="keystore.jks"
store_password=$1
key_alias=$2
key_password=$3

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
