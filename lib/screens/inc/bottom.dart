import 'package:flutter/material.dart';


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
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: selected
                ? const Color.fromARGB(255, 255, 255, 255)
                : const Color.fromRGBO(248, 196, 248, 1),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            height: .1,
            color: selected
                ? const Color.fromARGB(255, 255, 255, 255)
                : const Color.fromRGBO(248, 196, 248, 1),
          ),
        )
      ],
    );
  }
}
