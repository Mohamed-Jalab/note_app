import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel> notes = [];

  void fetchAllNotes() {
    notes = Hive.box<NoteModel>('notes_box').values.toList().reversed.toList();
    emit(NotesSuccess());
  }

  Future<bool> updateNote({
    required NoteModel note,
    required String title,
    required String content,
  }) async {
    try {
      note
        ..title = title.trim()
        ..subTitle = content.trim();
      await note.save();
      fetchAllNotes();
      return true;
    } catch (error) {
      emit(NotesFailure('Could not update the note: $error'));
      return false;
    }
  }

  Future<bool> deleteNote(NoteModel note) async {
    try {
      await note.delete();
      fetchAllNotes();
      return true;
    } catch (error) {
      emit(NotesFailure('Could not delete the note: $error'));
      return false;
    }
  }
}
