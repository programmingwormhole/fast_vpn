import 'package:fast_vpn/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOtpField extends StatelessWidget {
  final Function(String)? onChanged;

  const CustomOtpField({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1),
      ],
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkLightBlackWhite.withOpacity(.1),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary,
          ),
        ),
        hintText: '-',
        hintStyle: TextStyle(
          color: AppColors.darkLightBlackWhite.withOpacity(.2),
        ),
      ),
    );
  }
}
