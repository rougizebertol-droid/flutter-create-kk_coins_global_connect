import 'package:flutter_test/flutter_test.dart';
import 'package:kk_coins_global_connect/main.dart';

void main() {
  testWidgets('app renders the customer navigation and prototype notice', (tester) async {
    await tester.pumpWidget(const KkCoinsGlobalConnectApp());

    expect(find.text('K.K Coins Global Connect'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Shipments'), findsOneWidget);
    expect(find.text('Account'), findsOneWidget);
    expect(find.textContaining('Prototype preview'), findsOneWidget);
  });

  testWidgets('account page explains admin access is restricted', (tester) async {
    await tester.pumpWidget(const KkCoinsGlobalConnectApp());
    await tester.tap(find.text('Account'));
    await tester.pumpAndSettle();

    expect(find.text('Owner access is restricted'), findsOneWidget);
  });
}
