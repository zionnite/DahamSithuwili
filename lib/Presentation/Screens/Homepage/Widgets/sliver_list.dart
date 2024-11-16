import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uppwork/Presentation/Screens/Homepage/UI/detail_page.dart';
import 'package:uppwork/controller/item_controller.dart';

import '../../../Declarations/constants.dart';
import 'ads/show_native_ad.dart';

class SliverListBldr extends StatefulWidget {
  const SliverListBldr({
    Key? key,
  }) : super(key: key);

  @override
  State<SliverListBldr> createState() => _SliverListBldrState();
}

class _SliverListBldrState extends State<SliverListBldr> {
  final itemController = ItemController().getXID;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              var data = itemController.itemList[index];

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
            childCount: itemController.itemList.length,
          ),
        ));
  }
}
