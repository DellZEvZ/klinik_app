import 'package:flutter_test/flutter_test.dart';

import 'package:untitled/main.dart';

void main() {
  testWidgets('Belum login -> tampil halaman Login', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(sudahLogin: false));

    expect(find.text('Login Admin'), findsOneWidget);
  });

  testWidgets('Sudah login -> tampil Beranda', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(sudahLogin: true));

    expect(find.text('Selamat Datang'), findsOneWidget);
  });
}
