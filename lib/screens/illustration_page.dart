import 'package:flutter/material.dart';
import 'package:portfolio_app/screens/add_images.dart';
import 'package:portfolio_app/utils/grid_pageview.dart';
import 'package:portfolio_app/utils/navigation_drawer.dart';

class SketchesPage extends StatefulWidget {
  const SketchesPage({Key? key}) : super(key: key);

  @override
  _SketchesPageState createState() => _SketchesPageState();
}

class _SketchesPageState extends State<SketchesPage> {
  String addIllustrationPage = '/addImage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationDrawer(),
        body: GridPageBody(
          headingText: 'Illustrations',
          collectionTitle: 'sketchUrls',
          buildContext: context,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddImage(
                        headingText: 'Add Illustrations',
                        directory: 'illustrations',
                        collectionPath: 'sketchUrls')));
          },
          child: const Icon(Icons.add),
        ));
  }
}
