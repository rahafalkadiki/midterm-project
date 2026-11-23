import 'package:flutter_test/flutter_test.dart';
import 'package:brew_bean/main.dart';

void main() {
  testWidgets('Brew & Bean app starts successfully', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BrewBeanApp());

    expect(find.text('Brew & Bean'), findsOneWidget);
  });
}
