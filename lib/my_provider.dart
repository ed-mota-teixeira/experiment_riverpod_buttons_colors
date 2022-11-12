import 'package:flutter_riverpod/flutter_riverpod.dart';

final buttonState = StateNotifierProvider<ButtonStateNotifier, int>((ref) {
  return ButtonStateNotifier();
});

class ButtonStateNotifier extends StateNotifier<int> {
  ButtonStateNotifier(): super(-1);

  // Sets this button ID as the current pressed button and notifies widgets
  void changeIt(int newId) {
    state = newId;
  }
}