import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'home_page.dart'; // Asegúrate de que esta importación esté aquí
import 'history_page.dart';
import 'statistics_page.dart'; // Agrega también la página de estadísticas

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Asegúrate de inicializar Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moba',
      theme: ThemeData(
        primarySwatch: Colors.teal, // El color principal de la app
      ),
      initialRoute: '/login', // La ruta inicial es el login
      routes: {
        '/login': (context) => LoginPage(), // Página de inicio de sesión
        '/register': (context) => RegisterPage(), // Página de registro
        '/home': (context) => HomePage(), // Página principal (home)
        '/history': (context) => HistoryPage(), // Página del historial
        '/statistics': (context) => StatisticsPage(), // Página de estadísticas
      },
    );
  }
}