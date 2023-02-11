

import 'package:get/get.dart';
import 'package:grahnumb_assignment/service.dart';

import '../models/datamodel.dart';

class HomeScreenController extends GetxController {
  bool isLoading = true;
  bool initialLoading = true;
  bool isEnd = false;
  int page = 1;
  int numberOfItems = 6;
  bool canLoadMore=true;

  List<Data> data = [];

  @override
  void onInit() {
    // TODO: implement onInit
    Future.delayed(Duration.zero).then((value) {
      print("onit");
     // print("here");
      fetchData();
    });
    super.onInit();
  }

  fetchData() async {



    try {
      var list = [];
      list = await getData(numberOfItems: numberOfItems, page: page);

      if (list != null && list.isNotEmpty) {
        for (int i = 0; i < list.length; i++) {
          data.add(list[i]);
        }
      }
      if (list.length < numberOfItems) {
        isEnd = true;
      }
      page++;
      initialLoading = false;
      update();
    } catch (e) {
      canLoadMore=false;
      initialLoading=false;
      update();
    }
  }
}
