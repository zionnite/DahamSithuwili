import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:uppwork/services/admob_services.dart';

class ShowNativeAd extends StatefulWidget {
  const ShowNativeAd({
    super.key,
    this.height = 400,
  });

  final double height;

  @override
  State<ShowNativeAd> createState() => _ShowNativeAdState();
}

class _ShowNativeAdState extends State<ShowNativeAd> {
  NativeAd? _nativeAd;
  bool _nativeAdIsLoaded = false;

  @override
  void initState() {
    super.initState();
    _createNativeAd();
  }

  _createNativeAd() {
    _nativeAd = NativeAd(
      adUnitId: AdMobService.nativeAdUnitId!,
      listener: NativeAdListener(
        onAdLoaded: (Ad ad) {
          // print('$NativeAd loaded.');
          setState(() {
            _nativeAdIsLoaded = true;
            // print('its true loaded');
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // print('$NativeAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) {
          // print('$NativeAd onAdOpened.');
        },
        onAdClosed: (Ad ad) {
          // print('$NativeAd onAdClosed.');
        },
      ),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.medium,
        mainBackgroundColor: Colors.white12,
        callToActionTextStyle: NativeTemplateTextStyle(
          size: 16.0,
        ),
        primaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.black38,
          backgroundColor: Colors.white70,
        ),
      ),
      request: const AdRequest(
        keywords: <String>[],
      ),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (_nativeAdIsLoaded == true) ? const EdgeInsets.symmetric(horizontal: 1.5, vertical: 8) : const EdgeInsets.all(0),
      height: (_nativeAdIsLoaded == true) ? widget.height : 0,
      child: (_nativeAdIsLoaded == true && _nativeAd != null) ? AdWidget(ad: _nativeAd!) : Container(),
    );
  }
}
