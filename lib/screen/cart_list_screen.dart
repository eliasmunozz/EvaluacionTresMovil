import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/providers.dart';
import 'package:flutter_application_1/widgets/widgets.dart';


class CartListScreen extends StatelessWidget {
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Listado de productos'),
      body: cart.itemCount == 0
          ? const Center(child: Text('Tu carrito está vacío'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.itemCount,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return ListTile(
                        leading: Image.network(
                          item.productImage,
                          width: 50,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.image_not_supported),
                        ),
                        title: Text(item.productName),
                        subtitle: Text('\$${item.productPrice}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            cart.removeItem(item);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total: \$${cart.totalPrice}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      ElevatedButton(
                        onPressed: () {
                          // Aquí va la lógica para finalizar compra
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Compra realizada')),
                          );
                          cart.clearCart();
                        },
                        child: const Text('Finalizar compra'),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
