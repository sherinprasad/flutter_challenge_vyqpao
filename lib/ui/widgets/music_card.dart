import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constants/size_config.dart';

class MusicCard extends StatefulWidget {
  MusicCard({this.image, this.name, this.year, this.artist});
  final String image;
  final String name;
  final String year;
  final String artist;


  @override
  State<MusicCard> createState() => _MusicCardState();
}

class _MusicCardState extends State<MusicCard> {
  bool isFavorite = false;

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
            child: Image.network(widget.image),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name.toUpperCase(),
                  maxLines: 1,
                  style: TextStyle(
                      height: 1.3,
                      fontSize: SizeConfig.font12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(height: 2),
                Text(
                  DateFormat("yyyy").format(DateTime.parse(widget.year)),
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
                    widget.artist,
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
              height: 20,
              width: 20,
              child: InkWell(
                onTap: () {
                  isFavorite == false?
                  setState(() {
                   isFavorite = true;
                  }):setState(() {
                    isFavorite = false;
                  });
                },
                child: isFavorite == true
                    ? Image.asset('assets/png/button_rating_active.png')
                    : Image.asset('assets/png/button_rating_def.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
