import 'package:casalila/widgets/input_decoration.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            _purpleBox(size),
            _logocasalila(),
            _signInForm(context),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView _signInForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 200),
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
                Text(
                  'Registrarse',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 30),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      //apellidos
                      //FALTA VAIDAR
                      //email,contraseña
                      //mas datos
                      TextFormField(
                        keyboardType: TextInputType.name,
                        autocorrect: false,
                        decoration: InputDecorations.inputDecoration(
                          hintext: 'Nombre',
                          labeltext: 'Ingresa tu Nombre(s)',
                          icono: const Icon(Icons.face),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        autocorrect: false,
                        decoration: InputDecorations.inputDecoration(
                          hintext: 'Apellido',
                          labeltext: 'Ingresa tus Apellidos',
                          icono: const Icon(Icons.perm_identity),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        decoration: InputDecorations.inputDecoration(
                          hintext: 'ejemplo@gmail.com',
                          labeltext: 'Ingresa un correo',
                          icono: const Icon(Icons.alternate_email_rounded),
                        ),
                        validator: (value) {
                          String pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regExp = RegExp(pattern);
                          return regExp.hasMatch(value ?? '')
                              ? null
                              : 'Ingresa un Email Valido';
                        },
                      ),
                      TextFormField(
                        autocorrect: false,
                        obscureText: true,
                        decoration: InputDecorations.inputDecoration(
                          hintext: '********',
                          labeltext: 'Ingresa una Contraseña',
                          icono: const Icon(Icons.lock),
                        ),
                        validator: (value) {
                          return (value != null && value.length >= 8)
                              ? null
                              : 'La contraseña es muy corta';
                        },
                      ),
                      TextFormField(
                        autocorrect: false,
                        obscureText: true,
                        decoration: InputDecorations.inputDecoration(
                          hintext: '********',
                          labeltext: 'Confirma tu contraseña',
                          icono: const Icon(Icons.lock_outline),
                        ),
                        validator: (value) {
                          return (value != null && value.length >= 8)
                              ? null
                              : 'La contraseña es muy corta';
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
                            'Registrarse',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'home');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'login');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Iniciar Sesión',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 115,
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

  SafeArea _logocasalila() {
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

  Container _purpleBox(Size size) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(84, 22, 180, 1),
            Color.fromRGBO(112, 39, 195, 1),
          ],
        ),
      ),
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          Positioned(top: 90, left: 30, child: _bubble()),
          Positioned(top: -40, left: -30, child: _bubble()),
          Positioned(top: -50, right: -20, child: _bubble()),
          Positioned(bottom: -50, left: 10, child: _bubble()),
          Positioned(bottom: 120, right: -30, child: _bubble()),
        ],
      ),
    );
  }

  Container _bubble() {
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
