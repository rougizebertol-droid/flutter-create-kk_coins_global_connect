import 'package:flutter_test/flutter_test.dart';
import 'package:kk_coins_global_connect/main.dart';

void main() {
  testWidgets('app renders branding text', (WidgetTester tester) async {
    await tester.pumpWidget(const KkCoinsGlobalConnectApp());

    expect(find.text('K.K Coins Global Connect'), findsWidgets);
  });
}
