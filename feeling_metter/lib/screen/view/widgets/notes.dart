import 'package:feeling_metter/provider/form_provider.dart';
import 'package:feeling_metter/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesSection extends StatelessWidget {
  final TextEditingController notesController;

  NotesSection({required this.notesController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Set a fixed height for the SizedBox
      width: MediaQuery.of(context).size.width * 0.9, // Set a fixed width
      child: TextFormField(
        controller: notesController,
        decoration: const InputDecoration(
          labelText: 'Notes',
          labelStyle: AppStyles.whatDOYouFeel,
        ),
        onChanged: (value) {
          // Update the provider with the new note
          Provider.of<MoodFormProvider>(context, listen: false).updateNotes(value);
          print('Notes updated: $value');
        },
      ),
    );
  }
}

