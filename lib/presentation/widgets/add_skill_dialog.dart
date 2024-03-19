import 'package:flutter/material.dart';
class AddSkillDialog extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  AddSkillDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Skill'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(labelText: 'Skill'),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(_controller.text);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}