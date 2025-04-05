import 'package:flutter/material.dart';

// import 'device_manager.dart';

Size? screenSize;
double defaultScreenWidth = 380.0;
double defaultScreenHeight = 800.0;
double screenWidth = defaultScreenWidth;
double screenHeight = defaultScreenHeight;

class ScreenConstant {
  /*Nimmio Default height */
  static double size2 = 2.0;
  static double size3 = 3.5;
  static double size4 = 4.0;
  static double size5 = 5.0;
  static double size6 = 6.0;
  static double size8 = 8.0;
  static double size10 = 10;
  static double size12 = 12;
  static double size13 = 13;
  static double size14 = 14;
  static double size16 = 16;
  static double size18 = 18;
  static double size20 = 20;
  static double size22 = 22;
  static double size24 = 24;
  static double size26 = 26;
  static double size30 = 30;
  static double size34 = 34;
  static double size40 = 40;
  static double size44 = 44;
  static double size48 = 48;
  static double size50 = 50;
  static double size55 = 55;
  static double size56 = 56;
  static double size60 = 60;
  static double size70 = 70;
  static double size80 = 80;
  static double size76 = 76;
  static double size82 = 82;
  static double size84 = 84;
  static double size90 = 90;
  static double size98 = 98;

  static double size100 = 100;
  static double size110 = 110;
  static double size107 = 107;
  static double size120 = 120;
  static double size130 = 130;
  static double size140 = 140;
  static double size150 = 150;
  static double size160 = 160;
  static double size170 = 170;
  static double size180 = 180;

  static double size200 = 200;
  static double size210 = 210;
  static double size220 = 220;
  static double size225 = 225;
  static double size230 = 230;
  static double size250 = 250;
  static double size260 = 260;
  static double size290 = 290;

  static double size300 = 300;
  static double size320 = 320;
  static double size330 = 330;
  static double size336 = 336;
  static double size340 = 340;
  static double size350 = 350;
  static double size360 = 360;
  static double size380 = 380;

  static double size400 = 400;
  static double size455 = 455;
  static double size450 = 450;
  static double size460 = 460;

  /*Screen Size dependent Constants*/
  static double screenWidthHalf = screenWidth / 2;
  static double screenWidthThird = screenWidth / 3;
  static double screenWidthFourth = screenWidth / 4;
  static double screenWidthFifth = screenWidth / 5;
  static double screenWidthSixth = screenWidth / 6;
  static double screenWidthTenth = screenWidth / 10;
  static double screenWidthEleven = screenWidth / 11;
  static double screenWidthTwelve = screenWidth / 12;
  static double screenWidthThirteen = screenWidth / 13;
  static double screenWidthFourteen = screenWidth / 14;
  static double screenWidthFifteen = screenWidth / 15;
  static double screenWidthMinimum = screenWidth / 25;

  /*Screen Size dependent Constants*/
  static double screenHeightHalf = screenHeight / 2;
  static double screenHeightThird = screenHeight / 3;
  static double screenHeightTwoAndhalf = screenHeight / 2.9;
  static double screenHeightFourth = screenHeight / 4;
  static double screenHeightFifth = screenHeight / 5;
  static double screenHeightSixth = screenHeight / 6;
  static double screenHeightEight = screenHeight / 8;
  static double screenHeightTenth = screenHeight / 10;
  static double screenHeightEleven = screenHeight / 11;
  static double screenHeightTwelve = screenHeight / 12;
  static double screenHeightThirteen = screenHeight / 13;
  static double screenHeightFourteen = screenHeight / 14;
  static double screenHeightFifteen = screenHeight / 15;
  static double screenHeightMinimum = screenHeight / 25;

  static double widthpercent(double width, BuildContext context) {
    return MediaQuery.of(context).size.width * width;
  }

  /// This method is used to set the height in percentage
  static double heightpercent(double height, BuildContext context) {
    return MediaQuery.of(context).size.height * height;
  }

  /*Image Dimensions*/

  static double defaultIconSize = 80.0;
  static double miniIconSize = 66.0;
  static double defaultImageHeight = 120.0;
  static double defaultDialogHeight = 450.0;
  static double defaultMidHeight = 350.0;
  static double defaultImageWidth = screenWidth;
  static double defaultImageWidthThird = screenWidth / 3;
  static double snackBarHeight = 50.0;
  static double texIconSize = 30.0;
  static double drawerIconSize = 25.0;

  /*Default Height&Width*/
  static double defaultIndicatorWidth = screenWidthFourth;

  /*EdgeInsets*/
  static EdgeInsets spacingAllZero = const EdgeInsets.all(0);
  static EdgeInsets spacingAllDefault = EdgeInsets.all(size8);
  static EdgeInsets spacingAllExtraSmall = EdgeInsets.all(size4);
  static EdgeInsets spacingAllSmall = EdgeInsets.all(size10);
  static EdgeInsets spacingAllMedium = EdgeInsets.all(size16);
  static EdgeInsets spacingAllLarge = EdgeInsets.all(size20);
  static EdgeInsets spacingXL = EdgeInsets.all(size30);

  static EdgeInsets spacingOnlySmall =
      EdgeInsets.only(top: size10, bottom: size10);
  static EdgeInsets spacingLeftOnly = EdgeInsets.only(left: size8);

  static void setDefaultSize(context) {
    screenSize = MediaQuery.of(context).size;
    screenWidth = screenSize?.width ?? 0;
    screenHeight = screenSize?.height ?? 0;

    size30 = 30.0;
    size40 = 40.0;
    size50 = 50.0;
    size60 = 60.0;
    size70 = 70.0;

    screenWidthHalf = screenWidth / 2;
    screenWidthThird = screenWidth / 3;
    screenWidthFourth = screenWidth / 4;
    screenWidthFifth = screenWidth / 5;
    screenWidthSixth = screenWidth / 6;
    screenWidthTenth = screenWidth / 10;
    screenWidthEleven = screenWidth / 11;
    screenWidthTwelve = screenWidth / 12;
    screenWidthThirteen = screenWidth / 13;
    screenWidthFourteen = screenWidth / 14;
    screenWidthFifteen = screenWidth / 15;
    screenWidthMinimum = screenWidth / 25;

    screenHeightHalf = screenHeight / 2;
    screenHeightTwoAndhalf = screenHeight / 2.9;

    screenHeightThird = screenHeight / 3;
    screenHeightFourth = screenHeight / 4;
    screenHeightFifth = screenHeight / 5;
    screenHeightSixth = screenHeight / 6;
    screenHeightEight = screenHeight / 8;
    screenHeightTenth = screenHeight / 10;
    screenHeightEleven = screenHeight / 11;
    screenHeightTwelve = screenHeight / 12;
    screenHeightThirteen = screenHeight / 13;
    screenHeightFourteen = screenHeight / 14;
    screenHeightFifteen = screenHeight / 15;
    screenHeightMinimum = screenHeight / 25;

    defaultIconSize = 80.0;
    defaultImageHeight = 120.0;
    snackBarHeight = 50.0;
    texIconSize = 30.0;

    defaultIndicatorWidth = screenWidthFourth;

    spacingAllDefault = EdgeInsets.all(size8);
    spacingAllSmall = EdgeInsets.all(size10);

    FontSize.setDefaultFontSize();
  }
}

class FontSize {
  static double s7 = 7.0;
  static double s8 = 8.0;
  static double s9 = 9.0;
  static double s10 = 10.0;
  static double s11 = 11.0;
  static double s12 = 12.0;
  static double s13 = 13.0;
  static double s14 = 14.0;
  static double s15 = 15.0;
  static double s16 = 16.0;
  static double s17 = 17.0;
  static double s18 = 18.0;
  static double s19 = 19.0;
  static double s20 = 20.0;
  static double s21 = 21.0;
  static double s22 = 22.0;
  static double s23 = 23.0;
  static double s24 = 24.0;
  static double s25 = 25.0;
  static double s26 = 26.0;
  static double s27 = 27.0;
  static double s28 = 28.0;
  static double s29 = 29.0;
  static double s30 = 30.0;
  static double s34 = 34.0;
  static double s36 = 36.0;
  static double s40 = 40.0;

  static setDefaultFontSize() {
    s7 = 7.0;
    s8 = 8.0;
    s9 = 9.0;
    s10 = 10.0;
    s11 = 11.0;
    s12 = 12.0;
    s13 = 13.0;
    s14 = 14.0;
    s15 = 15.0;
    s16 = 16.0;
    s17 = 17.0;
    s18 = 18.0;
    s19 = 19.0;
    s20 = 20.0;
    s21 = 21.0;
    s22 = 22.0;
    s23 = 23.0;
    s24 = 24.0;
    s25 = 25.0;
    s26 = 26.0;
    s27 = 27.0;
    s28 = 28.0;
    s29 = 29.0;
    s30 = 30.0;
    s34 = 34.0;
    s36 = 36.0;
    s40 = 40.0;
  }
}
