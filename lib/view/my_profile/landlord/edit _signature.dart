import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:abang/components/loading.dart';
import 'package:abang/components/themes.dart';
import 'package:abang/services/firestore_db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../../components/constants.dart';
import '../../../controllers/edit_profile_controller.dart';
import '../../../models/models.dart';

class EditSignature extends StatefulWidget {
  const EditSignature({
    Key? key,
    required this.userData,
  }) : super(key: key);

  final AbangUser userData;
  @override
  State<EditSignature> createState() => _EditSignatureState();
}

class _EditSignatureState extends State<EditSignature>
    with FirestoreDataServices {
  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  List<Color> _strokeColors = <Color>[];
  late double _strokeWidth;
  int _selectedPenIndex = 0;
  Color? _strokeColor;
  Color? _backgroundColor;
  late List<Widget> _strokeColorWidgets;

  @override
  void initState() {
    _backgroundColor = abangColors.abangWhite;
    _addStrokeColors();
    _strokeWidth = 2.0;
    super.initState();
    super.initState();
  }

  @override
  void dispose() {
    _strokeColors.clear();
    super.dispose();
  }

  void _addStrokeColors() {
    _strokeColors = <Color>[];
    _strokeColors.add(abangColors.abangSecondary);
    _strokeColors.add(abangColors.abangYellow);
    _strokeColors.add(abangColors.abangSecondaryAccent);
    _strokeColors.add(abangColors.abangWhite);
  }

  bool _handleOnDrawStart() {
    EditProfileController _editProfileController = EditProfileController();
    _editProfileController.setIsSigned(true);
    return false;
  }

  List<Widget> _addStrokeColorPalettes(StateSetter stateChanged, Size size) {
    _strokeColorWidgets = <Widget>[];
    for (int i = 0; i < _strokeColors.length; i++) {
      _strokeColorWidgets.add(
        Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                  color: abangColors.abangPrimary,
                  width: 1 / mockUpWidth * size.width),
            ),
            child: InkWell(
              onTap: () => stateChanged(
                () {
                  _strokeColor = _strokeColors[i];
                  _selectedPenIndex = i;
                },
              ),
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Icon(Icons.brightness_1,
                        size: 25.0 / mockUpWidth * size.width,
                        color: _strokeColors[i]),
                    if (_selectedPenIndex == i)
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Icon(Icons.check,
                            size: 15.0 / mockUpWidth * size.width,
                            color: abangColors.abangPrimary),
                      )
                    else
                      SizedBox(width: 8 / mockUpWidth * size.width),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return _strokeColorWidgets;
  }

  void _showDrawPad() {
    EditProfileController _editProfileController = EditProfileController();
    _editProfileController.setIsSigned(false);

    showDialog<Widget>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            final size = MediaQuery.of(context).size;
            final textScale = size.width / mockUpWidth;
            return AlertDialog(
              insetPadding: EdgeInsets.symmetric(
                  horizontal: 20 / mockUpWidth * size.width,
                  vertical: 20 / mockUpHeight * size.height),
              backgroundColor: _backgroundColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Draw your signature',
                    textScaleFactor: textScale,
                    style: abangTextStyles.smallTextStyle
                        .copyWith(color: abangColors.abangPrimary),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.clear,
                      color: abangColors.abangPrimary,
                      size: 24 / mockUpWidth * size.width,
                    ),
                  )
                ],
              ),
              titlePadding: const EdgeInsets.all(16.0),
              content: SingleChildScrollView(
                child: SizedBox(
                  width: 349 / mockUpWidth * size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 328 / mockUpWidth * size.width,
                        height: 212 / mockUpHeight * size.height,
                        child: Stack(
                          children: [
                            Container(
                              width: 328 / mockUpWidth * size.width,
                              height: 212 / mockUpHeight * size.height,
                              decoration: BoxDecoration(
                                color: abangColors.abangPrimary,
                                border: Border.all(
                                  color: abangColors.abangYellow,
                                  width: 2 / mockUpWidth * size.width,
                                ),
                              ),
                            ),
                            SfSignaturePad(
                                maximumStrokeWidth: _strokeWidth,
                                strokeColor: _strokeColor,
                                backgroundColor: Colors.transparent,
                                onDrawStart: _handleOnDrawStart,
                                key: _signaturePadKey),
                          ],
                        ),
                      ),
                      SizedBox(height: 24 / mockUpHeight * size.height),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pen Color',
                            textScaleFactor: textScale,
                            style: abangTextStyles.smallTextStyle
                                .copyWith(color: abangColors.abangPrimary),
                          ),
                          SizedBox(
                            width: 119 / mockUpWidth * size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: _addStrokeColorPalettes(setState, size),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 20.0 / mockUpWidth * size.width,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: _handleClearButtonPressed,
                  child: Text(
                    'CLEAR',
                    textScaleFactor: textScale,
                    style: abangTextStyles.smallTextStyle.copyWith(
                      color: abangColors.abangPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                TextButton(
                  onPressed: () {
                    _handleSaveButtonPressed();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'SAVE',
                    textScaleFactor: textScale,
                    style: abangTextStyles.smallTextStyle.copyWith(
                      color: abangColors.abangPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }

  void _handleClearButtonPressed() {
    _signaturePadKey.currentState!.clear();
    EditProfileController _editProfileController = EditProfileController();
    _editProfileController.setIsSigned(false);
  }

  Future<void> _handleSaveButtonPressed() async {
    late Uint8List data;

    final ui.Image imageData =
        await _signaturePadKey.currentState!.toImage(pixelRatio: 3.0);
    final ByteData? bytes =
        await imageData.toByteData(format: ui.ImageByteFormat.png);
    if (bytes != null) {
      data = bytes.buffer.asUint8List();
    }

    EditProfileController _editProfileController = EditProfileController();
    _editProfileController.setSignatureData(data);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    final editProfileController = Provider.of<EditProfileController>(context);
    return editProfileController.isLoading
        ? const AbangLoading(text: "Saving Signature")
        : Scaffold(
            backgroundColor: abangColors.abangPrimary,
            body: Container(
              width: size.width,
              height: size.height,
              padding: EdgeInsets.symmetric(
                vertical: 50 / mockUpHeight * size.height,
                horizontal: 20 / mockUpWidth * size.width,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            editProfileController.setRuntimeDataToDefault();
                            Navigator.pop(context);
                          },
                          iconSize: 30 / mockUpWidth * size.width,
                          color: abangColors.abangWhite,
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (editProfileController
                                .signatureData.isNotEmpty) {
                              String url = await uploadSignatureImage(
                                  editProfileController.signatureData,
                                  FirebaseAuth.instance.currentUser!.uid);
                              editProfileController.setIsLoading(true);
                              AbangUser user = AbangUser(
                                userID: widget.userData.userID,
                                role: widget.userData.role,
                                dateCreated: widget.userData.dateCreated,
                                avatarURL: widget.userData.avatarURL,
                                userInfoID: widget.userData.userInfoID,
                                firstName: widget.userData.firstName,
                                middleName: widget.userData.middleName,
                                lastName: widget.userData.lastName,
                                contactNumber: widget.userData.contactNumber,
                                signatureURL: url,
                                email: widget.userData.email,
                                locationID: widget.userData.locationID,
                                region: widget.userData.region,
                                province: widget.userData.province,
                                city: widget.userData.city,
                                barangay: widget.userData.barangay,
                              );
                              await uploadUserDataToDB(user.toMap())
                                  .whenComplete(() {
                                editProfileController.setIsLoading(false);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              });
                            } else {
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            "Save",
                            textScaleFactor: textScale,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.outfit(
                              textStyle: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                height: 1.0,
                                letterSpacing: 0.0,
                                color: abangColors.abangWhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset('assets/edit_signature.svg'),
                    SizedBox(
                      height: 35 / mockUpHeight * size.height,
                    ),
                    Text(
                      'Edit Your E-Signature',
                      textScaleFactor: textScale,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        textStyle: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          letterSpacing: 0.15,
                          color: abangColors.abangWhite,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20 / mockUpHeight * size.height,
                    ),
                    GestureDetector(
                      onTap: () {
                        _showDrawPad();
                      },
                      child: Container(
                        width: 330 / mockUpWidth * size.width,
                        height: 200 / mockUpHeight * size.height,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: editProfileController.validate
                                ? abangColors.abangSecondary
                                : abangColors.abangWhite,
                            width: 2 / mockUpWidth * size.width,
                          ),
                          borderRadius: BorderRadius.circular(
                              5 / mockUpWidth * size.width),
                        ),
                        child: Center(
                          child: editProfileController.isSigned
                              ? Image.memory(
                                  editProfileController.signatureData)
                              : Image.network(widget.userData.signatureURL),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20 / mockUpHeight * size.height,
                    ),
                    Text(
                      "Please tap on the box above and draw your signature",
                      textScaleFactor: textScale,
                      style: abangTextStyles.descriptionTextStyle.copyWith(
                          color: abangColors.abangWhite, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
