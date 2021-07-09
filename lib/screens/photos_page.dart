import 'package:flutter/material.dart';
import 'package:portfolio_app/screens/add_images.dart';
import 'package:portfolio_app/utils/grid_pageview.dart';
import 'package:portfolio_app/utils/navigation_drawer.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({Key? key}) : super(key: key);

  @override
  _PhotosPageState createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  String addImagePage = '/addImage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationDrawer(),
        body: GridPageBody(
          headingText: 'Photographs',
          collectionTitle: 'imageUrls',
          buildContext: context,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddImage(
                        headingText: 'Add Image',
                        directory: 'photos',
                        collectionPath: 'imageUrls')));
          },
          child: const Icon(Icons.add),
        ));
  }
}
