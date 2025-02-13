/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/error.json
  String get error => 'assets/animations/error.json';

  /// File path: assets/animations/lock.gif
  AssetGenImage get lock => const AssetGenImage('assets/animations/lock.gif');

  /// File path: assets/animations/success.json
  String get success => 'assets/animations/success.json';

  /// List of all assets
  List<dynamic> get values => [error, lock, success];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/favicon.png
  AssetGenImage get favicon => const AssetGenImage('assets/images/favicon.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [favicon, logo];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/clock.svg
  String get clock => 'assets/svg/clock.svg';

  /// File path: assets/svg/email.svg
  String get email => 'assets/svg/email.svg';

  /// File path: assets/svg/eye_closed.svg
  String get eyeClosed => 'assets/svg/eye_closed.svg';

  /// File path: assets/svg/eye_open.svg
  String get eyeOpen => 'assets/svg/eye_open.svg';

  /// File path: assets/svg/onboard_cup.svg
  String get onboardCup => 'assets/svg/onboard_cup.svg';

  /// File path: assets/svg/onboard_sheild.svg
  String get onboardSheild => 'assets/svg/onboard_sheild.svg';

  /// File path: assets/svg/onboard_sheild_network.svg
  String get onboardSheildNetwork => 'assets/svg/onboard_sheild_network.svg';

  /// File path: assets/svg/onboard_support.svg
  String get onboardSupport => 'assets/svg/onboard_support.svg';

  /// File path: assets/svg/password.svg
  String get password => 'assets/svg/password.svg';

  /// File path: assets/svg/person.svg
  String get person => 'assets/svg/person.svg';

  /// File path: assets/svg/shield.svg
  String get shield => 'assets/svg/shield.svg';

  /// List of all assets
  List<String> get values => [
        clock,
        email,
        eyeClosed,
        eyeOpen,
        onboardCup,
        onboardSheild,
        onboardSheildNetwork,
        onboardSupport,
        password,
        person,
        shield
      ];
}

class Assets {
  Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
