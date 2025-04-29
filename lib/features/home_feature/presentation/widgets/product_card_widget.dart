import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/price_chip.dart';
import '../../data/model/products_model.dart';
import 'shimpper_widget.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('${Routes.details}/${product.id}');
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CachedNetworkImage(
              fadeInDuration: Duration.zero,
              fadeOutDuration: Duration.zero,
              placeholderFadeInDuration: Duration.zero,
              imageUrl: product.image ?? '',
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return const ShimmerWidget();
              },
              errorWidget: (context, url, error) {
                return const ShimmerWidget();
              },
            ),
          ),
          PositionedDirectional(
            start: 8.5.w,
            bottom: 9.h,
            child: PriceChip(price: product.price),
          ),
        ],
      ),
    );
  }
}
