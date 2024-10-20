import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'app_colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Moba',
          style: TextStyle(
            fontFamily: 'JosefinSans',
            fontSize: 30, // Tamaño de fuente aumentado
            fontWeight: FontWeight.w900, // Grosor mayor
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bastón de ${user?.displayName ?? "Usuario"}',
              style: TextStyle(
                fontFamily: 'JosefinSans',
                fontSize: 26, // Tamaño de fuente aumentado
                fontWeight: FontWeight.w700, // Grosor menor que el nombre de la app
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/statistics');
              },
              child: Text(
                'Ver Estadísticas',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/history');
              },
              child: Text(
                'Ver Historial de Detecciones',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}