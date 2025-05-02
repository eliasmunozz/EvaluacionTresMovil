import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/theme.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Center(
              child: Text(
                'Menú Principal',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar Sesión'),
            onTap: () {
              Navigator.pushNamed(context, 'login');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Sesión Cerrada')),
              );
            },
          ),
        ],
      ),
    );
  }
}
