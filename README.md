# K.K Coins Global Connect

Flutter application prototype for K.K Coins Global Connect.

## Brand and platform identity

- Display name: `K.K Coins Global Connect`
- Flutter package name: `kk_coins_global_connect`
- Android application ID: `com.morluto.kkcoinsglobalconnect`
- iOS bundle identifier: `com.morluto.kkcoinsglobalconnect`

See [APP_CONFIGURATION.md](APP_CONFIGURATION.md) for platform setup, Firebase configuration, release preparation, and safety notes.

## Current status

This repository contains an app prototype and Firebase setup scaffolding. It is not yet a release-ready app: Firebase platform configuration, real authentication wiring, trusted admin backend, and platform release files must be completed and tested. Transfer receipts and references are unverified claims; do not treat them as payment confirmation.

## Run locally

From the Flutter project directory, run:

```bash
flutter pub get
flutter run
```

Configure Firebase for your own project with FlutterFire CLI before enabling Firebase-backed features. Do not commit service-account credentials, bank details, signing keys, or passwords.
