import 'package:flutter/material.dart';

import '../utils/colors.dart';

LinearGradient customGradient () => const LinearGradient(
  colors: [
    AppColors.secondary,
    AppColors.primary,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);