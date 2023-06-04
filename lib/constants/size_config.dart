import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double devicePixelRatio;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  static double font24;
  static double font15;
  static double font12;
  static double font13;
  static double font20;
  static double font16;
  static double font17;
  static double font11;
  static double font52;
  static double font32;
  static double font14;
  static double font30;
  static double font10;

  static double padding12;
  static double padding24;
  static double padding16;
  static double padding10;
  static double padding8;
  static double padding30;
  static double padding2;
  static double padding32;
  static double padding23;
  static double padding50;
  static double padding72;
  static double padding40;
  static double padding170;
  static double padding109;
  static double padding52;
  static double padding6;
  static double padding14;
  static double padding13;
  static double padding18;
  static double padding20;
  static double padding54;
  static double padding61;
  static double padding48;
  static double padding100;
  static double padding45;


  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    devicePixelRatio = _mediaQueryData.devicePixelRatio;



    _safeAreaHorizontal = _mediaQueryData.padding.left +
        _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth -
        _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight -
        _safeAreaVertical) / 100;

    font24 = (screenWidth - _safeAreaHorizontal)/15;//24
    font11 = (screenWidth - _safeAreaHorizontal)/31.6;//11
    font15 = (screenWidth - _safeAreaHorizontal)/24;//15
    font12 = (screenWidth - _safeAreaHorizontal)/30;//12
    font13 = (screenWidth - _safeAreaHorizontal)/27.6;//13
    font20 = (screenWidth - _safeAreaHorizontal)/18;//20
    font16 = (screenWidth - _safeAreaHorizontal)/22.5;//16
    font11 = (screenWidth - _safeAreaHorizontal)/31.6;//11
    font52 = (screenWidth - _safeAreaHorizontal)/6 - 8;//52
    font32 = (screenWidth - _safeAreaHorizontal)/11;//32
    font14 = (screenWidth - _safeAreaHorizontal)/25;//14
    font30 = (screenWidth - _safeAreaHorizontal)/12;//30
    font17 = (screenWidth - _safeAreaHorizontal)/21;//17
    font10 = (screenWidth - _safeAreaHorizontal)/40;//10


    padding12 = (screenWidth - _safeAreaHorizontal)/30;//12
    padding24 = (screenWidth - _safeAreaHorizontal)/15;//24
    padding16 = (screenWidth - _safeAreaHorizontal)/22.5;//16
    padding10 = (screenWidth - _safeAreaHorizontal)/36;//10
    padding8 = (screenWidth - _safeAreaHorizontal)/45;//8
    padding30 = (screenWidth - _safeAreaHorizontal)/12;//30
    padding52 = (screenWidth - _safeAreaHorizontal)/6 - 8;//52
    padding2 = (screenWidth - _safeAreaHorizontal)/180;//2
    padding32 = (screenWidth - _safeAreaHorizontal)/11;//32
    padding23 = (screenWidth - _safeAreaHorizontal)/15.65;//23
    padding72 = (screenWidth - _safeAreaHorizontal)/5;//72
    padding50 = (screenWidth - _safeAreaHorizontal)/7.2;//50
    padding40 = (screenWidth - _safeAreaHorizontal)/9;//40
    padding170 = (screenWidth - _safeAreaHorizontal)/2.41;//140
    padding109 = (screenWidth - _safeAreaHorizontal)/3.3;//109
    padding13 = (screenWidth - _safeAreaHorizontal)/27.5;//13
    padding14 = (screenWidth - _safeAreaHorizontal)/25;//14
    padding18 = (screenWidth - _safeAreaHorizontal)/20;//18
    padding6 = (screenWidth - _safeAreaHorizontal)/60;//6
    padding20 = (screenWidth - _safeAreaHorizontal)/18;//20
    padding54 = (screenWidth - _safeAreaHorizontal)/6-6;//54
    padding61 = (screenWidth - _safeAreaHorizontal)/6-7;//61
    padding48 = (screenWidth - _safeAreaHorizontal)/9+3;//48
    padding100 = (screenWidth - _safeAreaHorizontal)-311;//100
    padding45 = (screenWidth - _safeAreaHorizontal)/9+5;//45
  }
}


