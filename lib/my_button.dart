import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'my_provider.dart';

/// Custom button widget
/// For this to work, each button must have his own ID to identify it and properly change the color.
/// This example makes use of Riverpod as state manager to keep track of which button (ID) was pressed
class MyButton extends ConsumerWidget {
  final Widget child;
  final VoidCallback onPressed;
  final int id;

  const MyButton({super.key, required this.onPressed, required this.child, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(buttonState);

    return MaterialButton(
      onPressed: () {
        onPressed();
        // Sets this button ID as the current pressed button
        ref.read(buttonState.notifier).changeIt(id);
      },
      color: notifier == id ? Colors.red : Colors.white,
      child: child,
    );
  }
}
