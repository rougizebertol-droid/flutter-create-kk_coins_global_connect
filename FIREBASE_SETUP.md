# Firebase setup and production safety

This repository currently contains a Flutter UI prototype. Its sign-in, owner portal, sample shipment data, and transfer approval screens are not connected to Firebase and must not be used to authorize real users, approve actual payments, or handle live customer data.

## Recommended simple production architecture

- Flutter for Android and iOS.
- Firebase Authentication with email/password and email verification.
- Cloud Firestore for customer profiles, shipments, and transfer submissions.
- Firebase custom claims for the owner/admin role. Never grant the role from the client app.
- A trusted backend (for example, Cloud Functions) to assign roles, validate admin actions, and provide payment account details from private configuration.
- Moniepoint and OPay transfers are manually reconciled against the merchant account. A submitted receipt or reference is only a claim, not proof that funds settled.

## Set up Firebase privately

1. Create a Firebase project in your own Google account.
2. Install FlutterFire CLI and run `flutterfire configure` from the Flutter project directory. This generates `lib/firebase_options.dart` and platform configuration files for your app.
3. Enable Email/Password in Firebase Authentication.
4. Create a Firestore database and deploy `firestore.rules` before testing data access.
5. Create the initial owner user privately, then assign an `admin: true` custom claim using a trusted Admin SDK script or secured Cloud Function. Never put Admin SDK credentials in Flutter, this repository, or chat.
6. Configure account details only through a private backend secret/configuration mechanism. Do not commit them to source code.
7. Test access using Firebase Emulator Suite and non-production accounts before handling real users or payments.

Firebase client configuration is project-specific. Do not send passwords, one-time codes, bank PINs, service-account keys, or payment-provider secrets in chat or commit them to GitHub. Firebase client configuration is not a substitute for authorization; security rules and backend checks are essential.

## Data model outline

- `users/{uid}`: customer profile; customer role only. Admin role comes from a custom claim.
- `shipments/{shipmentId}`: `customerId`, route, shipment details, quote, shipment status, timestamps.
- `transferSubmissions/{submissionId}`: `customerId`, `shipmentId`, provider choice (`moniepoint` or `opay`), transfer reference, review status, timestamps. Avoid storing unnecessary financial or identity data.

## Important release gate

The current sample UI has demo login behavior and a publicly accessible owner entry point. Remove that demo behavior and use Firebase Authentication plus the server-issued admin custom claim before any public beta. No account should be marked paid based only on a user-uploaded image or a client-side action. Verify settlement against the business account first.
