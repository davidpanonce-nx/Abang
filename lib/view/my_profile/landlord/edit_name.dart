import 'package:abang/components/loading.dart';
import 'package:abang/components/themes.dart';
import 'package:abang/models/models.dart';
import 'package:abang/services/firestore_db.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../components/constants.dart';
import '../../../controllers/edit_profile_controller.dart';

class EditName extends StatefulWidget {
  const EditName({
    Key? key,
    required this.userData,
  }) : super(key: key);

  final AbangUser userData;
  @override
  State<EditName> createState() => _EditNameState();
}

class _EditNameState extends State<EditName> with FirestoreDataServices {
  late TextEditingController _firstNameController;
  late TextEditingController _middleNameController;
  late TextEditingController _lastNameController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _firstNameController =
        TextEditingController(text: widget.userData.firstName);
    if (widget.userData.middleName == "") {
      _middleNameController = TextEditingController();
    } else {
      _middleNameController =
          TextEditingController(text: widget.userData.middleName);
    }
    _lastNameController = TextEditingController(text: widget.userData.lastName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    final editProfileController = Provider.of<EditProfileController>(context);
    return editProfileController.isLoading
        ? const AbangLoading(text: "Saving Name")
        : GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              backgroundColor: abangColors.abangPrimary,
              body: Container(
                width: size.width,
                height: size.height,
                padding: EdgeInsets.symmetric(
                  vertical: 50 / mockUpHeight * size.height,
                  horizontal: 20 / mockUpWidth * size.width,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              iconSize: 30 / mockUpWidth * size.width,
                              color: abangColors.abangWhite,
                              icon: const Icon(Icons.arrow_back_ios),
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (_firstNameController.text.trim() !=
                                        widget.userData.firstName ||
                                    _middleNameController.text.trim() !=
                                        widget.userData.middleName ||
                                    _lastNameController.text.trim() !=
                                        widget.userData.lastName) {
                                  if (_formKey.currentState!.validate()) {
                                    editProfileController.setIsLoading(true);
                                    AbangUser user = AbangUser(
                                      userID: widget.userData.userID,
                                      role: widget.userData.role,
                                      dateCreated: widget.userData.dateCreated,
                                      avatarURL: widget.userData.avatarURL,
                                      userInfoID: widget.userData.userInfoID,
                                      firstName:
                                          _firstNameController.text.trim(),
                                      middleName:
                                          _middleNameController.text.trim(),
                                      lastName: _lastNameController.text.trim(),
                                      contactNumber:
                                          widget.userData.contactNumber,
                                      signatureURL:
                                          widget.userData.signatureURL,
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
                                  }
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
                        SvgPicture.asset('assets/edit_name.svg'),
                        SizedBox(
                          height: 35 / mockUpHeight * size.height,
                        ),
                        Text(
                          'Edit Your Name',
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
                        SizedBox(height: 20 / mockUpHeight * size.height),
                        TextFormField(
                          cursorColor: abangColors.abangWhite,
                          cursorHeight: 20 / mockUpHeight * size.height,
                          controller: _firstNameController,
                          style: abangTextStyles.smallTextStyle
                              .copyWith(color: abangColors.abangWhite),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Please enter your first name";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.fromLTRB(
                              20 / mockUpWidth * size.width,
                              20 / mockUpHeight * size.height,
                              20 / mockUpWidth * size.width,
                              20 / mockUpHeight * size.height,
                            ),
                            hintText: "First name",
                            hintStyle: abangTextStyles.smallTextStyle.copyWith(
                              color: abangColors.abangWhite.withOpacity(0.50),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  5 / mockUpWidth * size.width),
                              borderSide: BorderSide(
                                color: abangColors.abangWhite,
                                width: 2.0 / mockUpWidth * size.width,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  5 / mockUpWidth * size.width),
                              borderSide: BorderSide(
                                color: abangColors.abangWhite,
                                width: 2.0 / mockUpWidth * size.width,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  5 / mockUpWidth * size.width),
                              borderSide: BorderSide(
                                color: abangColors.abangSecondary,
                                width: 2.0 / mockUpWidth * size.width,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  5 / mockUpWidth * size.width),
                              borderSide: BorderSide(
                                color: abangColors.abangSecondary,
                                width: 2.0 / mockUpWidth * size.width,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8 / mockUpHeight * size.height,
                        ),
                        TextFormField(
                          cursorColor: abangColors.abangWhite,
                          cursorHeight: 20 / mockUpHeight * size.height,
                          controller: _middleNameController,
                          style: abangTextStyles.smallTextStyle
                              .copyWith(color: abangColors.abangWhite),
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.fromLTRB(
                              20 / mockUpWidth * size.width,
                              20 / mockUpHeight * size.height,
                              20 / mockUpWidth * size.width,
                              20 / mockUpHeight * size.height,
                            ),
                            hintText: "Middle name (optional)",
                            hintStyle: abangTextStyles.smallTextStyle.copyWith(
                              color: abangColors.abangWhite.withOpacity(0.50),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  5 / mockUpWidth * size.width),
                              borderSide: BorderSide(
                                color: abangColors.abangWhite,
                                width: 2.0 / mockUpWidth * size.width,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  5 / mockUpWidth * size.width),
                              borderSide: BorderSide(
                                color: abangColors.abangWhite,
                                width: 2.0 / mockUpWidth * size.width,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  5 / mockUpWidth * size.width),
                              borderSide: BorderSide(
                                color: abangColors.abangSecondary,
                                width: 2.0 / mockUpWidth * size.width,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  5 / mockUpWidth * size.width),
                              borderSide: BorderSide(
                                color: abangColors.abangSecondary,
                                width: 2.0 / mockUpWidth * size.width,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8 / mockUpHeight * size.height,
                        ),
                        TextFormField(
                          cursorColor: abangColors.abangWhite,
                          cursorHeight: 20 / mockUpHeight * size.height,
                          controller: _lastNameController,
                          style: abangTextStyles.smallTextStyle
                              .copyWith(color: abangColors.abangWhite),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Please enter your last name";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.fromLTRB(
                              20 / mockUpWidth * size.width,
                              20 / mockUpHeight * size.height,
                              20 / mockUpWidth * size.width,
                              20 / mockUpHeight * size.height,
                            ),
                            hintText: "Last name",
                            hintStyle: abangTextStyles.smallTextStyle.copyWith(
                              color: abangColors.abangWhite.withOpacity(0.50),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  5 / mockUpWidth * size.width),
                              borderSide: BorderSide(
                                color: abangColors.abangWhite,
                                width: 2.0 / mockUpWidth * size.width,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  5 / mockUpWidth * size.width),
                              borderSide: BorderSide(
                                color: abangColors.abangWhite,
                                width: 2.0 / mockUpWidth * size.width,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  5 / mockUpWidth * size.width),
                              borderSide: BorderSide(
                                color: abangColors.abangSecondary,
                                width: 2.0 / mockUpWidth * size.width,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  5 / mockUpWidth * size.width),
                              borderSide: BorderSide(
                                color: abangColors.abangSecondary,
                                width: 2.0 / mockUpWidth * size.width,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
