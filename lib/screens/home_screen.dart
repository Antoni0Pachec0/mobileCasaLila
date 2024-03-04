import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopBar(),
              SearchInput(),
              PromoCard(),
              Headline(),
              CardListView(),
              SHeadline(),
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
                    }),
                IconBottomBar(
                    text: "Cursos",
                    icon: Icons.article,
                    selected: _selectedIndex == 1,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    }),
                IconBottomBar(
                    text: "Eventos",
                    icon: Icons.today,
                    selected: _selectedIndex == 2,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    }),
                IconBottomBar(
                    text: "Galeria",
                    icon: Icons.collections,
                    selected: _selectedIndex == 3,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    }),
                IconBottomBar(
                    text: "Perfil",
                    icon: Icons.person,
                    selected: _selectedIndex == 4,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 4;
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  // ignore: use_super_parameters
  const IconBottomBar(
      {super.key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed});
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
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
              color: selected
                  ? const Color.fromRGBO(145, 35, 234, 1)
                  : Colors.grey),
        )
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Casa Lila",
            style: TextStyle(
                color: Colors
                    .deepPurple, // Change this color as per your preference
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.50)),
            ]),
            child: const CircleAvatar(
              backgroundImage: AssetImage('casalila.png'),
            ),
          )
        ],
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, left: 25.0, right: 25.0, bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1)),
        ]),
        child: TextField(
          onChanged: (value) {
            //Do something wi
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Buscar',
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
        ),
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.green], // Change these colors
            )),
        child: Stack(
          children: [
            Opacity(
              opacity: .5,
              child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/BACKGROUND%202.png?alt=media&token=0d003860-ba2f-4782-a5ee-5d5684cdc244",
                  fit: BoxFit.cover),
            ),
            Image.network(
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Image.png?alt=media&token=8256c357-cf86-4f76-8c4d-4322d1ebc06c"),
            const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  "Que es\nCasa Lila?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Headline extends StatelessWidget {
  const Headline({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cursos",
                style: TextStyle(
                    color: Colors.red, // Change this color
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "Algunos de nuestros Cursos",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Text(
            "Ver Más",
            style: TextStyle(
                color: Colors.green, // Change this color
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class SHeadline extends StatelessWidget {
  const SHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Eventos",
                style: TextStyle(
                    color: Colors.red, // Change this color
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "Conocé mas de nuestros eventos",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Text(
            "Ver mas",
            style: TextStyle(
                color: Colors.green, // Change this color
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class CardListView extends StatelessWidget {
  const CardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, right: 25.0, bottom: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 175,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            Card(
                "Vegan",
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Resturant%20Image%20(1).png?alt=media&token=461162b1-686b-4b0e-a3ee-fae1cb8b5b33",
                "8 min away"),
            Card(
                "Italian ",
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Restaurant%20Image.png?alt=media&token=43509b4c-269e-4279-8c88-36dc9ed27a66",
                "12 min away"),
            Card(
                "Vegan",
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Resturant%20Image%20(1).png?alt=media&token=461162b1-686b-4b0e-a3ee-fae1cb8b5b33",
                "15 min away"),
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;

  const Card(this.text, this.imageUrl, this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 15),
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.05)),
          ],
        ),
        child: Column(
          children: [
            Image.network(imageUrl, height: 70, fit: BoxFit.cover),
            const Spacer(),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const SizedBox(
              height: 5,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
