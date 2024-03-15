import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CursosScreenState createState() => _CursosScreenState();
}

class _CursosScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3; // Assuming this is the cursos screen, set it to 1
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopBar(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: SizedBox(
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBottomBar(
                  text: "Inicio",
                  icon: Icons.home,
                  selected: _selectedIndex == 0,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                    Navigator.pushNamed(context, 'home');
                  },
                ),
                IconBottomBar(
                  text: "Cursos",
                  icon: Icons.article,
                  selected: _selectedIndex == 1,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                    Navigator.pushNamed(context, 'cursos');
                  },
                ),
                IconBottomBar(
                  text: "Galeria",
                  icon: Icons.collections,
                  selected: _selectedIndex == 2,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                    Navigator.pushNamed(context, 'galery');
                  },
                ),
                IconBottomBar(
                  text: "Perfil",
                  icon: Icons.person,
                  selected: _selectedIndex == 3,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                    Navigator.pushNamed(context, 'profile');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar({
    super.key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onPressed,
  });

  final String text;
  final IconData icon;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color:
                selected ? const Color.fromRGBO(145, 35, 234, 1) : Colors.grey,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            height: .1,
            color:
                selected ? const Color.fromRGBO(145, 35, 234, 1) : Colors.grey,
          ),
        )
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(97, 7, 253, 1),
            Color.fromRGBO(112, 68, 188, 1),
          ],
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text(
                "Casa Lila",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/casalila.png'),
            ),
          ],
        ),
      ),
    );
  }
}
