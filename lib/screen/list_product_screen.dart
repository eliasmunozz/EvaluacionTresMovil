import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/providers.dart';
import 'package:flutter_application_1/screen/loading_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/models/productos.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:flutter_application_1/services/product_service.dart';

class ListProductScreen extends StatefulWidget {
  const ListProductScreen({super.key});

  @override
  _ListProductScreenState createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  String? _selectedCategory;
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    final _ = Provider.of<CartProvider>(context);

    if (productService.isLoading) return const LoadingScreen();

    List<String> categories = ['Todos', 'Electrónica', 'Ropa', 'Hogar', 'Juguetes'];

    return Scaffold(
      appBar: const CustomAppBar(title: 'Listado de productos', isMain: true),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Buscar productos',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query.toLowerCase();
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: DropdownButton<String>(
                hint: const Text('Seleccionar categoría'),
                value: _selectedCategory,
                onChanged: (newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
                isExpanded: true,
                items: categories.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productService.products.length,
              itemBuilder: (context, index) {
                final Listado product = productService.products[index];

                List<String> categories = ['Electrónica', 'Ropa', 'Hogar', 'Juguetes'];
                String productCategory = categories[index % categories.length];

                if ((_selectedCategory != null &&
                        _selectedCategory != 'Todos' &&
                        productCategory != _selectedCategory) ||
                    (_searchQuery.isNotEmpty &&
                        !product.productName.toLowerCase().contains(_searchQuery))) {
                  return Container();
                }

                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'view_product',
                      arguments: product,
                    );
                  },
                  child: ProductCard(
                    product: product,
                    trailing: IconButton(
                      icon: const Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false).addItem(product);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'new').then((newProduct) {
            if (newProduct != null && newProduct is Listado) {
              productService.addProduct(newProduct);
              productService.editOrCreateProduct(newProduct); 
            }
          });
        },
      ),
    );
  }
}


