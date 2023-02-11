import 'package:dio/dio.dart';
import 'package:grahnumb_assignment/models/datamodel.dart';
import 'constant.dart';

Future<List<Data>> getData({int page=1, int numberOfItems=6}) async {
  List<Data> ans = [];
  try {
    var response = await Dio().get(link+"per_page=$numberOfItems&page=$page");
   // print(response.data[4]["primary_category"]["description"]);
    for (int i = 0; i < response.data.length; i++) {

      ans.add(Data.fromJson(response.data[i]));
    }

    return ans;
  } catch (e) {
    print(e);
    throw e;
  }
}
