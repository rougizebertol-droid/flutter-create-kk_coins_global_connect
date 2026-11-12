# App configuration and release checklist

## Identity

| Setting | Value |
| --- | --- |
| Brand/display name | `K.K Coins Global Connect` |
| Flutter project name | `kk_coins_global_connect` |
| Android application ID | `com.morluto.kkcoinsglobalconnect` |
| iOS bundle identifier | `com.morluto.kkcoinsglobalconnect` |
| Intended GitHub repository | `morluto/kk-coins-global-connect` |

Create a Flutter project with the intended reverse-domain organization and project name:

```bash
flutter create --org com.morluto --project-name kk_coins_global_connect kk_coins_global_connect
```

Set the Android `applicationId` and iOS bundle identifier to `com.morluto.kkcoinsglobalconnect`. Set the platform display name to `K.K Coins Global Connect`. Apply those values in the generated Android and iOS project files; do not assume platform folders exist in this source-only prototype.

## Firebase setup

1. Create a Firebase project in the business owner's account.
2. Register Android app `com.morluto.kkcoinsglobalconnect` and iOS app `com.morluto.kkcoinsglobalconnect` in Firebase Console.
3. Run `flutterfire configure` in the complete Flutter project to generate platform-specific options.
4. Enable Firebase Authentication email/password and configure Firestore.
5. Deploy and test `firestore.rules` using Firebase Emulator Suite before connecting real customer data.
6. Assign owner/admin custom claims only from a trusted Admin SDK environment. Never grant admin rights from the client.

Firebase project IDs and app registration are account-specific. Do not put Admin SDK credentials, signing keys, account numbers, passwords, or provider secrets in this repository or chat. Client Firebase configuration is not authorization; rules and trusted server-side checks are required.

## Payment and shipment safety

- Moniepoint and OPay transfer references or uploaded receipts are not proof of settlement.
- Reconcile transfers against the business account before marking a shipment paid or proceeding with fulfillment.
- Do not expose business account details in public source code; provide them only through an appropriately restricted private configuration/backend.
- Keep an audit trail for owner review and payment status changes.

## Store release checklist

- Complete and test Android and iOS platform projects and bundle/application identifiers.
- Replace demo screens and sample data with Firebase-backed functionality; remove any client-side owner bypass.
- Test authentication, account recovery, authorization rules, and admin workflows using non-production accounts.
- Add privacy policy, support contact, accurate data-collection disclosures, and store listing assets.
- Configure signing and store submission privately in the relevant developer accounts.
- Check the Apple App Store and Google Play listings again before launch; store search results can change and availability may vary by region.

No claim is made here that the app has been submitted to or approved by either store.
