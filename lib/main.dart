import 'package:casalila/screens/global/galeria_screen.dart';
import 'package:casalila/screens/global/perfil_screen.dart';
import 'package:casalila/screens/global/cursos_screen.dart';
import 'package:casalila/screens/global/inicio_screen.dart';
import 'package:casalila/screens/global/login_screen.dart';
import 'package:casalila/screens/global/registro_screen.dart'; 
import 'package:flutter/material.dart';

//Funcion con la que se inicia (jecuta) la aplicacion
//Esta llamando a la funcion de MyApp
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Casa Lila',
      routes: {
        'login': (_) => const LoginScreen(),
        'signin': (_) => const SignInScreen(),
        'home': (_) => const HomeScreen(),
        'cursos': (_) => const CursosScreen(),
        'galery': (_) => const GaleryScreen(),
        'profile': (_) => const ProfileScreen(),
      },
      initialRoute: 'login', // Set initial route to 'login' or 'signin'
    );
  }
}
