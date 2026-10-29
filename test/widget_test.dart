import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_app/widgets/custom_text_field.dart';

void main() {
  testWidgets('note fields reject blank input', (tester) async {
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Form(
            key: formKey,
            child: const CustomTextField(labelText: 'Title'),
          ),
        ),
      ),
    );

    formKey.currentState!.validate();
    await tester.pump();
    expect(find.text('Title is required'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'My note');
    formKey.currentState!.validate();
    await tester.pump();
    expect(find.text('Title is required'), findsNothing);
  });
}
