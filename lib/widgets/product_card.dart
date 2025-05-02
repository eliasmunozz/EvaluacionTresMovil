import 'package:flutter_application_1/models/productos.dart';
import 'package:flutter_application_1/theme/theme.dart';

class ProductCard extends StatelessWidget {
  final Listado product;
  final Widget? trailing;

  const ProductCard({super.key, required this.product, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        decoration: _cardDecorations(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProductDetails(product: product),
            _BackGroundImage(url: product.productImage),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _PriceTag(product: product),
                  if (trailing != null) trailing!,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardDecorations(BuildContext context) => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: MyTheme.primary.withOpacity(0.2),
            offset: const Offset(0, 5),
            blurRadius: 8,
          )
        ],
      );
}

class _ProductDetails extends StatelessWidget {
  final Listado product;

  const _ProductDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        product.productName,
        style: TextStyle(
            fontSize: 20, color: MyTheme.primary, fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _BackGroundImage extends StatelessWidget {
  final String? url;

  const _BackGroundImage({this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: double.infinity,
        child: url == null
            ? const Image(
                image: AssetImage('assets/no-image.png'),
                fit: BoxFit.cover,
              )
            : FadeInImage(
                placeholder: const AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(url!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final Listado product;

  const _PriceTag({required this.product});

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${product.productPrice}',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: MyTheme.primary,
      ),
    );
  }
}







