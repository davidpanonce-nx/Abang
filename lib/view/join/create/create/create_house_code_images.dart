import 'package:abang/components/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../components/constants.dart';
import '../../../../controllers/create_house_code_controller.dart';

class CreateHouseCodeImages extends StatefulWidget {
  const CreateHouseCodeImages({Key? key}) : super(key: key);

  @override
  State<CreateHouseCodeImages> createState() => _CreateHouseCodeImagesState();
}

class _CreateHouseCodeImagesState extends State<CreateHouseCodeImages> {
  @override
  Widget build(BuildContext context) {
    final createHouseCodeController =
        Provider.of<CreateHouseCodeConroller>(context);
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 30 / mockUpHeight * size.height,
        ),
        Text(
          "Images",
          textScaleFactor: textScale,
          style: abangTextStyles.titleTextStyle.copyWith(
            height: 1.5,
            letterSpacing: -0.01,
            color: abangColors.abangWhite,
          ),
        ),
        SizedBox(
          height: 33 / mockUpHeight * size.height,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: addImageButton(size),
                ),
                SizedBox(
                  width: 30 / mockUpWidth * size.width,
                ),
                GestureDetector(
                  onTap: () {},
                  child: addImageButton(size),
                ),
              ],
            ),
            SizedBox(
              height: 30 / mockUpHeight * size.height,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: addImageButton(size),
                ),
                SizedBox(
                  width: 30 / mockUpWidth * size.width,
                ),
                GestureDetector(
                  onTap: () {},
                  child: addImageButton(size),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}

Container addImageButton(Size size) {
  return Container(
    width: 136 / mockUpWidth * size.width,
    height: 120 / mockUpHeight * size.height,
    decoration: BoxDecoration(
      border: Border.all(
        color: abangColors.abangWhite,
        width: 2 / mockUpWidth * size.width,
      ),
      borderRadius: BorderRadius.circular(10 / mockUpWidth * size.width),
    ),
    child: Center(child: SvgPicture.asset("assets/image_icon.svg")),
  );
}
