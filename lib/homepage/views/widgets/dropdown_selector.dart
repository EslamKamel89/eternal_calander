import 'package:flutter/material.dart';

class DropdownSelector extends StatefulWidget {
  const DropdownSelector({super.key, required this.items});
  final List<String> items;
  @override
  createState() => _DropdownSelectorState();
}

class _DropdownSelectorState extends State<DropdownSelector> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      // hint: const Text('Select an option'),
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
