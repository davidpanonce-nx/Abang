import 'package:abang/components/loading.dart';
import 'package:abang/components/themes.dart';
import 'package:abang/models/models.dart';
import 'package:abang/services/firestore_db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../components/constants.dart';
import '../../../controllers/edit_profile_controller.dart';

class EditAvatar extends StatefulWidget {
  const EditAvatar({
    Key? key,
    required this.userData,
  }) : super(key: key);

  final AbangUser userData;
  @override
  State<EditAvatar> createState() => _EditAvatarState();
}

class _EditAvatarState extends State<EditAvatar> with FirestoreDataServices {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    final editProfileController = Provider.of<EditProfileController>(context);
    return editProfileController.isLoading
        ? const AbangLoading(
            text: "Saving Avatar",
          )
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
                            editProfileController.setAvatarImage(null);
                            Navigator.pop(context);
                          },
                          iconSize: 30 / mockUpWidth * size.width,
                          color: abangColors.abangWhite,
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (editProfileController.avatarImage != null) {
                              editProfileController.setIsLoading(true);
                              String url = await uploadAvatar(
                                editProfileController.avatarImage!,
                                FirebaseAuth.instance.currentUser!.uid,
                              );
                              AbangUser user = AbangUser(
                                userID: widget.userData.userID,
                                role: widget.userData.role,
                                dateCreated: widget.userData.dateCreated,
                                avatarURL: url,
                                userInfoID: widget.userData.userInfoID,
                                firstName: widget.userData.firstName,
                                middleName: widget.userData.middleName,
                                lastName: widget.userData.lastName,
                                contactNumber: widget.userData.contactNumber,
                                signatureURL: widget.userData.signatureURL,
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
                    SizedBox(
                      height: 60 / mockUpHeight * size.height,
                    ),
                    Text(
                      'Edit Your\nProfile Avatar',
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
                      onTap: () async {
                        await editProfileController.pickAvatar();
                      },
                      child: editProfileController.avatarImage != null
                          ? Container(
                              width: 250 / mockUpWidth * size.width,
                              height: 250 / mockUpWidth * size.width,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 5 / mockUpWidth * size.width,
                                  color: abangColors.abangWhite,
                                ),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.file(
                                editProfileController.avatarImage!,
                                isAntiAlias: true,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(
                              width: 250 / mockUpWidth * size.width,
                              height: 250 / mockUpWidth * size.width,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 5 / mockUpWidth * size.width,
                                  color: abangColors.abangWhite,
                                ),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                widget.userData.avatarURL,
                                isAntiAlias: true,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 20 / mockUpHeight * size.height,
                    ),
                    Text(
                      "Please tap on the avatar to change!",
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
