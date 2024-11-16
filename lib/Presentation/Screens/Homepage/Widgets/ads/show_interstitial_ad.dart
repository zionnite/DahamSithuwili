import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:uppwork/services/admob_services.dart';

class ShowInterstitialAd extends StatefulWidget {
  const ShowInterstitialAd({super.key});

  @override
  State<ShowInterstitialAd> createState() => _ShowInterstitialAdState();
}

class _ShowInterstitialAdState extends State<ShowInterstitialAd> {
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    _crateInterstitialAd();
  }

  _crateInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdMobService.interstitialAdUnitId!,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (ad) => _interstitialAd = null,
      ),
    );
  }

  showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _crateInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _crateInterstitialAd();
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return showInterstitialAd();
  }
}
