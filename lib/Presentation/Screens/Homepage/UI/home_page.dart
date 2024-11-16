import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:uppwork/controller/item_controller.dart';

import '../Widgets/sliver_app_bar.dart';
import '../Widgets/sliver_list.dart';
import '../Widgets/sliver_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

      itemController.fetchItemMore(pageNum);

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    final itemController = ItemController().getXID;
    return Scaffold(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: const [
              SliverAppBarBldr(),
              SliverSearch(),
              SliverListBldr(),
            ],
          ),
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
          )
        ],
      ),
    );
  }
}
