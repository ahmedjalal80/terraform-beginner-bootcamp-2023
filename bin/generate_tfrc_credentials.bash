#!/usr/bin/env bash

TARGET_DIR="/home/gitpod/.terraform.d"
TARGET_FILE="credentials.tfrc.json"

# Check if TERRAFORM_CLOUD_TOKEN is set
if [ -z "$TERRAFORM_CLOUD_TOKEN" ]; then
  echo "Error: TERRAFORM_CLOUD_TOKEN environment variable is not set."
  exit 1
fi

# Check if directory exists, if not, create it
if [ ! -d "$TARGET_DIR" ]; then
  mkdir -p "$TARGET_DIR"
fi
#Generate credentials.tfrc.json with the token

cat > "$TARGET_DIR/$TARGET_FILE" << EOF
{
  "credentials": {
    "app.terraform.io": {
      "token": "$TERRAFORM_CLOUD_TOKEN"
    }
  }
}
EOF

echo "$TARGET_DIR/$TARGET_FILE has been generated"

