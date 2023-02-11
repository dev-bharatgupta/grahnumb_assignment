import 'package:grahnumb_assignment/constant.dart';

class Data {
  final String title;
  final String description;
  final String jetpack_featured_media_url;

  Data({required this.title, required this.jetpack_featured_media_url,required this.description});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      description: json["primary_category"]["description"] == null ||
          json["primary_category"]["description"] == ""
          ? "No description found"
          : json["primary_category"]["description"],
        title: json["parselyMeta"]["parsely-title"] == null ||
                json["parselyMeta"]["parsely-title"] == ""
            ? "No title found"
            : json["parselyMeta"]["parsely-title"],
        jetpack_featured_media_url:
            json["jetpack_featured_media_url"] == null ||
                    json["jetpack_featured_media_url"] == ""
                ? sampleImage
                : json["jetpack_featured_media_url"]);
  }
}
