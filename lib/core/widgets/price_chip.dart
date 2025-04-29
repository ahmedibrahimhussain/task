import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/recourses/styles_manger/styles_manager.dart';
import 'package:task/core/utils/num_extensions.dart';


class PriceChip extends StatelessWidget {
  final num? price;
  final Color? titleColor;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  const PriceChip({
    super.key,
    this.price,
    this.titleColor,
    this.backgroundColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: backgroundColor ?? Colors.grey.withValues(alpha: 0.7),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Text(
        '${price == null ? '0' : price!.formatPrice} LE',

        style: textStyle ?? getSemiBoldStyle(
          fontSize: 15,
          color: titleColor ?? Colors.white,
        ),
        maxLines: 1,
      ),
    );
  }
}
