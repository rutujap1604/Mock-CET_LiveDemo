import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:mock_cet_demo/main.dart';
import 'package:mock_cet_demo/providers/mock_provider.dart';

void main() {
  testWidgets('App initialization smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MockDataProvider()),
        ],
        child: const MockCETDemoApp(),
      ),
    );

    // Verify that the login screen is shown by checking for the branded header.
    expect(find.text('PVP MockCET'), findsOneWidget);
    
    // Check for the institutional name as well
    expect(
      find.text('Padmabhooshan Vasantraodada Patil Institute of Technology, Budhgaon'), 
      findsOneWidget
    );
  });
}
