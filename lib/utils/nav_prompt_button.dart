import 'package:flutter/material.dart';

class NavPromptButton extends StatelessWidget {
  const NavPromptButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: MediaQuery.of(context).size.width - 50,
      child: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            iconSize: 35,
            icon: const Icon(
              Icons.menu,
              color: Color(0xFF0db338),
            ),
          );
        },
      ),
    );
  }
}
