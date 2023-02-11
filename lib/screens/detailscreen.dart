import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grahnumb_assignment/models/datamodel.dart';
import 'package:grahnumb_assignment/widgets.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final size;
  final data = Get.arguments as Data;

  @override
  void didChangeDependencies() {
    size = MediaQuery.maybeOf(context)!.size;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imageWidget(
                      url: data.jetpack_featured_media_url,
                      height: size.width * 0.2,
                      width: size.width * 0.2,
                      radius: 1000),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      data.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                data.description,
                style: TextStyle(fontSize: 19),
              ),
              SizedBox(
                height: 8,
              ),
              imageWidget(
                  url: data.jetpack_featured_media_url,
                  height: this.size.width*0.7,
                  width: double.infinity,
                  radius: 20)
            ],
          ),
        ),
      ),
    );
  }
}
