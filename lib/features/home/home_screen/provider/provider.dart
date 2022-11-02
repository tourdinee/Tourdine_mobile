import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchBarText = StateProvider<String>((ref) => "");

class SearchBarText extends ChangeNotifier {
  String _text = '';
  String get text => _text;
  void setText(String value) {
    _text = value;
    notifyListeners();
  }
}
