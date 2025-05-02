import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/productos.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

class ViewProductScreen extends StatelessWidget {
  const ViewProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Listado? product = ModalRoute.of(context)?.settings.arguments as Listado?;

    if (product == null) {
      return const Scaffold(
        body: Center(
          child: Text('Producto no encontrado', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      );
    }

    final isNew = product.productId == 0;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Detalles producto'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(product.productImage, height: 200)),
            const SizedBox(height: 16),
            Text(
              'Nombre del Producto:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Nombre del producto',
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: product.productName),
              readOnly: !isNew,
            ),
            const SizedBox(height: 16),
            Text(
              'Precio:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${product.productPrice}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Text(
              'Estado:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${product.productState}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  'edit', // Ruta a la vista de edición
                  arguments: product, // Pasamos el producto aquí
                );
              },
              child: const Text('Editar Producto'),
            ),
          ],
        ),
      ),
    );
  }
}






