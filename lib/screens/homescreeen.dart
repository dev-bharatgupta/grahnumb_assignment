import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grahnumb_assignment/constant.dart';
import 'package:grahnumb_assignment/controller/homescreencontroller.dart';
import 'package:grahnumb_assignment/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late final size;
  final controller = Get.put(HomeScreenController());
  final scrollController = ScrollController();

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      scrollController.addListener(() {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels == 0)
            print('ListView scroll at top');
          else {
            print('ListView scroll at bottom');

            // Load next documents
            if (controller.isEnd == false) controller.fetchData();
          }
        }
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.maybeOf(context)!.size;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return Scaffold(
          body: controller.initialLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : controller.initialLoading == false &&
                      controller.canLoadMore == false
                  ? Center(
                      child: Text(
                      "Error!!!",
                      style: TextStyle(color: Colors.black),
                    ))
                  : CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          title: Text(
                            "TwitterLike",
                            style: TextStyle(color: Colors.black),
                          ),
                          floating: true,
                          elevation: 10.0,
                          backgroundColor: Colors.white,
                          centerTitle: true,
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(List.generate(
                              controller.isEnd == false
                                  ? controller.data.length + 1
                                  : controller.data.length, (idx) {
                            if (idx == controller.data.length &&
                                controller.isEnd == false) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                  child: controller.canLoadMore
                                      ? CircularProgressIndicator()
                                      : Text(
                                          "Can not load more...",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                ),
                              );
                            }

                            return GestureDetector(
                                onTap: () {
                                  Get.toNamed(detailScreenRoute,
                                      arguments: controller.data[idx]);
                                },
                                child: listCard(
                                    url: controller
                                        .data[idx].jetpack_featured_media_url,
                                    size: size,
                                    title: controller.data[idx].title,
                                    description:
                                        controller.data[idx].description));
                          })),
                        )
                      ],
                      controller: scrollController,
                    ),
          backgroundColor: Colors.white,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
