import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3829918399075778/6520863008';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3829918399075778/6383263649';
    }
    return null;
  }

  static String? get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3829918399075778/1186777288';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3829918399075778/2444018638';
    }
    return null;
  }

  static String? get nativeAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3829918399075778/7560613949';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3829918399075778/1130936962';
    }
    return null;
  }

  static String? get reWardedInterAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3829918399075778/5324482780';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3829918399075778/3677209259';
    }
    return null;
  }

  static String? get reWardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3829918399075778/7507777082';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3829918399075778/1959936936';
    }
    return null;
  }

  static final BannerAdListener bannerListener = BannerAdListener(
    onAdLoaded: (ad) {
      // print('Ad Loaded');
    },
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      // print('Ad failed to load $error');
    },
    onAdOpened: (ad) {
      // print('Ad opened');
    },
    onAdClosed: (ad) {
      // print('Ad closed');
    },
  );
  static final NativeAdListener nativeListener = NativeAdListener(
    onAdLoaded: (ad) {
      // print('Ad Loaded');
    },
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      // print('Ad failed to load $error');
    },
    onAdOpened: (ad) {
      // print('Ad opened');
    },
    onAdClosed: (ad) {
      // print('Ad closed');
    },
  );
}
