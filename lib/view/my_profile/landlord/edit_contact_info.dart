import 'package:abang/components/loading.dart';
import 'package:abang/components/themes.dart';
import 'package:abang/models/models.dart';
import 'package:abang/services/firestore_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../components/constants.dart';
import '../../../controllers/edit_profile_controller.dart';

class EditContactInformation extends StatefulWidget {
  const EditContactInformation({
    Key? key,
    required this.userData,
  }) : super(key: key);
  final AbangUser userData;

  @override
  State<EditContactInformation> createState() => _EditContactInformationState();
}

class _EditContactInformationState extends State<EditContactInformation>
    with FirestoreDataServices {
  late TextEditingController _numberController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _numberController =
        TextEditingController(text: widget.userData.contactNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    final editProfileController = Provider.of<EditProfileController>(context);
    return editProfileController.isLoading
        ? const AbangLoading(text: "Saving Contact\nInfo")
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
                                if (widget.userData.contactNumber !=
                                    _numberController.text.trim()) {
                                  if (_formKey.currentState!.validate()) {
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
                                      contactNumber:
                                          _numberController.text.trim(),
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
                        SvgPicture.asset('assets/edit_contact_info.svg'),
                        SizedBox(
                          height: 35 / mockUpHeight * size.height,
                        ),
                        Text(
                          'Edit Your Contact\nInformation',
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
                          controller: _numberController,
                          style: abangTextStyles.smallTextStyle
                              .copyWith(color: abangColors.abangWhite),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Please enter your contact number";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.fromLTRB(
                              20 / mockUpWidth * size.width,
                              20 / mockUpHeight * size.height,
                              20 / mockUpWidth * size.width,
                              20 / mockUpHeight * size.height,
                            ),
                            hintText: "Contact Number",
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
