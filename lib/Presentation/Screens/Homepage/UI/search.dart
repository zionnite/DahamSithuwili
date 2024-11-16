import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:uppwork/Presentation/Declarations/constants.dart';
import 'package:uppwork/Presentation/Screens/Homepage/Widgets/ads/show_native_ad.dart';
import 'package:uppwork/controller/item_controller.dart';

import 'detail_page.dart';

class Search extends StatefulWidget {
  const Search({super.key, required this.keyword});
  final String keyword;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final itemController = ItemController().getXID;
  late ScrollController _scrollController;
  int pageNum = 1;
  bool isLoading = false;

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      setState(() {
        pageNum++;
        isLoading = true;
      });

      itemController.fetchSearchMore(pageNum, widget.keyword);

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  initUserDetail() async {
    await itemController.fetchSearchItem(1, widget.keyword);
  }

  @override
  void initState() {
    super.initState();
    initUserDetail();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    final itemController = ItemController().getXID;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Obx(() => ListView.builder(
                  padding: const EdgeInsets.only(bottom: 0, top: 0.0, left: 0, right: 0),
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: itemController.searchItemList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = itemController.searchItemList[index];
                    if (data.status == 'ADs') {
                      // return const ShowBannerAd(height: 88);
                      return const ShowNativeAd();
                    } else {
                      return InkWell(
                        onTap: () {
                          Get.to(() => DetailPage(data: data));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, bottom: 5, right: 8),
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: kBorderRadius,
                                ),
                                // height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: data.image,
                                      height: 250,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorWidget: (context, url, error) => Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Image.asset(
                                          'assets/images/feature.png',
                                          height: 250,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      data.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      data.desc,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                )),
            Positioned(
              bottom: 50,
              child: (isLoading)
                  ? Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Center(
                              child: LoadingAnimationWidget.fourRotatingDots(
                                // leftDotColor: const Color(0xFF1A1A3F),
                                // rightDotColor: const Color(0xFFEA3799),
                                size: 50, color: Colors.red,
                              ),
                            ),
                            Text('Fetching More Data')
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
