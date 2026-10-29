part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

class NotesSuccess extends NotesState {}

class NotesFailure extends NotesState {
  NotesFailure(this.message);

  final String message;
}
