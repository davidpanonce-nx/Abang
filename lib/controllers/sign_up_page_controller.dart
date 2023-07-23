import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPageController extends ChangeNotifier {
  SignUpPageController._privateConstructor();

  static final SignUpPageController _signUpPageController =
      SignUpPageController._privateConstructor();

  factory SignUpPageController() {
    return _signUpPageController;
  }
  int _currentPage = 1;

  int get currentPage => _currentPage;

  setCurrentPage(String param) {
    if (param == "Next") {
      if (_currentPage <= 4) {
        _currentPage++;
      }
    } else {
      if (_currentPage > 1) {
        _currentPage--;
      }
    }
    notifyListeners();
  }

  //For location
  String? _region;
  String? _province;
  String? _city;
  String? _barangay;
  List<String> _regions = [];
  List<String> _provinces = [];
  List<String> _cities = [];
  List<String> _barangays = [];
  Map<String, dynamic> _mappedData = {};
  Map<String, dynamic> _mappedProvinceData = {};
  Map<String, dynamic> _mappedCityData = {};

  String? get region => _region;
  String? get province => _province;
  String? get city => _city;
  String? get barangay => _barangay;
  List<String> get regions => _regions;
  List<String> get provinces => _provinces;
  List<String> get cities => _cities;
  List<String> get barangays => _barangays;

  void setRegion(String? region) {
    _region = region;
    notifyListeners();
  }

  void setProvice(String? province) {
    _province = province;
    notifyListeners();
  }

  void setCity(String? city) {
    _city = city;
    notifyListeners();
  }

  void setBarangay(String? barangay) {
    _barangay = barangay;
    notifyListeners();
  }

  void clearProvinceData() {
    _provinces.clear();
    notifyListeners();
  }

  void clearCityData() {
    _cities.clear();
    notifyListeners();
  }

  void clearBarangayData() {
    _barangays.clear();
    notifyListeners();
  }

  setValuesToDefault() {
    _currentPage = 1;
    _region = null;
    _province = null;
    _city = null;
    _barangay = null;
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/locations.json');
    final data = await json.decode(response);

    _mappedData = data;

    List<String> temp = [];
    for (var keys in _mappedData.keys) {
      temp.add(keys);
    }
    _regions = temp;
    _regions.sort((a, b) =>
        a.toString().toLowerCase().compareTo(b.toString().toLowerCase()));
    notifyListeners();
  }

  void getNCRcities(String region) {
    Map<String, dynamic> temp;
    List<String> tempCities = [];
    temp = _mappedData[region]["cities"];
    for (var keys in temp.keys) {
      tempCities.add(keys);
    }
    _cities = tempCities;
    _cities.sort((a, b) =>
        a.toString().toLowerCase().compareTo(b.toString().toLowerCase()));
    notifyListeners();
  }

  void getNCRbarangays(String region, String city) {
    List<String> tempBarangays = [];
    for (var bar in _mappedData[region]["cities"][city]) {
      tempBarangays.add(bar);
    }

    if (_city == "City of Caloocan" || _city == "Pasay City") {
      List<int> nums = [];
      List<String> sorted = [];
      for (var barangay in tempBarangays) {
        nums.add(int.parse(barangay.split(" ").last));
      }
      nums.sort();
      if (nums.length == tempBarangays.length) {
        for (var num in nums) {
          sorted.add("Barangay ${num.toString()}");
        }
      }

      _barangays = sorted;
    } else if (_city == "City of Manila") {
      List<int> nums = [];
      List<String> sorted = [];
      List<int> withExtensions = [];
      int? numChecker;
      for (var barangay in tempBarangays) {
        numChecker = int.tryParse(barangay.split(" ").last);
        if (numChecker == null) {
          String temp;
          String temp_1;
          int num;
          temp = barangay.split(" ").last;
          temp_1 = temp.split("-").first;
          num = int.parse(temp_1);

          withExtensions.add(num);
          nums.add(num);
        } else {
          nums.add(numChecker);
        }
      }
      nums.sort();

      int count = 0;
      if (nums.length == tempBarangays.length) {
        for (var num in nums) {
          for (var ext in withExtensions) {
            if (ext == num) {
              count++;
            }
          }
          if (count > 1) {
            count = 0;
            sorted.add("Barangay ${num.toString()}-A");
          } else {
            sorted.add("Barangay ${num.toString()}");
          }
        }
      }

      _barangays = sorted;
    } else {
      _barangays = tempBarangays;
      _barangays.sort((a, b) =>
          a.toString().toLowerCase().compareTo(b.toString().toLowerCase()));
    }
    notifyListeners();
  }

  void getProvinces(String region) {
    _mappedProvinceData = _mappedData[region];
    List<String> temp = [];
    for (var keys in _mappedProvinceData.keys) {
      temp.add(keys);
    }
    _provinces = temp;
    _provinces.sort((a, b) =>
        a.toString().toLowerCase().compareTo(b.toString().toLowerCase()));
    notifyListeners();
  }

  void getCities(String province) {
    _mappedCityData = _mappedProvinceData[province];
    List<String> temp = [];
    for (var keys in _mappedCityData.keys) {
      temp.add(keys);
    }
    _cities = temp;
    _cities.sort((a, b) =>
        a.toString().toLowerCase().compareTo(b.toString().toLowerCase()));
    notifyListeners();
  }

  void getBarangays(String city) {
    List<String> temp = [];
    for (var bar in _mappedCityData[city]) {
      temp.add(bar);
    }
    _barangays = temp;
    _barangays.sort((a, b) =>
        a.toString().toLowerCase().compareTo(b.toString().toLowerCase()));
    notifyListeners();
  }

  //Signature Pad Vars
  bool _isSigned = false;
  Uint8List? _signatureData;
  bool _validate = false;

  bool get isSigned => _isSigned;
  Uint8List get signatureData => _signatureData!;
  bool get validate => _validate;

  setValidate(val) {
    _validate = val;
    notifyListeners();
  }

  setIsSigned(val) {
    _isSigned = val;
  }

  setSignatureData(Uint8List data) {
    _signatureData = data;
    notifyListeners();
  }

  clearSignatureData() {
    _isSigned = false;
    _signatureData = null;
  }

  //SignUp

  bool _isLoading = false;
  String _errorMessage = "";

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  setIsLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  setErrorMessage(val) {
    _errorMessage = val;
    notifyListeners();
  }

  setRuntimeDataToDefault() {
    clearSignatureData();
    setValuesToDefault();
    _isLoading = false;
    _errorMessage = "";
  }
}
