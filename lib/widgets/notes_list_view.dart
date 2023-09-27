import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/widgets/note_item.dart';

import '../models/note_model.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes?.reversed.toList() ?? [];
        return notes.isEmpty
            ? const Center(child: Text('There is no any note here.', style: TextStyle(fontSize: 22)))
            : ListView.builder(
          itemCount: notes.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: NoteItem(note: notes[index]),
          ),
        );
      },
    );
  }
}
