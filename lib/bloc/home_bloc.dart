import 'dart:async';
import '../models/music_model.dart';
import '../services/api_provider.dart';

abstract class Bloc {
  void dispose();
}

class HomeBloc implements Bloc {
  final _controller = StreamController<List<MusicModel>>.broadcast();
  Stream<List<MusicModel>> get stream => _controller.stream;
  List<MusicModel> itemList = List();
  List<MusicModel> itemListDetails = [];

  Future homePage() async {
    Map map = {};
    itemList.clear();
    itemList = await HomeApiProvider.homePage();
    if (itemList != null) {
      itemListDetails.addAll(itemList);
      _controller.sink.add(itemListDetails);
    }
    return map;
  }

  @override
  void dispose() {
    _controller.close();
  }
}
