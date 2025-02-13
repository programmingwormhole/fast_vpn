import 'package:flutter/material.dart';

import 'custom_gradient.dart';

final Shader textGradient = customGradient().createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

Paint customTextGradient () => Paint()..shader = textGradient;