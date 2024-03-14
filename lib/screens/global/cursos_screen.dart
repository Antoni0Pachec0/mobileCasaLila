import 'package:flutter/material.dart';
import 'package:casalila/screens/inc/topbar.dart';
import 'package:casalila/screens/inc/bottom.dart';

class CursosScreen extends StatefulWidget {
  const CursosScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CursosScreenState createState() => _CursosScreenState();
}

class _CursosScreenState extends State<CursosScreen> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopBar(),
              // Aquí puedes agregar más widgets si es necesario
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBottomBar(
                  text: "Inicio",
                  icon: Icons.home,
                  selected: selectedIndex == 0,
                  onPressed: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                    Navigator.pushReplacementNamed(context, 'home');
                  },
                ),
                IconBottomBar(
                  text: "Cursos",
                  icon: Icons.article,
                  selected: selectedIndex == 1,
                  onPressed: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                    Navigator.pushReplacementNamed(context, 'cursos');
                  },
                ),
                IconBottomBar(
                  text: "Galeria",
                  icon: Icons.collections,
                  selected: selectedIndex == 2,
                  onPressed: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                    Navigator.pushReplacementNamed(context, 'gallery');
                  },
                ),
                IconBottomBar(
                  text: "Perfil",
                  icon: Icons.person,
                  selected: selectedIndex == 3,
                  onPressed: () {
                    setState(() {
                      selectedIndex = 3;
                    });
                    Navigator.pushReplacementNamed(context, 'profile');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
