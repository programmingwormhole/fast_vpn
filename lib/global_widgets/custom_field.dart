import 'package:fast_vpn/global_widgets/custom_sizedbox.dart';
import 'package:fast_vpn/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomField extends StatefulWidget {
  final String label;
  final String hintText;
  final double gap;
  final bool isSecured;
  final bool isRequired;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? prefixIcon;
  final Widget? suffixIcon;

  const CustomField({
    super.key,
    required this.label,
    this.hintText = '',
    this.gap = 15,
    this.isSecured = false,
    this.isRequired = false,
    this.onChanged,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Gap(5),
        Focus(
          onFocusChange: (hasFocus) {
            setState(() {}); // Trigger rebuild on focus change
          },
          child: TextFormField(
            focusNode: _focusNode,
            controller: widget.controller,
            onChanged: widget.onChanged,
            obscureText: widget.isSecured,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        widget.prefixIcon!,
                        height: 28,
                        width: 28,
                        color: _focusNode.hasFocus
                            ? AppColors.primary
                            : AppColors.darkLightBlackWhite.withOpacity(.2),
                      ),
                    )
                  : null,
              suffixIcon: widget.suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.darkLightBlackWhite.withOpacity(.1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                ),
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: AppColors.darkLightBlackWhite.withOpacity(.2),
              ),
            ),
          ),
        ),
        Gap(widget.gap),
      ],
    );
  }
}
