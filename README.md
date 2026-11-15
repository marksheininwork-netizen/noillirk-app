# Noillirk iOS Web Wrapper Starter

Minimal SwiftUI + WKWebView iOS project for the existing App Store Connect Noillirk record.

- App Store Connect bundle ID: `com.mariasheinin.noillirk`
- Content: deliberately absent as requested; native "Coming soon" placeholder
- Website URL: intentionally empty until a real HTTPS game is available
- Deployment: iOS 16.0+; marketing version 1.0.0 (build 1)

## Build on a Mac
1. Install Xcode and XcodeGen (`brew install xcodegen`).
2. Run `swift scripts/make-icon.swift Noillirk` to generate the placeholder icon.
3. Run `xcodegen generate` and open `Noillirk.xcodeproj`.
4. Choose the matching Apple Developer team in Signing & Capabilities.
5. After building, test the app and add the real game and HTTPS URL to `Noillirk/ContentView.swift`.
6. To create an **App Store-uploadable** IPA, archive in Xcode and export using an Apple distribution signing identity and provisioning profile for `com.mariasheinin.noillirk`.

The GitHub Actions workflow runs only on manual dispatch and produces a clearly marked **UNSIGNED test IPA**, not an App Store uploadable file. It uses a GitHub macOS runner; charges or minutes may apply depending on account plan and repository visibility.

**Not ready for App Review:** A placeholder without meaningful functionality may be rejected under Apple's minimum functionality rules. Full game content, privacy declarations, metadata, accessibility checks and valid signing are required first.
