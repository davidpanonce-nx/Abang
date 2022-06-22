import 'package:abang/view/join/create/create/components/agreements.dart';
import 'package:abang/view/join/create/create/components/rules.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../components/constants.dart';
import '../../../../components/themes.dart';
import '../../../../controllers/create_house_code_controller.dart';

class CreateHouseCodeRulesAgreements extends StatefulWidget {
  const CreateHouseCodeRulesAgreements({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  @override
  State<CreateHouseCodeRulesAgreements> createState() =>
      _CreateHouseCodeRulesAgreementsState();
}

class _CreateHouseCodeRulesAgreementsState
    extends State<CreateHouseCodeRulesAgreements> {
  TextEditingController text = TextEditingController();
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
                  "Rules and Agreements",
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
                  padding: EdgeInsets.only(left: 18 / mockUpWidth * size.width),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Rules",
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
                          TextEditingController controller =
                              TextEditingController();

                          createHouseCodeController.addRulesControllers(
                            uid,
                            createHouseCodeController.rulesWidgets.length + 1,
                            controller,
                          );
                          createHouseCodeController.addRules(
                            uid,
                            createHouseCodeController.rulesWidgets.length + 1,
                            Rules(id: uid, descController: controller),
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
                  children: createHouseCodeController.rules,
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
                        "Agreements",
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
                          TextEditingController controller =
                              TextEditingController();

                          createHouseCodeController.addAgreementsControllers(
                            uid,
                            createHouseCodeController.agreementsWidgets.length +
                                1,
                            controller,
                          );
                          createHouseCodeController.addAgreements(
                            uid,
                            createHouseCodeController.agreementsWidgets.length +
                                1,
                            Agreements(id: uid, descController: controller),
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
                  children: createHouseCodeController.agreements,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
