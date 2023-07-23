import 'package:abang/components/themes.dart';
import 'package:abang/models/models.dart';
import 'package:abang/view/my_profile/landlord/edit_signature.dart';
import 'package:abang/view/my_profile/landlord/edit_address.dart';
import 'package:abang/view/my_profile/landlord/edit_avatar.dart';
import 'package:abang/view/my_profile/landlord/edit_contact_info.dart';
import 'package:abang/view/my_profile/landlord/edit_name.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../components/constants.dart';
import '../../../controllers/edit_profile_controller.dart';

class WhatToEdit extends StatelessWidget {
  const WhatToEdit({
    Key? key,
    required this.userData,
  }) : super(key: key);

  final AbangUser userData;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    final editProfileController = Provider.of<EditProfileController>(context);
    return Scaffold(
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
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  iconSize: 30 / mockUpWidth * size.width,
                  color: abangColors.abangWhite,
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              SvgPicture.asset('assets/what_to_edit.svg'),
              SizedBox(height: 30 / mockUpHeight * size.height),
              Text(
                'What do you want to edit?',
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
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditAvatar(userData: userData)),
                      );
                    },
                    child:
                        editButtonSelection("Profile Picture", size, textScale),
                  ),
                  SizedBox(height: 10 / mockUpHeight * size.height),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditName(
                            userData: userData,
                          ),
                        ),
                      );
                    },
                    child: editButtonSelection("Name", size, textScale),
                  ),
                  SizedBox(height: 10 / mockUpHeight * size.height),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditContactInformation(
                            userData: userData,
                          ),
                        ),
                      );
                    },
                    child: editButtonSelection(
                        "Contact Information", size, textScale),
                  ),
                  SizedBox(height: 10 / mockUpHeight * size.height),
                  GestureDetector(
                    onTap: () async {
                      await editProfileController.readJson();
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditAddress(
                              userData: userData,
                            ),
                          ),
                        );
                      }
                    },
                    child: editButtonSelection("Address", size, textScale),
                  ),
                  SizedBox(height: 10 / mockUpHeight * size.height),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditSignature(userData: userData),
                        ),
                      );
                    },
                    child: editButtonSelection("E-Signature", size, textScale),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container editButtonSelection(String label, Size size, double textScale) {
    return Container(
      width: 320 / mockUpWidth * size.width,
      height: 60 / mockUpHeight * size.height,
      decoration: BoxDecoration(
        color: abangColors.abangSecondary,
        borderRadius: BorderRadius.circular(5 / mockUpWidth * size.width),
      ),
      child: Center(
        child: Text(
          label,
          textScaleFactor: textScale,
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(
            textStyle: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.0,
              letterSpacing: 0.0,
              color: abangColors.abangWhite,
            ),
          ),
        ),
      ),
    );
  }
}
