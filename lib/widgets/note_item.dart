import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';
import 'package:intl/intl.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  Future<void> _openEditor(BuildContext context) async {
    final wasUpdated = await Navigator.of(
      context,
    ).push<bool>(MaterialPageRoute(builder: (_) => EditNoteView(note: note)));
    if (wasUpdated == true && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Note updated.')));
    }
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete note?'),
        content: Text('“${note.title}” will be permanently deleted.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (shouldDelete != true || !context.mounted) return;
    final wasDeleted = await context.read<NotesCubit>().deleteNote(note);
    if (wasDeleted && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Note deleted.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Edit ${note.title}',
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _openEditor(context),
        child: Ink(
          padding: const EdgeInsets.only(bottom: 24, top: 24, left: 16),
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              ListTile(
                title: Text(
                  note.title,
                  style: const TextStyle(color: Colors.black, fontSize: 26),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    note.subTitle,
                    style: TextStyle(
                      color: Colors.black.withValues(alpha: .4),
                      fontSize: 18,
                    ),
                  ),
                ),
                trailing: PopupMenuButton<String>(
                  tooltip: 'Note actions',
                  iconColor: Colors.black,
                  onSelected: (action) {
                    if (action == 'edit') _openEditor(context);
                    if (action == 'delete') _confirmDelete(context);
                  },
                  itemBuilder: (_) => const [
                    PopupMenuItem(
                      value: 'edit',
                      child: ListTile(
                        leading: Icon(Icons.edit_outlined),
                        title: Text('Edit'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: ListTile(
                        leading: Icon(Icons.delete_outline),
                        title: Text('Delete'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Text(
                  DateFormat('yMMMd').format(DateTime.parse(note.date)),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withValues(alpha: .4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
