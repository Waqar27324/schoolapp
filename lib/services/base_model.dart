import 'package:flutter/material.dart';
import 'package:schoolphotoapp/utils/enums/view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _state = viewState;
    //   notifyListeners();
    // });
  }
}
