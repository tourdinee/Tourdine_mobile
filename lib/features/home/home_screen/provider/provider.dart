import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarText extends StateNotifier<String> {
  SearchBarText(super.state);

  void updateText(String text) {
    state = text;
  }
}

final myProvider = StateNotifierProvider((ref) {
  return SearchBarText("");
});

final text = ValueNotifier("_value");

class IsFilterNotifier extends StateNotifier<bool> {
  IsFilterNotifier() : super(false);

  void updateFilter() {
    state = !state;
  }
}

final isFilterProvider = StateNotifierProvider((ref) => IsFilterNotifier());
