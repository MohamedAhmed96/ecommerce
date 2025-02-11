import 'package:ecommerce/data/models/product_model.dart';
import 'package:flutter/material.dart';

class PriceRatingWidget extends StatelessWidget {
  const PriceRatingWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double height = constraints.minHeight < 150 ? 150 : constraints.maxHeight;
      double width = constraints.minWidth < 150 ? 150 : constraints.maxWidth;
      return Row(
        children: [
          Container(
            height: height * 0.15,
            width: width * 0.5,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: FittedBox(
              child: Center(
                child: Text(
                  "${product.price.toString()} \$",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: width * 0.05,
          ),
          SizedBox(
            height: height * 0.15,
            width: width * 0.1,
            child: FittedBox(
              child: Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.15,
            width: width * 0.1,
            child: FittedBox(
              child: Text(
                product.rating.rate.toString(),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
