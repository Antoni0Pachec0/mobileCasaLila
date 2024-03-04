import 'package:casalila/screens/home_screen.dart';
import 'package:casalila/screens/login_screen.dart';
import 'package:casalila/screens/signin_screen.dart'; // Import the SignInScreen
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
      },
      initialRoute: 'login', // Set initial route to 'login' or 'signin'
    );
  }
}
