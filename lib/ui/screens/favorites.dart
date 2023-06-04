import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge_vyqpao/ui/screens/static_home_page.dart';
import 'package:shimmer/shimmer.dart';
import '../../bloc/home_bloc.dart';
import '../../constants/app_colors.dart';
import '../../constants/size_config.dart';
import '../../models/music_model.dart';
import '../widgets/favorites_card.dart';
import '../widgets/music_card.dart';
import 'package:flutter/src/widgets/icon.dart' as icon;

class Favorites extends StatefulWidget {
  List newList;
  Favorites({this.newList});
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final searchController = TextEditingController();
  AppColors appColors;
  HomeBloc homeBloc;
  List responseDataList = [];
  bool showMessage = false;

  @override
  void initState() {
    appColors = AppColors();
    homeBloc = HomeBloc();
    homeBloc.homePage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness:
                    Brightness.light, // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),
              backgroundColor: Colors.black,
              automaticallyImplyLeading: false,
              titleSpacing: 0,
              elevation: 0.6,
              bottomOpacity: 0.0,
              title: Row(
                children: [
                  IconButton(
                    icon: icon.Icon(Icons.arrow_back,
                        color: Colors.white, size: 24),
                    onPressed: () {
                      Navigator.of(context).pop();
                      FocusScope.of(context).unfocus();
                    },
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: SizeConfig.padding12, end: SizeConfig.padding12),
                    child: Text(
                      'Favorites',
                      style: TextStyle(
                        fontSize: SizeConfig.font20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ))),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overScroll) {
            overScroll.disallowGlow();
            return true;
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  top: SizeConfig.padding16,
                  start: SizeConfig.padding16,
                  end: SizeConfig.padding16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.newList.isEmpty?Container(
                    height: SizeConfig.screenHeight - 400,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: SizeConfig.padding20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height:
                              MediaQuery.of(context).size.width * .20,
                              width:
                              MediaQuery.of(context).size.width * .32,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/png/empty.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                             "You have not added any favorites!",
                              style: TextStyle(
                                  fontSize: SizeConfig.font17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ):
                  ListView.builder(
                      padding: EdgeInsetsDirectional.zero,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.newList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  SizeConfig.padding16,
                                  SizeConfig.padding16,
                                  SizeConfig.padding16,
                                  SizeConfig.padding12),
                              // 16, 19, 19, 19),
                              child: InkWell(
                                onTap: () {},
                                child: FavoritesCard(
                                  name: widget.newList[index].imName.label.toString(),
                                  year: widget.newList[index]
                                      .imReleaseDate
                                      .label
                                      .toString(),
                                  artist:
                                      widget.newList[index].imArtist.label.toString(),
                                  image: widget.newList[index]
                                      .imImage[2]
                                      .label
                                      .toString(),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey,
                              height: 1,
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
