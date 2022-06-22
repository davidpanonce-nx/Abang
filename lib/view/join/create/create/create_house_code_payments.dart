import 'package:abang/view/join/create/create/components/otherPayments.dart';
import 'package:abang/view/join/create/create/components/paymentInclusions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../components/constants.dart';
import '../../../../components/themes.dart';
import '../../../../controllers/create_house_code_controller.dart';

class CreateHouseCodePayments extends StatefulWidget {
  const CreateHouseCodePayments({
    Key? key,
    required this.roomRateController,
    required this.formKey,
  }) : super(key: key);

  final TextEditingController roomRateController;
  final GlobalKey<FormState> formKey;
  @override
  State<CreateHouseCodePayments> createState() =>
      _CreateHouseCodePaymentsState();
}

class _CreateHouseCodePaymentsState extends State<CreateHouseCodePayments> {
  @override
  Widget build(BuildContext context) {
    final createHouseCodeController =
        Provider.of<CreateHouseCodeConroller>(context);
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: abangColors.abangSecondary),
        height: 460 / mockUpHeight * size.height,
        child: SingleChildScrollView(
          child: Form(
            key: widget.formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 30 / mockUpHeight * size.height,
                ),
                Text(
                  "Payments",
                  textScaleFactor: textScale,
                  style: abangTextStyles.titleTextStyle.copyWith(
                    height: 1.5,
                    letterSpacing: -0.01,
                    color: abangColors.abangWhite,
                  ),
                ),
                SizedBox(
                  height: 30 / mockUpHeight * size.height,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 11.5 / mockUpWidth * size.width),
                  child: TextFormField(
                    cursorColor: abangColors.abangPrimary,
                    cursorHeight: 20 / mockUpHeight * size.height,
                    controller: widget.roomRateController,
                    style: abangTextStyles.smallTextStyle
                        .copyWith(color: abangColors.abangPrimary),
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please an room rate.";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      isCollapsed: true,
                      filled: true,
                      fillColor: abangColors.abangWhite,
                      contentPadding: EdgeInsets.fromLTRB(
                        20 / mockUpWidth * size.width,
                        20 / mockUpHeight * size.height,
                        20 / mockUpWidth * size.width,
                        20 / mockUpHeight * size.height,
                      ),
                      hintText: "Room Rate",
                      hintStyle: abangTextStyles.smallTextStyle.copyWith(
                        color: abangColors.abangPrimary.withOpacity(0.50),
                      ),
                      errorStyle: abangTextStyles.smallTextStyle.copyWith(
                          color: abangColors.abangYellow, fontSize: 12),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: const BorderSide(
                          width: 0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: const BorderSide(
                          width: 0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangYellow,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(5 / mockUpWidth * size.width),
                        borderSide: BorderSide(
                          color: abangColors.abangYellow,
                          width: 2.0 / mockUpWidth * size.width,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20 / mockUpHeight * size.height,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18 / mockUpWidth * size.width),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Payment Inclusions",
                        style: abangTextStyles.smallTextStyle.copyWith(
                          color: abangColors.abangWhite,
                          fontSize: 20,
                          height: 1.43,
                          letterSpacing: 0.1,
                        ),
                      ),
                      SizedBox(
                        width: 10 / mockUpWidth * size.width,
                      ),
                      GestureDetector(
                        onTap: () {
                          var uid = const Uuid().v4();
                          TextEditingController descController =
                              TextEditingController();
                          TextEditingController valueController =
                              TextEditingController();

                          createHouseCodeController
                              .addPaymentInlcusionController(
                            uid,
                            createHouseCodeController
                                    .paymentInclusionWidgets.length +
                                1,
                            descController,
                            valueController,
                          );

                          createHouseCodeController.addPaymentInclusions(
                            uid,
                            PaymentInclusion(
                                id: uid,
                                descController: descController,
                                valueController: valueController),
                            createHouseCodeController
                                    .paymentInclusionWidgets.length +
                                1,
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/add.svg",
                          width: 30 / mockUpWidth * size.width,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: createHouseCodeController.paymentInclusions,
                ),
                SizedBox(
                  height: 20 / mockUpHeight * size.height,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18 / mockUpWidth * size.width),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Other Payments",
                        style: abangTextStyles.smallTextStyle.copyWith(
                          color: abangColors.abangWhite,
                          fontSize: 20,
                          height: 1.43,
                          letterSpacing: 0.1,
                        ),
                      ),
                      SizedBox(
                        width: 10 / mockUpWidth * size.width,
                      ),
                      GestureDetector(
                        onTap: () {
                          var uid = const Uuid().v4();
                          TextEditingController descController =
                              TextEditingController();
                          TextEditingController valueController =
                              TextEditingController();

                          createHouseCodeController.addOtherPaymentsControllers(
                            uid,
                            createHouseCodeController
                                    .otherPaymentsWidgets.length +
                                1,
                            descController,
                            valueController,
                          );

                          createHouseCodeController.addOtherPayments(
                            uid,
                            OtherPayments(
                                id: uid,
                                descController: descController,
                                valueController: valueController),
                            createHouseCodeController
                                    .otherPaymentsWidgets.length +
                                1,
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/add.svg",
                          width: 30 / mockUpWidth * size.width,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10 / mockUpHeight * size.height,
                ),
                Column(
                  children: createHouseCodeController.otherPayments,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
