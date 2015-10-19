#!/bin/sh
security create-keychain -p travis ios-build.keychain
security import ./scripts/certs/ios_distribution.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./scripts/certs/dev.p12 -k ~/Library/Keychains/ios-build.keychain -P $KEY_PASSWORD -T /usr/bin/codesign
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp ./scripts/profiles/$DEV_PROFILE_NAME.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/
cp ./scripts/profiles/$DIST_PROFILE_NAME.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/
