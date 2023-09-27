import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';
import 'package:intl/intl.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>  EditNoteView(note: note),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 24, top: 24, left: 16),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            ListTile(
              title: Text(note.title,
                  style: const TextStyle(color: Colors.black, fontSize: 26)),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(note.subTitle,
                    style: TextStyle(
                        color: Colors.black.withOpacity(.4), fontSize: 18)),
              ),
              trailing: IconButton(
                icon: const Icon(FontAwesomeIcons.trash,
                    size: 24, color: Colors.black),
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(DateFormat('yMMMd').format(DateTime.parse(note.date)),
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(.4))),
            ),
          ],
        ),
      ),
    );
  }
}
