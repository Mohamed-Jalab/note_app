import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/add_note_cubit/cubit/add_note_cubit.dart';
import '../models/note_model.dart';
import 'custom_button.dart';
import 'custom_divider.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formState = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formState,
      child: Column(
        children: [
          const SizedBox(height: 10),
          const CustomDivider(),
          const SizedBox(height: 20),
          CustomTextField(
            hintText: 'Write a title to your note',
            labelText: 'Title',
            textInputAction: TextInputAction.next,
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            maxLines: 5,
            hintText: 'Write a content to your note',
            labelText: 'Content',
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(height: 32),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading,
                onTap: () {
                  if (formState.currentState!.validate()) {
                    formState.currentState!.save();
                    NoteModel note = NoteModel(
                      title: title!.trim(),
                      subTitle: subTitle!.trim(),
                      date: DateTime.now().toIso8601String(),
                      color: Colors.amber.toARGB32(),
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                  }
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                },
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
