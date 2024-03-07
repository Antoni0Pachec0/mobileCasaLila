import 'package:casalila/widgets/input_decoration.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            cajaMorada(size),
            logocasalila(),
            loginform(context),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView loginform(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 250),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15,
                  offset: Offset(0, 10),
                )
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text('Iniciar Sesión',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 30),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        decoration: InputDecorations.inputDecoration(
                          hintext: 'ejemplo@gmail.com',
                          labeltext: 'Correo Electronico',
                          icono: const Icon(Icons.alternate_email_rounded),
                        ),
                        validator: (value) {
                          String pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regExp = RegExp(pattern);
                          return regExp.hasMatch(value ?? '')
                              ? null
                              : 'Ingresa un Correo valido';
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        autocorrect: false,
                        obscureText: true,
                        decoration: InputDecorations.inputDecoration(
                          hintext: '********',
                          labeltext: 'Contraseña',
                          icono: const Icon(Icons.lock_outline),
                        ),
                        validator: (value) {
                          return (value != null && value.length >= 8)
                              ? null
                              : 'La cotraseña es muy corta';
                        },
                      ),
                      const SizedBox(height: 30),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        disabledColor: Colors.grey,
                        color: Colors.purple,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 15,
                          ),
                          child: const Text(
                            'Ingresar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'home');
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 50),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'signin');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Registrarse',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 100,
                  height: 2,
                  color: const Color.fromRGBO(84, 22, 180, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SafeArea logocasalila() {
    return const SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 30.0, // Adjust top margin
            left: 0.0, // Not needed for centering
            right: 0.0, // Not needed for centering
            child: Center(
              // Ensures horizontal and vertical centering
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/casalila.png'),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container cajaMorada(Size size) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(84, 22, 180, 1),
            Color.fromRGBO(112, 39, 195, 1)
          ],
        ),
      ),
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          Positioned(top: 90, left: 30, child: burbuja()),
          Positioned(top: -40, left: -30, child: burbuja()),
          Positioned(top: -50, right: -20, child: burbuja()),
          Positioned(bottom: -50, left: 10, child: burbuja()),
          Positioned(bottom: 120, right: -30, child: burbuja()),
        ],
      ),
    );
  }

  Container burbuja() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.06),
      ),
    );
  }
}
