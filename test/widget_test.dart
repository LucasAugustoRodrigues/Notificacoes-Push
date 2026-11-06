import 'package:flutter_test/flutter_test.dart';
import 'package:notificacoes_push/main.dart';

void main() {
  testWidgets('mostra o título da Agenda Cultural', (tester) async {
    await tester.pumpWidget(const AgendaApp());
    expect(find.text('Agenda Cultural'), findsOneWidget);
  });
}
