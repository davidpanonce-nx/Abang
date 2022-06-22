import 'package:flutter/material.dart';

class JoinHouseCodeController extends ChangeNotifier {
  DateTime? _billingDate;

  DateTime? get billingDate => _billingDate;

  void setBillingDate(val) {
    _billingDate = val;
    notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setIsLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  bool? _hasError;

  bool? get hasError => _hasError;

  void setHasError(val) {
    _hasError = val;
    notifyListeners();
  }
}
