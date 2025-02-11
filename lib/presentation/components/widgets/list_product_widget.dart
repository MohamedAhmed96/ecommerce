import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/presentation/components/screens/product_details_screen.dart';
import 'package:ecommerce/presentation/components/widgets/price_rating_widget.dart';
import 'package:ecommerce/presentation/controller/products/products_bloc.dart';
import 'package:ecommerce/presentation/controller/products/products_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListProductWidget extends StatelessWidget {
  final ProductModel product;
  final bool isFavorite;
  const ListProductWidget({
    super.key,
    required this.product,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(product: product),
        ),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        double height =
            constraints.minHeight < 150 ? 150 : constraints.maxHeight;
        double width = constraints.minWidth < 200 ? 250 : constraints.maxWidth;
        return Container(
          height: height,
          width: width,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: height ,
                width: width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Image.network(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: height * 0.2,
                        width: width * 0.48,
                        child: Text(
                          product.title,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.surface,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.15,
                        width: width * 0.1,
                        child: FittedBox(
                          child: InkWell(
                            onTap: () => context
                                .read<ProductsBloc>()
                                .add(ToggleFavoriteProductsEvent(product)),
                            child: isFavorite
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  PriceRatingWidget(product: product),
                  SizedBox(
                    width: width * 0.5,
                    child: Text(
                      product.description,
                      maxLines: 2,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Theme.of(context).colorScheme.surface,
                              ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
