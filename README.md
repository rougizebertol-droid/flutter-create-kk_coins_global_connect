# K.K Coins Global Connect

A simple, professional Flutter foundation for a logistics app for Android and iOS.

## Recommended production setup
This app is structured to support the best simple method for a launch-ready product:
- Flutter app for Android and iOS
- Firebase Authentication for customer sign up and login
- Firestore for users, shipments, and transfer records
- Owner/admin dashboard to approve direct-transfer payments

## Important
Do not store passwords, private API keys, payment credentials, or signing keys in this repository.
Keep all sensitive values in secure Firebase config, environment variables, or your own private deployment settings.

## Run locally
1. Install Flutter and ensure `flutter doctor` passes.
2. Clone the repo and switch to `feature/auth-and-owner-portal`.
3. Run `flutter pub get`.
4. Run `flutter run`.

## Workflows included in this prototype
- Welcome screen and access switch
- Customer sign up and login UI
- Owner / CEO portal screen
- Shipment list dashboard
- Direct transfer approval flow

## Production next steps
- Connect Firebase Auth and Firestore
- Add role-based security rules for customer and owner roles
- Add payment proof upload and approval workflow
- Add order creation, tracking, and admin reporting
- Prepare Android and iOS release configuration
