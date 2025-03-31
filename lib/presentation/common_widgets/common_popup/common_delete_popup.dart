import 'package:flutter/material.dart';

import '../../../core/constant/strings.dart';

class CommonDeletePopup {
  void showDeleteConfirmationDialog(
      BuildContext context, int index, VoidCallback onDelete) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(Strings.delete),
          content: const Text(Strings.deleteConfirmation),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(Strings.cancel),
            ),
            TextButton(
              onPressed: () {
                onDelete(); // Call the delete callback
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(Strings.delete),
            ),
          ],
        );
      },
    );
  }
}