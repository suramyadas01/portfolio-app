import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:portfolio_app/constants.dart';
import 'package:portfolio_app/utils/drawer_top_bar.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white70,
        child: ListView(
          children: [
            const DrawerTopBar(),
            ListTile(
              contentPadding: const EdgeInsets.only(top: 8.0, left: 15),
              leading: const Icon(Icons.home),
              title: const Text(
                'Home',
                style: kNavBarListTextStyle,
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(top: 8.0, left: 15),
              leading: const Icon(Icons.camera_alt),
              title: const Text(
                'Photographs',
                style: kNavBarListTextStyle,
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/photos');
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(top: 8.0, left: 15),
              leading: const Icon(Icons.brush),
              title: const Text(
                'Illustrations',
                style: kNavBarListTextStyle,
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/sketches');
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(top: 8.0, left: 15),
              leading: const Icon(Icons.document_scanner_outlined),
              title: const Text(
                'Blogs',
                style: kNavBarListTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(top: 8.0, left: 15),
              leading: const Icon(Icons.person),
              title: const Text(
                'About Me',
                style: kNavBarListTextStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(top: 8.0, left: 15),
              leading: const Icon(Icons.mail),
              title: const Text(
                'Contact Me',
                style: kNavBarListTextStyle,
              ),
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Admin Panel',
                style:
                    kNavBarListTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(top: 8.0, left: 15),
              leading: const Icon(Icons.login),
              title: const Text(
                'Login',
                style: kNavBarListTextStyle,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
