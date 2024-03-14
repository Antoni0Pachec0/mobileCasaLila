import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
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
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/casalila.png'),
            ),
          ],
        ),
      ),
    );
  }
}
