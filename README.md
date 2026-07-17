# GMEXT-GameCenter
Repository for GameMaker's GameCenter Extension

This repository was created with the intent of presenting users with the latest version available of the extension (even previous to marketplace updates) and also provide a way for the community to contribute with bug fixes and feature implementation.

This extension will work on iOS and macOS platforms.

* iOS: `source/GameCenter_gml/extensions/GMGameCenter/source/src/ios/`
* macOS: `source/GameCenter_gml/extensions/GMGameCenter/source/src/native/`

---

## Requirements

This extension wraps Apple's GameKit, so no third-party SDK download is required — GameKit ships as
part of the iOS/macOS SDKs bundled with Xcode. You will need an Apple Developer account
([App Store Connect](https://appstoreconnect.apple.com/)) to configure leaderboards and achievements.

> [!IMPORTANT]
> Enabling the **Game Center** capability (and, if you use saved games, the **iCloud** capability with
> an iCloud container) requires per-platform project configuration in the IDE/Xcode.
>
> Check the [Setup guide](../../wiki/Setup) for the full step-by-step.

---

## Documentation

* Check [the documentation](../../wiki)

The online documentation is regularly updated to ensure it contains the most current information. For those who prefer a different format, we also offer a HTML version. This HTML is directly converted from the GitHub Wiki content, ensuring consistency, although it may follow slightly behind in updates.

We encourage users to refer primarily to the GitHub Wiki for the latest information and updates. The HTML version, included with the extension and within the demo project's data files, serves as a secondary, static reference.

Additionally, if you're contributing new features through PR (Pull Requests), we kindly ask that you also provide accompanying documentation for these features, to maintain the comprehensiveness and usefulness of our resources.

---
