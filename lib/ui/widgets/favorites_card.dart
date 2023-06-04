import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constants/size_config.dart';

class FavoritesCard extends StatelessWidget {
  FavoritesCard({this.image, this.name, this.year, this.artist, this.onTap, this.favorite});
  final String image;
  final String name;
  final String year;
  final String artist;
  final VoidCallback onTap;
  final bool favorite;

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
                  maxLines: 1,
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

        ],
      ),
    );
  }
}
