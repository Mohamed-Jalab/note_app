import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  void addNote(NoteModel note) async {
    try {
      emit(AddNoteLoading());
      await Hive.box<NoteModel>('notes_box').add(note);
      emit(AddNoteSuccess());
    } on HiveError catch (error) {
      emit(AddNoteFailure("HiveError: ${error.message}"));
    } catch (error) {
      emit(AddNoteFailure(error.toString()));
    }
  }
}
