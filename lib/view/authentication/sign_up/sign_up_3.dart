import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:abang/controllers/sign_up_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../../components/constants.dart';
import '../../../components/themes.dart';

class SignUpPage3 extends StatefulWidget {
  const SignUpPage3({Key? key}) : super(key: key);

  @override
  State<SignUpPage3> createState() => _SignUpPage3State();
}

class _SignUpPage3State extends State<SignUpPage3>
    with TickerProviderStateMixin {
  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  List<Color> _strokeColors = <Color>[];
  late double _strokeWidth;
  int _selectedPenIndex = 0;
  late Color _strokeColor;
  Color? _backgroundColor;
  late List<Widget> _strokeColorWidgets;

  //ANIMATION VARIABLES
  late AnimationController _animationController;
  late AnimationController _fadeController;

  late final Animation<double> _fadeAnimation = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(
    CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ),
  );

  late final Animation<double> _scale = Tween<double>(
    begin: 0.95,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0,
        1,
        curve: Curves.easeOut,
      ),
    ),
  );
  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();

    _backgroundColor = abangColors.abangWhite;
    _addStrokeColors();
    _strokeWidth = 2.0;
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _fadeController.dispose();
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
    SignUpPageController _signUpPageController = SignUpPageController();
    _signUpPageController.setIsSigned(true);
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
    SignUpPageController _signUpPageController = SignUpPageController();
    _signUpPageController.setIsSigned(false);

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
    SignUpPageController _signUpPageController = SignUpPageController();
    _signUpPageController.setIsSigned(false);
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

    SignUpPageController _signUpPageController = SignUpPageController();
    _signUpPageController.setSignatureData(data);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    final signUpPageController = Provider.of<SignUpPageController>(context);
    _strokeColor = _strokeColors[_selectedPenIndex];
    return FadeTransition(
      opacity: _fadeAnimation,
      child: AnimatedBuilder(
        animation: _animationController..forward(),
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: _scale.value,
            child: SizedBox(
              width: size.width,
              child: Column(
                children: [
                  Text(
                    "Signature",
                    textAlign: TextAlign.center,
                    textScaleFactor: textScale,
                    style: abangTextStyles.titleTextStyle.copyWith(
                        color: abangColors.abangWhite, letterSpacing: 0.15),
                  ),
                  SizedBox(
                    height: 54 / mockUpHeight * size.height,
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
                          color: signUpPageController.validate
                              ? abangColors.abangSecondary
                              : abangColors.abangYellow,
                          width: 2 / mockUpWidth * size.width,
                        ),
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                      ),
                      child: Center(
                        child: signUpPageController.isSigned
                            ? Image.memory(signUpPageController.signatureData)
                            : Text(
                                "Tap here to sign",
                                textScaleFactor: textScale,
                                style: abangTextStyles.smallTextStyle.copyWith(
                                  color:
                                      abangColors.abangWhite.withOpacity(0.50),
                                ),
                              ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: signUpPageController.validate,
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 20 / mockUpHeight * size.height),
                      child: Text(
                        "Please tap on the box above and draw your signature",
                        textScaleFactor: textScale,
                        style: abangTextStyles.descriptionTextStyle.copyWith(
                            color: abangColors.abangSecondary, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
