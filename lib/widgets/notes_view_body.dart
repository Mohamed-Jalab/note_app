import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/widgets/notes_list_view.dart';

import 'custom_app_bar.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is NotesFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: const Padding(
        padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 16),
        child: Column(
          children: [
            CustomAppBar(icon: Icons.note_alt_outlined, title: 'Notes'),
            SizedBox(height: 10),
            Expanded(child: NotesListView()),
          ],
        ),
      ),
    );
  }
}
