import 'package:flutter/material.dart';
import 'package:mardi_gras/common/models/base.response.dart';

class BaseViewModel extends ChangeNotifier {
  final Map<int, bool> _busyStates = <int, bool>{};
  bool _isBusy = false;
  bool get isBusy => _isBusy;
  setBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  bool busy(Object? object) => _busyStates[object.hashCode] ?? false;

  bool get anyObjectsBusy => _busyStates.values.any((busy) => busy);

  void setBusyForObject(Object? object, bool value) {
    _busyStates[object.hashCode] = value;
    notifyListeners();
  }

  final Map<int, BaseResponse> _errorStates = <int, BaseResponse>{};
  BaseResponse? error(Object? object) => _errorStates[object.hashCode];

  /// Returns the error existence status of the ViewModel
  bool get hasError => error(this) != null;

  /// Returns the error status of the ViewModel
  BaseResponse? get modelError => error(this);

  /// Clears all the errors
  void clearErrors() {
    _errorStates.clear();
  }

  /// Returns a boolean that indicates if the ViewModel has an error for the key
  bool hasErrorForKey(Object key) => error(key) != null;

  /// Sets the error for the ViewModel
  void setError(BaseResponse error) {
    setErrorForObject(this, error);
  }

  void setErrorForModelOrObject(BaseResponse value, {Object? key}) {
    if (key != null) {
      setErrorForObject(key, value);
    } else {
      setErrorForObject(this, value);
    }
  }

  /// Sets the error state for the object equal to the value passed in and notifies Listeners
  /// If you're using a primitive type the value SHOULD NOT BE CHANGED, since Hashcode uses == value
  void setErrorForObject(Object object, BaseResponse value) {
    _errorStates[object.hashCode] = value;
    notifyListeners();
  }
}
