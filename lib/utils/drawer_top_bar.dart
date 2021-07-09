import 'package:flutter/material.dart';
import 'package:portfolio_app/constants.dart';

class DrawerTopBar extends StatelessWidget {
  const DrawerTopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0db338),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(-4, 4),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 3, right: 5, top: 20, bottom: 10),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/me.jpeg'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Suramya Das',
                    style: kNavBarMajorTextStyle,
                    textAlign: TextAlign.left,
                  ),
                  Text('suramyadas2000@gmail.com',
                      style: kNavBarMinorTextStyle, textAlign: TextAlign.start),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
