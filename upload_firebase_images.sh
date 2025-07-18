#!/data/data/com.termux/files/usr/bin/bash

# List of Firebase image URLs
urls=(
"https://firebasestorage.googleapis.com/v0/b/your-gift-5c1e5.appspot.com/o/product-icons%2F1734510677-icon-3.webp?alt=media&token=4e9bfd2e-0136-4214-a28c-850d74e0d641"
"https://firebasestorage.googleapis.com/v0/b/your-gift-5c1e5.appspot.com/o/product-icons%2F1734510668-icon-5.webp?alt=media&token=f5e8cf5b-d297-4616-8f11-d85ceb1d6bcc"
"https://firebasestorage.googleapis.com/v0/b/your-gift-5c1e5.appspot.com/o/product-icons%2F1734510644-icon-8.webp?alt=media&token=06db7154-67ac-4ad8-b463-e4eb81e8f38a"
"https://firebasestorage.googleapis.com/v0/b/your-gift-5c1e5.appspot.com/o/product-icons%2FMLBB-Diamond-Pass_Popular-tag%20(2).png?alt=media&token=41f966bd-10c8-488a-8296-0abba8e7cc88"
"https://firebasestorage.googleapis.com/v0/b/your-gift-5c1e5.appspot.com/o/product-icons%2F1734510673-icon-4.webp?alt=media&token=b7556fdf-da8c-4dd6-886d-b6b4c128fc74"
"https://firebasestorage.googleapis.com/v0/b/your-gift-5c1e5.appspot.com/o/product-icons%2F1734510663-icon-6.webp?alt=media&token=cb319897-23d7-45db-9948-cf4af392ad09"
"https://firebasestorage.googleapis.com/v0/b/your-gift-5c1e5.appspot.com/o/product-icons%2FTwilightPass_MLBB.png?alt=media&token=edfa792c-ec0f-48a8-b5ca-0ff832422888"
)

# Go to repo folder
cd ~/www/GITIMG

# Loop and download
for url in "${urls[@]}"; do
  # Extract filename from URL
  filename=$(echo "$url" | sed -E 's/.*product-icons%2F(.*)\?.*/\1/' | sed 's/%20/ /g')
  filename=$(echo "$filename" | tr -d '\r')  # Remove possible carriage returns
  echo "📥 Downloading $filename ..."
  curl -L -o "$filename" "$url"
done

# Commit and push
git add .
git commit -m "Add Firebase images"
git push

echo ""
echo "✅ All images uploaded. Use these CDN links:"
for url in "${urls[@]}"; do
  filename=$(echo "$url" | sed -E 's/.*product-icons%2F(.*)\?.*/\1/' | sed 's/%20/ /g')
  filename=$(echo "$filename" | tr -d '\r')
  echo "https://cdn.jsdelivr.net/gh/ZA4LIFE/my-image-host@main/$filename"
done
