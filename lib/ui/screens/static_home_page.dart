import 'package:flutter/material.dart';

import '../../constants/size_config.dart';




class StaticHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    bool isNeedSafeArea = MediaQuery.of(context).viewPadding.bottom > 0;

    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight,
                    child: Padding(
                      padding:
                      EdgeInsetsDirectional.only(top: SizeConfig.padding24),
                      child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: SizeConfig.padding16,
                                  end: SizeConfig.padding16,
                                  bottom: SizeConfig.padding8),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFf3f3f3),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(
                                        start: SizeConfig.padding16,
                                        end: SizeConfig.padding16,
                                      ),
                                      child: ListTile(
                                        dense: true,
                                        contentPadding: EdgeInsets.zero,
                                        minVerticalPadding: 0,
                                        onTap: () {},
                                        title: Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.only(
                                                  top: SizeConfig.padding16,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '',
                                                      style: TextStyle(
                                                        fontSize: SizeConfig.font15,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsetsDirectional
                                                          .only(
                                                          top: SizeConfig
                                                              .padding6,
                                                          bottom: SizeConfig
                                                              .padding16),
                                                      child: Text(
                                                        '',
                                                        style: TextStyle(
                                                          fontSize:
                                                          SizeConfig.font13,
                                                          color: Color(0xFF868686),
                                                          fontWeight:
                                                          FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width:
                                                        SizeConfig.padding16),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Transform.scale(
                                              scale: 1.2,
                                              child: Theme(
                                                data: Theme.of(context).copyWith(
                                                    unselectedWidgetColor:
                                                    Color(0xFFDCE1E3),
                                                    disabledColor:
                                                    Color(0xFFDCE1E3)),
                                                child: SizedBox(
                                                  height: 24,
                                                  width: 24,
                                                  child: Radio(
                                                    value: index,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ]))
          ],
        ),
        PositionedDirectional(
          bottom: 0,
          end: 0,
          start: 0,
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                start: SizeConfig.padding16,
                end: SizeConfig.padding16,
                bottom: SizeConfig.padding16,
                top: SizeConfig.padding8),
            child: Center(
              child: Material(
                borderRadius: BorderRadius.circular(8.0),
                color: Color(0xFFd6d6d6),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 48,
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
