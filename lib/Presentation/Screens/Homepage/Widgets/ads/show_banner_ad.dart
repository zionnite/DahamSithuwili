import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:uppwork/services/admob_services.dart';

class ShowBannerAd extends StatefulWidget {
  const ShowBannerAd({
    super.key,
    this.height = 52,
  });

  final double height;

  @override
  State<ShowBannerAd> createState() => _ShowBannerAdState();
}

class _ShowBannerAdState extends State<ShowBannerAd> {
  BannerAd? _banner;

  @override
  void initState() {
    super.initState();
    _createBannerAd();
  }

  _createBannerAd() {
    _banner = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMobService.bannerAdUnitId!,
      listener: AdMobService.bannerListener,
      request: const AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return (_banner == null)
        ? Container()
        : SizedBox(
            height: widget.height,
            child: AdWidget(ad: _banner!),
          );
  }
}
