import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/screen.dart';

class AppRoutes {
  static const initialRoute = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginScreen(),
    'list': (BuildContext context) => const ListProductScreen(),
    'edit': (BuildContext context) => const EditProductScreen(),  // Ruta de edición
    'view_product': (BuildContext context) => const ViewProductScreen(),
    'add_user': (BuildContext context) => const RegisterUserScreen(),
    'cart_list': (BuildContext context) => const CartListScreen(),
    'new': (BuildContext context) => const CreateProductScreen()
    
  };


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // Agregar control para rutas no definidas
    return MaterialPageRoute(
      builder: (context) {
        return const ErrorScreen();
      },
    );
  }
}

