import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';

import 'custom_app_bar.dart';
import 'custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.subTitle);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _saveNote() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final wasSaved = await context.read<NotesCubit>().updateNote(
          note: widget.note,
          title: _titleController.text,
          content: _contentController.text,
        );
    if (wasSaved && mounted) Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16),
      child: Column(
        children: [
          CustomAppBar(onTap: _saveNote, icon: Icons.check, title: 'Edit Note'),
          const SizedBox(height: 20),
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  CustomTextField(
                    controller: _titleController,
                    textInputAction: TextInputAction.next,
                    hintText: 'Write a title to your note',
                    labelText: 'Title',
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: _contentController,
                    maxLines: 5,
                    hintText: 'Write content for your note',
                    labelText: 'Content',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
