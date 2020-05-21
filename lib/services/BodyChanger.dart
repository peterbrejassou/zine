import 'package:flutter/material.dart';

class BodyChanger with ChangeNotifier {
  Widget _body;

  BodyChanger(this._body);

  getBody() => _body;

  setBody(Widget body) {
    _body = body;

    notifyListeners();
  }
}
