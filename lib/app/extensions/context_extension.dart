import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  bool get isDarkModeOn => Theme.of(this).brightness == Brightness.dark;

  Future<T?> pushNamed<T>(final String route, {final dynamic arguments}) =>
      Navigator.of(this).pushNamed<T>(route, arguments: arguments);

  void pop<T>({final T? argument}) => Navigator.of(this).pop(argument);
}
