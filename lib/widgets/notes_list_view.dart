import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        final notes = context.read<NotesCubit>().notes;
        return notes.isEmpty
            ? const _EmptyNotesView()
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

class _EmptyNotesView extends StatelessWidget {
  const _EmptyNotesView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.note_add_outlined, size: 64, color: Colors.white54),
          SizedBox(height: 16),
          Text('No notes yet', style: TextStyle(fontSize: 22)),
          SizedBox(height: 6),
          Text(
            'Tap + to create your first note.',
            style: TextStyle(color: Colors.white60),
          ),
        ],
      ),
    );
  }
}
