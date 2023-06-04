import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge_vyqpao/ui/screens/favorites.dart';
import 'package:flutter_challenge_vyqpao/ui/screens/static_home_page.dart';
import 'package:shimmer/shimmer.dart';
import '../../bloc/home_bloc.dart';
import '../../constants/app_colors.dart';
import '../../constants/size_config.dart';
import '../../models/music_model.dart';
import '../widgets/music_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  AppColors appColors;
  HomeBloc homeBloc;
  List newList = [];
  List responseDataList = [];
  List favoriteList = [];
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
              title: Padding(
                padding: EdgeInsetsDirectional.only(
                    start: SizeConfig.padding12, end: SizeConfig.padding12),
                child: Text(
                  'SaltPay Music',
                  style: TextStyle(
                    fontSize: SizeConfig.font20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ))),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overScroll) {
            overScroll.disallowGlow();
            return true;
          },
          child: StreamBuilder<List<MusicModel>>(
              stream: homeBloc.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Shimmer.fromColors(
                      baseColor: Color(0xFFF6F6F6),
                      highlightColor: Colors.grey[300],
                      child: StaticHomePage());
                }
                responseDataList = snapshot.data[0].feed.entry;

                return responseDataList == null
                    ? Container(
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
                                  'No results found',
                                  style: TextStyle(
                                      fontSize: SizeConfig.font17,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF0f0f10)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: SizeConfig.padding16,
                              start: SizeConfig.padding16,
                              end: SizeConfig.padding16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        // width: MediaQuery.of(context).size.width,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Color(0xFFe6e6e6)),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.only(
                                            start: SizeConfig.padding2,
                                          ),
                                          child: Center(
                                            child: TextField(
                                              controller: searchController,
                                              keyboardType: TextInputType.text,
                                              cursorColor: appColors.powderBlue,
                                              autofocus: false,
                                              textCapitalization:
                                                  TextCapitalization.sentences,
                                              style: TextStyle(
                                                  fontSize: SizeConfig.font15,
                                                  color: appColors.darkGrey),
                                              //  onChanged: (searchText) {},
                                              onChanged: (searchText) {
                                                setState(() {
                                                  newList = responseDataList
                                                      .where((u) => (u
                                                              .imName.label
                                                              .toUpperCase()
                                                              .contains(searchText
                                                                  .toUpperCase()) ||
                                                          u.imArtist.label
                                                              .toUpperCase()
                                                              .contains(searchText
                                                                  .toUpperCase())))
                                                      .toList();

                                                  searchText.isNotEmpty &&
                                                          newList.isEmpty
                                                      ? setState(() {
                                                          showMessage = true;
                                                        })
                                                      : showMessage = false;
                                                });
                                              },
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        top: 12),
                                                isDense: true,
                                                hintText: 'Search',
                                                hintStyle: TextStyle(
                                                  fontSize: SizeConfig.font15,
                                                  color:
                                                      appColors.lightGreyBlue,
                                                ),
                                                prefixIcon: IconButton(
                                                  icon: Image.asset(
                                                      "assets/png/ic_search.png"),
                                                  onPressed: () {},
                                                ),
                                                suffixIcon: IconButton(
                                                  icon: Image.asset(
                                                      "assets/png/button_clear.png"),
                                                  onPressed: () {
                                                    setState(() {
                                                      searchController.clear();
                                                      newList = [];
                                                      showMessage = false;
                                                      FocusScope.of(context).unfocus();
                                                    });
                                                  },
                                                ),
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 30),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Favorites(
                                                    newList: favoriteList,
                                                  )),
                                        );
                                      },
                                      child: Container(
                                        //width:SizeConfig.padding100,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF3ebeb7),
                                          border: Border.all(
                                              color: Color(0xFFe6e6e6)),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: SizeConfig.padding8,
                                                right: SizeConfig.padding8),
                                            child: Text(
                                              "Favorites",
                                              style: TextStyle(
                                                fontSize: SizeConfig.font15,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(height: 28),
                              showMessage == true
                                  ? Container(
                                      height: SizeConfig.screenHeight - 400,
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: SizeConfig.padding20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .20,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .32,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/png/empty.png'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                "No results found",
                                                style: TextStyle(
                                                    fontSize: SizeConfig.font17,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 50),
                                        Visibility(
                                          visible: true,
                                          child: Text(
                                            "Top 100 Albums",
                                            style: TextStyle(
                                                fontSize: SizeConfig.font17,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ),
                                        newMethod(responseDataList),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      );
              }),
        ),
      ),
    );
  }

  Widget newMethod(List responseDataList) {
    if (newList.isEmpty && searchController.text.isEmpty) {
      newList = responseDataList;
    }
    return ListView.builder(
        padding: EdgeInsetsDirectional.zero,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: newList.length,
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
                  onTap: () {
                    newList[index].favorite == false
                        ? setState(() {
                            newList[index].favorite = true;
                            favoriteList.add(newList[index]);
                          })
                        : setState(() {
                            newList[index].favorite = false;
                            favoriteList.remove(newList[index]);
                          });
                  },
                  child: MusicCard(
                    name: newList[index].imName.label.toString(),
                    year: newList[index].imReleaseDate.label.toString(),
                    artist: newList[index].imArtist.label.toString(),
                    image: newList[index].imImage[2].label.toString(),
                    favorite: newList[index].favorite,
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
        });
  }
}
