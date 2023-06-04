import 'package:flutter/cupertino.dart';

class AppColors {
  final Color strongPink = HexColor.fromHex('#e52688');
  final Color greenyBlue = HexColor.fromHex("#37c1f7");
  final Color iceBlue = HexColor.fromHex("#f1f2f3");
  final Color veryLightPink = HexColor.fromHex("#c1c1c1");
  final Color darkGrey = HexColor.fromHex("#0f0f10");
  final Color powderBlue = HexColor.fromHex("#d6dadd");
  final Color lightGreyBlue = HexColor.fromHex("#abafb4");
  final Color lightBlueGrey = HexColor.fromHex("#c4c9cf");
  final Color blueyGrey = HexColor.fromHex("#959a9f");
  final Color socialShape = HexColor.fromHex("#000000");
  final Color coolGreen = HexColor.fromHex("#3ebe66");
  final Color pinkyRed = HexColor.fromHex("#f32848");
  final Color white = HexColor.fromHex("#ffffff");
  final Color textFieldLineColor = HexColor.fromHex("#e8edf1");
  final Color pink = HexColor.fromHex("#edbcd5");
  final Color error = HexColor.fromHex("#da2643");
  final Color accountHeaderColor = HexColor.fromHex("#1a1a1a");
  final Color accountTextColor = HexColor.fromHex("#a6a6a6");
  final Color membershipTextColor = HexColor.fromHex("#ffb7dc");
  final Color membershipDividerColor = HexColor.fromHex("#fc8fc7");
  final Color starColor = HexColor.fromHex("#eecd3e");
  final Color alertColor = HexColor.fromHex("#ff0028");
  final Color themeColor = HexColor.fromHex("#cab272");
  final Color bgColor = HexColor.fromHex("#f8f8f8");
  final Color bgColorLinePercent = HexColor.fromHex("#f3f3f3");
  final Color goldColor = HexColor.fromHex("#CAB272");
  final Color grayBgColor = HexColor.fromHex("#f8f8f8");
  final Color cardBorderColor = HexColor.fromHex("#ededed");
  final Color pinkColor = HexColor.fromHex("#D94061");
  final Color darkPinkColor = HexColor.fromHex("#C42E4E");
  final Color shadowGrayColor = HexColor.fromHex("#433D3D");
  final Color blackOlive2Color = HexColor.fromHex("#3C3C3B1A");
  final Color blackGrayColor = HexColor.fromHex("#3C3C3B3B");
  final Color blackOliveColor = HexColor.fromHex("#3C3C3B");
  final Color gray = HexColor.fromHex("#868686");
  final Color rosyCheeksColor = HexColor.fromHex("#DB506E");
  final Color lowGreenColor = HexColor.fromHex("#039B4B");
  final Color lowGreen20Color = HexColor.fromHex("#33039B4B");
  final Color midOrangeColor = HexColor.fromHex("#FF774B");
  final Color midOrange20Color = HexColor.fromHex("#33FF774B");
  final Color midYellowColor = HexColor.fromHex("#EAB62B");
  final Color midYellow20Color = HexColor.fromHex("#33EAB62B");
  final Color rosyCheeks20Color = HexColor.fromHex("#33db506e");
  final Color dodgerBlueColor = HexColor.fromHex("#369DFC");
  final Color dodgerBlue20Color = HexColor.fromHex("#33369DFC");
  final Color gray90Color = HexColor.fromHex("#E5E5E5");
  final Color gray10Color = HexColor.fromHex("#AAAAAA");
  final Color lightGreyTicket = HexColor.fromHex("3c3c3b80");
  final Color blueTicketColor = HexColor.fromHex("628CFA");
  final Color lightPurpleColor = HexColor.fromHex("#816AC8");
  final Color rejectedRedColor = HexColor.fromHex("#F13F3F");
  final Color rejectedRed20Color = HexColor.fromHex("#FFF13F3F");
}

class HexColor {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
