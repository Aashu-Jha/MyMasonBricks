import 'package:flutter/widgets.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 5);
const Widget horizontalSpaceSmall = SizedBox(width: 10);
const Widget horizontalSpaceRegular = SizedBox(width: 18);
const Widget horizontalSpaceMedium = SizedBox(width: 24);
const Widget horizontalSpaceLarge = SizedBox(width: 50);

const Widget verticalSpaceTiny = SizedBox(height: 5);
const Widget verticalSpaceSmall = SizedBox(height: 10);
const Widget verticalSpaceRegular = SizedBox(height: 18);
const Widget verticalSpaceMedium = SizedBox(height: 24);
const Widget verticalSpaceLarge = SizedBox(height: 50);

// Screen Size helpers

double screenWidth(BuildContext context) => MediaQuery.sizeOf(context).width;

double screenHeight(BuildContext context) => MediaQuery.sizeOf(context).height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;
