import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uppwork/model/item_model.dart';
import 'package:uppwork/services/api_services.dart';

class ItemController extends GetxController {
  ItemController get getXID => Get.find<ItemController>();

  var isItemProcessing = 'null'.obs;
  var isSearchItemProcessing = 'null'.obs;
  var itemList = <Datum>[].obs;
  var searchItemList = <Datum>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchItems(1);
  }

  fetchItems(pageNum) async {
    var seeker = await ApiServices.getItems(pageNum);

    if (seeker != null) {
      isItemProcessing.value = 'yes';
      if (seeker.posts.data.isNotEmpty) {
        itemList.value = seeker.posts.data;
        itemList.add(
          Datum(
            id: 'id',
            name: 'name',
            desc: 'desc',
            image: 'image',
            youtubeLink: 'youtubeLink',
            status: 'ADs',
            createdAt: 'createdAt',
            updatedAt: 'updatedAt',
          ),
        );
      }
    } else {
      isItemProcessing.value = 'no';
    }
  }

  fetchItemMore(pageNum) async {
    var seeker = await ApiServices.getItems(pageNum);
    if (seeker != null) {
      if (seeker.posts.data.isNotEmpty) {
        itemList.addAll(seeker.posts.data);
        itemList.add(
          Datum(
            id: 'id',
            name: 'name',
            desc: 'desc',
            image: 'image',
            youtubeLink: 'youtubeLink',
            status: 'ADs',
            createdAt: 'createdAt',
            updatedAt: 'updatedAt',
          ),
        );
      } else {
        Get.snackbar(
          'Oops',
          'No more data',
          colorText: Colors.white,
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {}
  }

  fetchSearchItem(pageNum, searchText) async {
    var seeker = await ApiServices.searchItems(pageNum, searchText);
    if (seeker != null) {
      isSearchItemProcessing.value = 'yes';
      if (seeker.posts.data.isNotEmpty) {
        searchItemList.value = seeker.posts.data;
        searchItemList.add(
          Datum(
            id: 'id',
            name: 'name',
            desc: 'desc',
            image: 'image',
            youtubeLink: 'youtubeLink',
            status: 'ADs',
            createdAt: 'createdAt',
            updatedAt: 'updatedAt',
          ),
        );
      } else {}
    } else {
      isSearchItemProcessing.value = 'no';
    }
  }

  fetchSearchMore(pageNum, searchText) async {
    var seeker = await ApiServices.searchItems(pageNum, searchText);
    if (seeker != null) {
      if (seeker.posts.data.isNotEmpty) {
        searchItemList.addAll(seeker.posts.data);
        searchItemList.add(
          Datum(
            id: 'id',
            name: 'name',
            desc: 'desc',
            image: 'image',
            youtubeLink: 'youtubeLink',
            status: 'ADs',
            createdAt: 'createdAt',
            updatedAt: 'updatedAt',
          ),
        );
      } else {
        Get.snackbar(
          'Oops',
          'No more data',
          colorText: Colors.white,
          backgroundColor: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {}
  }
}
