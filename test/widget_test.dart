import 'package:flutter_test/flutter_test.dart';
import 'package:seoulmate/main.dart';

void main() {
  testWidgets('renders the SeoulMate application shell', (tester) async {
    await tester.pumpWidget(const SeoulMateApp());

    expect(find.text('SeoulMate'), findsOneWidget);
  });
}
