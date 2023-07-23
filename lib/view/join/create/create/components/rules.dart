import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../components/constants.dart';
import '../../../../../components/themes.dart';
import '../../../../../controllers/create_house_code_controller.dart';

class Rules extends StatelessWidget {
  const Rules({
    Key? key,
    required this.id,
    required this.descController,
  }) : super(key: key);
  final String id;
  final TextEditingController descController;
  @override
  Widget build(BuildContext context) {
    final createHouseCodeController =
        Provider.of<CreateHouseCodeConroller>(context);
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return Container(
        margin: EdgeInsets.only(
          left: 20 / mockUpWidth * size.width,
          top: 10 / mockUpHeight * size.height,
        ),
        width: 336 / mockUpWidth * size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${createHouseCodeController.rulesWidgets[id]["index"].toString()}.",
                  textScaleFactor: textScale,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1.43,
                      letterSpacing: 0,
                      color: abangColors.abangWhite,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10 / mockUpWidth * size.width,
                ),
                Expanded(
                  child: Divider(
                    color: abangColors.abangWhite,
                    thickness: 2,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    createHouseCodeController.removeRules(id);
                  },
                  iconSize: 30 / mockUpWidth * size.width,
                  color: abangColors.abangWhite,
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 5 / mockUpWidth * size.width,
                right: 17 / mockUpWidth * size.width,
              ),
              child: TextFormField(
                cursorColor: abangColors.abangPrimary,
                cursorHeight: 20 / mockUpHeight * size.height,
                controller: descController,
                maxLines: 3,
                minLines: 1,
                style: abangTextStyles.smallTextStyle
                    .copyWith(color: abangColors.abangPrimary),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please a description.";
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
                  hintText: "Description",
                  hintStyle: abangTextStyles.smallTextStyle.copyWith(
                    color: abangColors.abangPrimary.withOpacity(0.50),
                  ),
                  errorStyle: abangTextStyles.smallTextStyle
                      .copyWith(color: abangColors.abangYellow, fontSize: 12),
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
          ],
        ));
  }
}
