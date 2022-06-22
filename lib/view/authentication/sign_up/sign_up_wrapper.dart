import 'package:abang/components/loading.dart';
import 'package:abang/models/models.dart';
import 'package:abang/services/firebase_auth.dart';
import 'package:abang/services/firestore_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../components/constants.dart';
import '../../../components/themes.dart';
import '../../../controllers/create_house_code_controller.dart';
import '../../../controllers/sign_up_page_controller.dart';
import '../../../main.dart';
import 'sign_up_1.dart';
import 'sign_up_2.dart';
import 'sign_up_3.dart';
import 'sign_up_4.dart';

class SignUpWrapper extends StatefulWidget {
  const SignUpWrapper({Key? key}) : super(key: key);

  @override
  State<SignUpWrapper> createState() => _SignUpWrapperState();
}

class _SignUpWrapperState extends State<SignUpWrapper>
    with FirebaseAuthentication, FirestoreDataServices {
  late TextEditingController _firstNameController;
  late TextEditingController _middleNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _contactNumberController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _middleNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _contactNumberController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _contactNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    final signUpPageController = Provider.of<SignUpPageController>(context);
    final createHouseCodeController =
        Provider.of<CreateHouseCodeConroller>(context);
    return signUpPageController.isLoading
        ? const AbangLoading(text: "Creating User")
        : GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              backgroundColor: abangColors.abangPrimary,
              body: SizedBox(
                width: size.width,
                height: size.height,
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: size.width,
                        height: size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150 / mockUpHeight * size.height,
                            ),
                            Image.asset(
                              "assets/abang_logo.png",
                              width: 276 / mockUpWidth * size.width,
                              height: 115 / mockUpHeight * size.height,
                            ),
                            SizedBox(
                              height: 15 / mockUpHeight * size.height,
                            ),
                            signUpPageController.currentPage == 1
                                ? SignUpPage1(
                                    firstNameController: _firstNameController,
                                    middleNameController: _middleNameController,
                                    lastNameController: _lastNameController,
                                    formKey: _formKey1,
                                  )
                                : signUpPageController.currentPage == 2
                                    ? SignUpPage2(
                                        contactNumberController:
                                            _contactNumberController,
                                        formKey: _formKey2,
                                      )
                                    : signUpPageController.currentPage == 3
                                        ? const SignUpPage3()
                                        : SignUpPage4(
                                            emailController: _emailController,
                                            passwordController:
                                                _passwordController,
                                            confirmPasswordController:
                                                _confirmPasswordController,
                                            formKey: _formKey3,
                                          ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 50 / mockUpHeight * size.height,
                        left: 12 / mockUpWidth * size.width,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            signUpPageController.setRuntimeDataToDefault();
                          },
                          color: abangColors.abangYellow,
                          iconSize: 30 / mockUpWidth * size.width,
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                      Positioned(
                        bottom: 50 / mockUpHeight * size.height,
                        right: 12 / mockUpWidth * size.width,
                        child: signUpPageController.currentPage == 1
                            ? GestureDetector(
                                onTap: () {
                                  if (_formKey1.currentState!.validate()) {
                                    signUpPageController.setCurrentPage("Next");
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Next",
                                      textScaleFactor: textScale,
                                      style: abangTextStyles.nextTextStyle
                                          .copyWith(
                                        color: abangColors.abangYellow,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 24 / mockUpWidth * size.width,
                                      color: abangColors.abangYellow,
                                    ),
                                  ],
                                ),
                              )
                            : signUpPageController.currentPage == 4
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          signUpPageController
                                              .setCurrentPage("Prev");
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.arrow_back_ios,
                                              size:
                                                  24 / mockUpWidth * size.width,
                                              color: abangColors.abangYellow,
                                            ),
                                            Text(
                                              "Prev",
                                              textScaleFactor: textScale,
                                              style: abangTextStyles
                                                  .nextTextStyle
                                                  .copyWith(
                                                color: abangColors.abangYellow,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              182 / mockUpWidth * size.width),
                                      GestureDetector(
                                        onTap: () async {
                                          if (_formKey3.currentState!
                                              .validate()) {
                                            signUpPageController
                                                .setIsLoading(true);
                                            final response = await signUp(
                                              _emailController.text.trim(),
                                              _passwordController.text.trim(),
                                            );

                                            if (response["response"] == 400) {
                                              signUpPageController
                                                  .setErrorMessage(
                                                      response["data"]);
                                              signUpPageController
                                                  .setIsLoading(false);
                                            } else {
                                              String? url;
                                              url = await uploadSignatureImage(
                                                signUpPageController
                                                    .signatureData,
                                                FirebaseAuth
                                                    .instance.currentUser!.uid,
                                              );
                                              await createHouseCodeController
                                                  .cacheSignatureURL(url);
                                              var uuid = const Uuid();

                                              AbangUser user = AbangUser(
                                                userID: FirebaseAuth
                                                    .instance.currentUser!.uid,
                                                role: "TBD",
                                                dateCreated: Timestamp.now(),
                                                userInfoID: uuid.v4(),
                                                firstName: _firstNameController
                                                    .text
                                                    .trim(),
                                                middleName:
                                                    _middleNameController.text
                                                        .trim(),
                                                lastName: _lastNameController
                                                    .text
                                                    .trim(),
                                                contactNumber:
                                                    _contactNumberController
                                                        .text
                                                        .trim(),
                                                avatarURL:
                                                    "https://firebasestorage.googleapis.com/v0/b/abang-ce370.appspot.com/o/establishment%2FhfhAn6666172%2Favatars%2FdefaultAvatar.png?alt=media&token=e00d6e88-1186-4773-8ba3-4773ca540d2b",
                                                signatureURL: url,
                                                email: _emailController.text
                                                    .trim(),
                                                locationID: uuid.v4(),
                                                region: signUpPageController
                                                        .region ??
                                                    "",
                                                province: signUpPageController
                                                        .province ??
                                                    "",
                                                city:
                                                    signUpPageController.city ??
                                                        "",
                                                barangay: signUpPageController
                                                        .barangay ??
                                                    "",
                                              );
                                              uploadUserDataToDB(user.toMap())
                                                  .whenComplete(() {
                                                signUpPageController
                                                    .setRuntimeDataToDefault();
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AbangAuthWrapper(),
                                                  ),
                                                );
                                              });
                                            }
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Sign Up",
                                              textScaleFactor: textScale,
                                              style: abangTextStyles
                                                  .nextTextStyle
                                                  .copyWith(
                                                color: abangColors.abangYellow,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size:
                                                  24 / mockUpWidth * size.width,
                                              color: abangColors.abangYellow,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (signUpPageController
                                                  .currentPage ==
                                              3) {
                                            if (signUpPageController.validate) {
                                              signUpPageController
                                                  .setValidate(false);
                                            }
                                          }
                                          signUpPageController
                                              .setCurrentPage("Prev");
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.arrow_back_ios,
                                              size:
                                                  24 / mockUpWidth * size.width,
                                              color: abangColors.abangYellow,
                                            ),
                                            Text(
                                              "Prev",
                                              textScaleFactor: textScale,
                                              style: abangTextStyles
                                                  .nextTextStyle
                                                  .copyWith(
                                                color: abangColors.abangYellow,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              207 / mockUpWidth * size.width),
                                      GestureDetector(
                                        onTap: () {
                                          if (signUpPageController
                                                  .currentPage ==
                                              2) {
                                            if (_formKey2.currentState!
                                                .validate()) {
                                              signUpPageController
                                                  .setCurrentPage("Next");
                                            }
                                          } else {
                                            if (!signUpPageController
                                                .isSigned) {
                                              signUpPageController
                                                  .setValidate(true);
                                            } else {
                                              signUpPageController
                                                  .setValidate(false);
                                              signUpPageController
                                                  .setCurrentPage("Next");
                                            }
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Next",
                                              textScaleFactor: textScale,
                                              style: abangTextStyles
                                                  .nextTextStyle
                                                  .copyWith(
                                                color: abangColors.abangYellow,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size:
                                                  24 / mockUpWidth * size.width,
                                              color: abangColors.abangYellow,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
