import 'package:flutter/material.dart';
import '../../../../core/widgets/price_chip.dart';
import '../../../home_feature/data/model/products_model.dart';

class DetailsImagePart extends StatelessWidget {
  const DetailsImagePart({super.key, required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.transparent],
              stops: [0.5, 1],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: Image.network(
            model.image ?? '',
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(bottom: 20, left: 20, child: PriceChip(price: model.price)),
      ],
    );
  }
}
