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
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16),
      child: Column(
        children: [
          CustomAppBar(
              onTap: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subTitle ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.of(context).pop();
              },
              icon: Icons.check,
              title: 'Edit Note'),
          const SizedBox(height: 20),
          SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  
                  onChanged: (value) {
                    title = value;
                  },
                  hintText: 'Write a title to your note',
                  labelText: 'Title',
                  
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  onChanged: (value) {
                    subTitle = value;
                  },
                  maxLines: 5,
                  hintText: 'Write a content to your note',
                  labelText: 'Content',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
