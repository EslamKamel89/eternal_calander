import 'package:eternal_calander/core/widgets/default_scaffold.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultScaffold(
      title: 'Hello world',
      child: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
