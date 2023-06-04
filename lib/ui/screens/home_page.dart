import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  Feed responseDataList;
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
      // backgroundColor: Color(0xFFf8f8f8),
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
                responseDataList = snapshot.data[0].feed;

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
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xFFe6e6e6)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    start: SizeConfig.padding2,
                                  ),
                                  child: Center(
                                    child: TextField(
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
                                        print(
                                            'search is ${searchController.text}');
                                        setState(() {
                                          newList = responseDataList.entry
                                              .where((u) => (u.imName.label
                                                  .toUpperCase()
                                                  .contains(
                                                      searchText.toUpperCase())))
                                              .toList();
                                          print('newList is $newList');
                                          searchText.isNotEmpty &&
                                                  newList.length == 0
                                              ? setState(() {
                                                  showMessage = true;
                                                  print("show is $showMessage");
                                                })
                                              : showMessage = false;
                                          print(searchController.text.isEmpty);
                                        });
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(top: 12),
                                        isDense: true,
                                        hintText: 'Search',
                                        hintStyle: TextStyle(
                                          fontSize: SizeConfig.font15,
                                          color: appColors.lightGreyBlue,
                                        ),
                                        prefixIcon: searchController.text.isEmpty
                                            ? IconButton(
                                                icon: Image.asset(
                                                    "assets/png/ic_search.png"),
                                                onPressed: () {},
                                              )
                                            : IconButton(
                                                icon: Image.asset(
                                                    "assets/png/button_close.png"),
                                                onPressed: () {
                                                  setState(() {
                                                    searchController.clear();
                                                  });
                                                },
                                              ),
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
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
                                                    color: Color(0xFF0f0f10)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  // Container(
                                  //   child: Padding(
                                  //     padding: EdgeInsetsDirectional.only(
                                  //         top: 20.0),
                                  //     child: Text(
                                  //
                                  //      "No results found",
                                  //       style: TextStyle(
                                  //           fontSize: SizeConfig.font13,
                                  //           color: appColors.veryLightPink,
                                  //           fontWeight: FontWeight.w400),
                                  //     ),
                                  //   ),
                                  // )
                                  : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 50),
                                        Text(
                                          "Top 100 Albums",
                                          style: TextStyle(
                                              fontSize: SizeConfig.font17,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                        ListView.builder(
                                            padding: EdgeInsetsDirectional.zero,
                                            physics: ClampingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount:
                                                responseDataList.entry.length,
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
                                                        // Navigator.push(
                                                        //   context,
                                                        //   MaterialPageRoute(
                                                        //     builder: (_) =>
                                                        //
                                                        //   ),
                                                        // );
                                                      },
                                                      child: MusicCard(
                                                          name: responseDataList
                                                              .entry[index].imName.label
                                                              .toString(),
                                                          year:
                                                          responseDataList
                                                              .entry[index].imReleaseDate.label
                                                              .toString(),
                                                          artist: responseDataList
                                                              .entry[index].imArtist.label
                                                              .toString(),
                                                          image: responseDataList
                                                              .entry[index]
                                                              .imImage[2].label
                                                              .toString(),
                                                          onTap: () {}
                                                          // Navigator.push(
                                                          //             context,
                                                          //             MaterialPageRoute(
                                                          //               builder: (_) =>
                                                          //                   TopServiceBooking(
                                                          //
                                                          //                   ),
                                                          //             ),
                                                          //           ),
                                                          ),
                                                    ),
                                                  ),
                                                  Divider(
                                                    thickness: 1,
                                                    color: Color(0xFFf1f2f3),
                                                    height: 1,
                                                  ),
                                                ],
                                              );
                                            }),
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
}
