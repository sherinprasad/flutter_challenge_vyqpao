import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/size_config.dart';

class MusicCard extends StatelessWidget {
  MusicCard({this.image, this.onTap, this.name, this.year, this.artist});
  final String image;
  final VoidCallback onTap;
  final String name;
  final String year;
  final String artist;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 51,
            width: 51,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Image.network(image),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.toUpperCase(),
                  style: TextStyle(
                      height: 1.3,
                      fontSize: SizeConfig.font12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(height: 2),
                Text(
                  DateFormat("yyyy").format(DateTime.parse(year)),

                  style: TextStyle(
                      height: 1.3,
                      fontSize: SizeConfig.font12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF3ebeb7)),
                ),
                SizedBox(height: 0),
                Container(
                  width: MediaQuery.of(context).size.width - 195,
                  child: Text(
                    artist,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        height: 1.3,
                        fontSize: SizeConfig.font12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFabafb4)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 30),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: SizeConfig.padding20),
            child: Container(
              height:20,
              width: 20,
              child: InkWell(
                onTap: onTap,
                child: Image.asset('assets/png/button_rating_def.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
