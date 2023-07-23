import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:abang/view/join/create/create/components/agreements.dart';
import 'package:abang/view/join/create/create/components/other_payments.dart';
import 'package:abang/view/join/create/create/components/payment_inclusions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/join/create/create/components/rules.dart';

class CreateHouseCodeConroller extends ChangeNotifier {
  String? _signatureURL;

  String? get signatureURL => _signatureURL;

  Future<void> cacheSignatureURL(String url) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("signatureURL", url);
  }

  Future<void> getCachedSignature() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _signatureURL = pref.getString("signatureURL");
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setIsLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  int _currentPage = 1;

  int get currentPage => _currentPage;

  setCurrentPage(String param) {
    if (param == "Next") {
      if (_currentPage <= 5) {
        _currentPage++;
      }
    } else {
      if (_currentPage > 1) {
        _currentPage--;
      }
    }
    notifyListeners();
  }

  final List<String> _establishmentType = ["Apartment", "Boarding House"];
  String? _selectedEstablishment;

  String? get selectedEstablishment => _selectedEstablishment;
  List<String> get establishmentType => _establishmentType;

  setSelectedEstablishment(val) {
    _selectedEstablishment = val;
    notifyListeners();
  }

  //For Images
  File? _image1;
  File? _image2;
  File? _image3;
  File? _image4;

  bool? _imageComplete;

  File? get image1 => _image1;
  File? get image2 => _image2;
  File? get image3 => _image3;
  File? get image4 => _image4;
  bool? get imageComplete => _imageComplete;

  void setImage1(val) {
    _image1 = val;

    notifyListeners();
  }

  void setImage2(val) {
    _image2 = val;
    notifyListeners();
  }

  void setImage3(val) {
    _image3 = val;
    notifyListeners();
  }

  void setImage4(val) {
    _image4 = val;
    notifyListeners();
  }

  void setImageCheck(val) {
    _imageComplete = val;
    notifyListeners();
  }

  void setImagesToNull() {
    _image1 = null;
    _image2 = null;
    _image3 = null;
    _image4 = null;
  }

  Future pickImageFromGallery(int imageNumber) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporaryPath = File(image.path);
      switch (imageNumber) {
        case 1:
          setImage1(imageTemporaryPath);
          break;
        case 2:
          setImage2(imageTemporaryPath);
          break;
        case 3:
          setImage3(imageTemporaryPath);
          break;
        case 4:
          setImage4(imageTemporaryPath);
          break;
        default:
          return null;
      }
    } on PlatformException {
      log("ERROR");
      return "An error occured";
    }
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

  // FOR PAYMENTS AND OTHER INCLUSIONS

  Map<String, dynamic>? _paymentInclusionData;
  Map<String, dynamic>? _otherPaymentsData;
  Map<String, dynamic> _paymentInclusionWidgets = {};
  final List<Widget> _paymentInclusions = [];
  final List<Widget> _otherPayments = [];
  Map<String, dynamic> _otherPaymentsWidgets = {};
  Map<String, dynamic> _paymentDescControllers = {};
  Map<String, dynamic> _paymentValueControllers = {};
  Map<String, dynamic> _otherPaymentDescControllers = {};
  Map<String, dynamic> _otherPaymentValueControllers = {};

  Map<String, dynamic>? get otherPaymentsData => _otherPaymentsData;
  Map<String, dynamic>? get paymentInclusionData => _paymentInclusionData;
  Map<String, dynamic> get paymentInclusionWidgets => _paymentInclusionWidgets;
  List<Widget> get paymentInclusions => _paymentInclusions;
  List<Widget> get otherPayments => _otherPayments;

  Map<String, dynamic> get otherPaymentsWidgets => _otherPaymentsWidgets;
  Map<String, dynamic> get paymentDescControllers => _paymentDescControllers;
  Map<String, dynamic> get paymentValueControllers => _paymentValueControllers;
  Map<String, dynamic> get otherPaymentDescControllers =>
      _otherPaymentDescControllers;
  Map<String, dynamic> get otherPaymentValueControllers =>
      _otherPaymentValueControllers;

  /* PAYMENT INCLUSIONS */

  void compilePaymentInclusionData() {
    Map<String, dynamic> temp = {};
    _paymentInclusionWidgets.forEach((key, value) {
      temp.addAll({
        value["index"].toString(): {
          "description": value["widget"].descController.text.trim(),
          "value": value["widget"].valueController.text.trim(),
        }
      });
    });
    _paymentInclusionData = temp;
  }

  void addPaymentInclusions(
      String id, PaymentInclusion paymentInclusion, int index) {
    _paymentInclusionWidgets.addAll(
      {
        id: {
          "index": index,
          "widget": paymentInclusion,
        }
      },
    );

    buildPaymentInclusions();
    notifyListeners();
  }

  void addPaymentInlcusionController(
    String id,
    int index,
    TextEditingController descController,
    TextEditingController valueController,
  ) {
    _paymentDescControllers.addAll(
      {
        id: {
          "index": index,
          "controller": descController,
        },
      },
    );
    _paymentValueControllers.addAll(
      {
        id: {
          "index": index,
          "controller": valueController,
        },
      },
    );

    notifyListeners();
  }

  void buildPaymentInclusions() {
    _paymentInclusions.clear();
    _paymentInclusionWidgets.forEach((key, value) {
      _paymentInclusions.add(value["widget"]);
    });
  }

  void removePaymentInclusion(String id) {
    _paymentInclusionWidgets.removeWhere((key, value) => key == id);
    _paymentDescControllers.removeWhere((key, value) => key == id);
    _paymentValueControllers.removeWhere((key, value) => key == id);

    List<String> widgetKeys = [];
    Map<String, dynamic> tempWidgets = {};
    Map<String, dynamic> descControllers = {};
    Map<String, dynamic> valueControllers = {};

    for (var key in _paymentInclusionWidgets.keys) {
      widgetKeys.add(key);
    }

    for (int i = 0; i < widgetKeys.length; i++) {
      tempWidgets.addAll({
        widgetKeys[i]: {
          "index": i + 1,
          "widget": _paymentInclusionWidgets[widgetKeys[i]]["widget"],
        }
      });
      descControllers.addAll({
        widgetKeys[i]: {
          "index": i + 1,
          "widget": _paymentDescControllers[widgetKeys[i]]["controller"],
        }
      });
      valueControllers.addAll({
        widgetKeys[i]: {
          "index": i + 1,
          "widget": _paymentValueControllers[widgetKeys[i]]["controller"],
        }
      });
    }

    _paymentInclusionWidgets.clear();
    _paymentDescControllers.clear();
    _paymentValueControllers.clear();

    _paymentInclusionWidgets = tempWidgets;
    _paymentDescControllers = descControllers;
    _paymentValueControllers = valueControllers;

    buildPaymentInclusions();
    notifyListeners();
  }

  /* OTHER PAYMENTS */

  void compileOtherPaymentsData() {
    Map<String, dynamic> temp = {};
    _otherPaymentsWidgets.forEach((key, value) {
      temp.addAll({
        value["index"].toString(): {
          "description": value["widget"].descController.text.trim(),
          "value": value["widget"].valueController.text.trim(),
        }
      });
    });
    _otherPaymentsData = temp;
  }

  void addOtherPayments(String id, OtherPayments otherpayments, int index) {
    _otherPaymentsWidgets.addAll(
      {
        id: {
          "index": index,
          "widget": otherpayments,
        }
      },
    );
    buildOtherPayments();
    notifyListeners();
  }

  void addOtherPaymentsControllers(
    String id,
    int index,
    TextEditingController descController,
    TextEditingController valueController,
  ) {
    _otherPaymentDescControllers.addAll(
      {
        id: {
          "index": index,
          "controller": descController,
        },
      },
    );
    _otherPaymentValueControllers.addAll(
      {
        id: {
          "index": index,
          "controller": valueController,
        },
      },
    );
    notifyListeners();
  }

  void buildOtherPayments() {
    _otherPayments.clear();
    _otherPaymentsWidgets.forEach((key, value) {
      _otherPayments.add(value["widget"]);
    });
  }

  void removeOtherPayments(String id) {
    _otherPaymentsWidgets.removeWhere((key, value) => key == id);
    _otherPaymentDescControllers.removeWhere((key, value) => key == id);
    _otherPaymentValueControllers.removeWhere((key, value) => key == id);

    List<String> widgetKeys = [];
    Map<String, dynamic> tempWidgets = {};
    Map<String, dynamic> descControllers = {};
    Map<String, dynamic> valueControllers = {};

    for (var key in _otherPaymentsWidgets.keys) {
      widgetKeys.add(key);
    }

    for (int i = 0; i < widgetKeys.length; i++) {
      tempWidgets.addAll({
        widgetKeys[i]: {
          "index": i + 1,
          "widget": _otherPaymentsWidgets[widgetKeys[i]]["widget"],
        }
      });
      descControllers.addAll({
        widgetKeys[i]: {
          "index": i + 1,
          "widget": _otherPaymentDescControllers[widgetKeys[i]]["controller"],
        }
      });
      valueControllers.addAll({
        widgetKeys[i]: {
          "index": i + 1,
          "widget": _otherPaymentValueControllers[widgetKeys[i]]["controller"],
        }
      });
    }

    _otherPaymentsWidgets.clear();
    _otherPaymentDescControllers.clear();
    _otherPaymentValueControllers.clear();

    _otherPaymentsWidgets = tempWidgets;
    _otherPaymentDescControllers = descControllers;
    _otherPaymentValueControllers = valueControllers;

    buildOtherPayments();
    notifyListeners();
  }

  // FOR RULES AND AGREEMENTS

  Map<String, dynamic>? _rulesData;
  Map<String, dynamic> _rulesWidgets = {};
  final List<Widget> _rules = [];
  Map<String, dynamic>? _agreementsData;
  Map<String, dynamic> _agreementsWidgets = {};
  final List<Widget> _agreements = [];
  Map<String, dynamic> _rulesControllers = {};
  Map<String, dynamic> _agreementsControllers = {};

  Map<String, dynamic>? get rulesData => _rulesData;
  Map<String, dynamic> get rulesWidgets => _rulesWidgets;
  List<Widget> get rules => _rules;
  Map<String, dynamic>? get agreementsData => _agreementsData;
  Map<String, dynamic> get agreementsWidgets => _agreementsWidgets;
  List<Widget> get agreements => _agreements;
  Map<String, dynamic> get rulesControllers => _rulesControllers;
  Map<String, dynamic> get agreementsControllers => _agreementsControllers;

  //RULES

  void compileRulesData() {
    Map<String, dynamic> temp = {};
    _rulesWidgets.forEach((key, value) {
      temp.addAll({
        value["index"].toString(): {
          "description": value["widget"].descController.text.trim(),
        }
      });
    });
    _rulesData = temp;
  }

  void addRules(String id, int index, Rules rules) {
    _rulesWidgets.addAll({
      id: {
        "index": index,
        "widget": rules,
      }
    });

    buildRules();
    notifyListeners();
  }

  void addRulesControllers(
      String id, int index, TextEditingController controller) {
    _rulesControllers.addAll({
      id: {
        "index": index,
        "controller": controller,
      }
    });
    notifyListeners();
  }

  void buildRules() {
    _rules.clear();
    _rulesWidgets.forEach((key, value) {
      _rules.add(value["widget"]);
    });
  }

  void removeRules(String id) {
    _rulesWidgets.removeWhere((key, value) => key == id);
    _rulesControllers.removeWhere((key, value) => key == id);

    List<String> widgetKeys = [];
    Map<String, dynamic> tempWidgets = {};
    Map<String, dynamic> tempControllers = {};

    for (var key in _rulesWidgets.keys) {
      widgetKeys.add(key);
    }

    for (int i = 0; i < widgetKeys.length; i++) {
      tempWidgets.addAll(
        {
          widgetKeys[i]: {
            "index": i + 1,
            "widget": _rulesWidgets[widgetKeys[i]]["widget"]
          }
        },
      );
      tempControllers.addAll(
        {
          widgetKeys[i]: {
            "index": i + 1,
            "controller": _rulesControllers[widgetKeys[i]]["controller"],
          }
        },
      );
    }

    _rulesWidgets.clear();
    _rulesControllers.clear();

    _rulesWidgets = tempWidgets;
    _rulesControllers = tempControllers;

    buildRules();
    notifyListeners();
  }

  //AGREEMENTS
  void compileAgreementsData() {
    Map<String, dynamic> temp = {};
    _agreementsWidgets.forEach((key, value) {
      temp.addAll({
        value["index"].toString(): {
          "description": value["widget"].descController.text.trim(),
        }
      });
    });
    _agreementsData = temp;
  }

  void addAgreements(String id, int index, Agreements agreements) {
    _agreementsWidgets.addAll({
      id: {
        "index": index,
        "widget": agreements,
      }
    });

    buildAgreements();
    notifyListeners();
  }

  void addAgreementsControllers(
      String id, int index, TextEditingController controller) {
    _agreementsControllers.addAll({
      id: {
        "index": index,
        "controller": controller,
      }
    });
    notifyListeners();
  }

  void buildAgreements() {
    _agreements.clear();
    _agreementsWidgets.forEach((key, value) {
      _agreements.add(value["widget"]);
    });
  }

  void removeAgreements(String id) {
    _agreementsWidgets.removeWhere((key, value) => key == id);
    _agreementsControllers.removeWhere((key, value) => key == id);

    List<String> widgetKeys = [];
    Map<String, dynamic> tempWidgets = {};
    Map<String, dynamic> tempControllers = {};

    for (var key in _agreementsWidgets.keys) {
      widgetKeys.add(key);
    }

    for (int i = 0; i < widgetKeys.length; i++) {
      tempWidgets.addAll(
        {
          widgetKeys[i]: {
            "index": i + 1,
            "widget": _agreementsWidgets[widgetKeys[i]]["widget"]
          }
        },
      );
      tempControllers.addAll(
        {
          widgetKeys[i]: {
            "index": i + 1,
            "controller": _agreementsControllers[widgetKeys[i]]["controller"],
          }
        },
      );
    }

    _agreementsWidgets.clear();
    _agreementsControllers.clear();

    _agreementsWidgets = tempWidgets;
    _agreementsControllers = tempControllers;

    buildAgreements();
    notifyListeners();
  }

  //CREATE HOUSE CODE
  String? _houseCode;

  String? get houseCode => _houseCode;

  void generateHouseCode(String estName, String numOfRooms) {
    String temp = "";
    String tempEstName = "";
    String tempBarangay = "";

    if (estName.length >= 5) {
      tempEstName = estName.substring(0, 2);
    } else {
      tempEstName = estName;
    }

    if (barangay!.length >= 5) {
      tempBarangay = barangay!.substring(0, 2);
    } else {
      tempBarangay = barangay!;
    }

    temp = tempEstName +
        tempBarangay +
        numOfRooms +
        DateTime.now().month.toString() +
        DateTime.now().day.toString() +
        DateTime.now().year.toString().substring(2, 3);

    _houseCode = temp;
  }

  //SET ALL DATA TO DEFAULT
  void setCreateDataToDefault() {
    _signatureURL = null;
    _currentPage = 1;

    _selectedEstablishment = null;

    _image1 = null;
    _image2 = null;
    _image3 = null;
    _image4 = null;
    _imageComplete = null;

    _region = null;
    _province = null;
    _city = null;
    _barangay = null;

    _paymentInclusionWidgets.clear();
    _paymentInclusionData?.clear();
    _otherPaymentsData?.clear();
    _paymentInclusions.clear();
    _otherPayments.clear();
    _otherPaymentsWidgets.clear();
    _paymentDescControllers.clear();
    _paymentValueControllers.clear();
    _otherPaymentDescControllers.clear();
    _otherPaymentValueControllers.clear();

    _rulesData?.clear();
    _agreementsData?.clear();
    _rulesWidgets.clear();
    _rules.clear();
    _rulesControllers.clear();
    _agreementsWidgets.clear();
    _agreements.clear();
    _agreementsControllers.clear();

    _houseCode = null;
  }
}
