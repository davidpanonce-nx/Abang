import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../components/constants.dart';
import '../../../../components/themes.dart';
import '../../../../controllers/create_house_code_controller.dart';

class CreateHouseCodeRulesAgreements extends StatefulWidget {
  const CreateHouseCodeRulesAgreements({Key? key}) : super(key: key);

  @override
  State<CreateHouseCodeRulesAgreements> createState() =>
      _CreateHouseCodeRulesAgreementsState();
}

class _CreateHouseCodeRulesAgreementsState
    extends State<CreateHouseCodeRulesAgreements> {
  @override
  Widget build(BuildContext context) {
    final createHouseCodeController =
        Provider.of<CreateHouseCodeConroller>(context);
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return Column(
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
            children: [
              Text(
                "Rules",
                style: abangTextStyles.smallTextStyle.copyWith(
                  color: abangColors.abangWhite,
                  fontSize: 14,
                  height: 1.43,
                  letterSpacing: 0.1,
                ),
              ),
              SizedBox(
                width: 10 / mockUpWidth * size.width,
              ),
              SvgPicture.asset("assets/add.svg"),
            ],
          ),
        ),
        SizedBox(
          height: 10 / mockUpHeight * size.height,
        ),
        Padding(
          padding: EdgeInsets.only(left: 29 / mockUpWidth * size.width),
          child: Row(
            children: [
              Text(
                '1.',
                style: abangTextStyles.smallTextStyle.copyWith(
                  color: abangColors.abangWhite,
                  fontSize: 14,
                  height: 1.43,
                  letterSpacing: 0.1,
                ),
              ),
              SizedBox(
                width: 10 / mockUpWidth * size.width,
              ),
              Container(
                width: 138 / mockUpWidth * size.width,
                height: 30 / mockUpHeight * size.height,
                decoration: BoxDecoration(
                  color: abangColors.abangWhite,
                  borderRadius:
                      BorderRadius.circular(5 / mockUpWidth * size.width),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10 / mockUpWidth * size.width,
                  vertical: 5 / mockUpHeight * size.height,
                ),
                child: Text(
                  "Description",
                  style: abangTextStyles.smallTextStyle.copyWith(
                    fontSize: 10,
                    height: 2,
                    letterSpacing: 0.1,
                    color: abangColors.abangPrimary.withOpacity(0.50),
                  ),
                ),
              ),
              SizedBox(
                width: 10 / mockUpWidth * size.width,
              ),
              Container(
                width: 72 / mockUpWidth * size.width,
                height: 30 / mockUpHeight * size.height,
                decoration: BoxDecoration(
                  color: abangColors.abangWhite,
                  borderRadius:
                      BorderRadius.circular(5 / mockUpWidth * size.width),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10 / mockUpWidth * size.width,
                  vertical: 5 / mockUpHeight * size.height,
                ),
                child: Text(
                  "Value",
                  style: abangTextStyles.smallTextStyle.copyWith(
                    fontSize: 10,
                    height: 2,
                    letterSpacing: 0.1,
                    color: abangColors.abangPrimary.withOpacity(0.50),
                  ),
                ),
              ),
              SizedBox(
                width: 10 / mockUpWidth * size.width,
              ),
              SvgPicture.asset("assets/delete.svg"),
            ],
          ),
        ),
        SizedBox(
          height: 20 / mockUpHeight * size.height,
        ),
        Padding(
          padding: EdgeInsets.only(left: 18 / mockUpWidth * size.width),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Agreements",
                style: abangTextStyles.smallTextStyle.copyWith(
                  color: abangColors.abangWhite,
                  fontSize: 14,
                  height: 1.43,
                  letterSpacing: 0.1,
                ),
              ),
              SizedBox(
                width: 10 / mockUpWidth * size.width,
              ),
              SvgPicture.asset("assets/add.svg"),
            ],
          ),
        ),
        SizedBox(
          height: 10 / mockUpHeight * size.height,
        ),
        Padding(
          padding: EdgeInsets.only(left: 29 / mockUpWidth * size.width),
          child: Row(
            children: [
              Text(
                '1.',
                style: abangTextStyles.smallTextStyle.copyWith(
                  color: abangColors.abangWhite,
                  fontSize: 14,
                  height: 1.43,
                  letterSpacing: 0.1,
                ),
              ),
              SizedBox(
                width: 10 / mockUpWidth * size.width,
              ),
              Container(
                width: 138 / mockUpWidth * size.width,
                height: 30 / mockUpHeight * size.height,
                decoration: BoxDecoration(
                  color: abangColors.abangWhite,
                  borderRadius:
                      BorderRadius.circular(5 / mockUpWidth * size.width),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10 / mockUpWidth * size.width,
                  vertical: 5 / mockUpHeight * size.height,
                ),
                child: Text(
                  "Description",
                  style: abangTextStyles.smallTextStyle.copyWith(
                    fontSize: 10,
                    height: 2,
                    letterSpacing: 0.1,
                    color: abangColors.abangPrimary.withOpacity(0.50),
                  ),
                ),
              ),
              SizedBox(
                width: 10 / mockUpWidth * size.width,
              ),
              Container(
                width: 72 / mockUpWidth * size.width,
                height: 30 / mockUpHeight * size.height,
                decoration: BoxDecoration(
                  color: abangColors.abangWhite,
                  borderRadius:
                      BorderRadius.circular(5 / mockUpWidth * size.width),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10 / mockUpWidth * size.width,
                  vertical: 5 / mockUpHeight * size.height,
                ),
                child: Text(
                  "Value",
                  style: abangTextStyles.smallTextStyle.copyWith(
                    fontSize: 10,
                    height: 2,
                    letterSpacing: 0.1,
                    color: abangColors.abangPrimary.withOpacity(0.50),
                  ),
                ),
              ),
              SizedBox(
                width: 10 / mockUpWidth * size.width,
              ),
              SvgPicture.asset("assets/delete.svg"),
            ],
          ),
        ),
      ],
    );
  }
}
