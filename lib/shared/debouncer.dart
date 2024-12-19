import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer<V extends Object> extends ChangeNotifier {
  Debouncer(V initialValue, {this.duration = const Duration(milliseconds: 500)})
      : _value = initialValue;

  final Duration duration;

  V _value;

  Timer? _timer;

  V get value => _value;

  set value(V newValue) {
    _timer?.cancel();
    if (_value == newValue) {
      return;
    }
    _timer = Timer(duration, () {
      _value = newValue;
      notifyListeners();
    });
  }
}
