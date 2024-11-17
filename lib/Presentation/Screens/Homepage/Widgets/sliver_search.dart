import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uppwork/Presentation/Screens/Homepage/UI/search.dart';

import '../../../Declarations/constants.dart';

class SliverSearch extends StatefulWidget {
  const SliverSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<SliverSearch> createState() => _SliverSearchState();
}

class _SliverSearchState extends State<SliverSearch> {
  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.lightBlue,
      elevation: 0,
      pinned: true,
      bottom: PreferredSize(preferredSize: Size.fromHeight(-10.0), child: SizedBox()),
      flexibleSpace: SearchBar(),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController searchController = TextEditingController();
  String keyword = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding,
      child: Container(
        margin: EdgeInsets.zero,
        color: Colors.lightBlue,
        child: Container(
          margin: EdgeInsets.zero,
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: kBorderRadius / 2,
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: searchController,
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.only(top: 0.0),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
                hintText: 'Enter search...',
              ),
              onChanged: (val) {
                setState(() {
                  keyword = searchController.text;
                });
              },
              onSubmitted: (val) {
                setState(() {
                  searchController.text = '';
                });

                Get.to(() => Search(keyword: keyword));
              },
            ),
          ),
        ),
      ),
    );
  }
}
