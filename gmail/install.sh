#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

if [ -d "/Applications/GMail.app" ]; then
  # Control will enter here if $DIRECTORY exists.
  echo "GMail App already exists! Skipping ..."
else 
  # Use nativefier (https://github.com/jiahaog/nativefier) to create a standalone GMail app
  npx nativefier \
    --name "GMail" \
    --counter \
    --single-instance \
    --internal-urls ".*?\.mail\.google\.com*?" \
    --icon ./gmail.icns \
    --title-bar-style hiddenInset \
    --inject ./style.css \
    "https://mail.google.com/"

  # "Install"
  cp -R GMail-darwin-x64/GMail.app /Applications
fi
