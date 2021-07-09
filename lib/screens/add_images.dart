import 'dart:io' as io;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:path/path.dart' as Path;

class AddImage extends StatefulWidget {
  String headingText;
  String collectionPath;
  String directory;

  AddImage({
    required this.headingText,
    required this.directory,
    required this.collectionPath,
  });

  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  final List<io.File> _images = [];
  final picker = ImagePicker();

  bool isUploading = false;
  late CollectionReference imgRef;
  late storage.Reference ref;

  @override
  void initState() {
    super.initState();
    imgRef = FirebaseFirestore.instance.collection(widget.collectionPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isUploading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.headingText,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 10,
                        height: 50,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: TextButton(
                          onPressed: () {
                            !isUploading ? pickImage() : null;
                          },
                          child: const Text(
                            'Add',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 10,
                        height: 50,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: TextButton(
                          onPressed: () {
                            !isUploading
                                ? setState(() {
                                    isUploading = true;
                                    uploadFile().whenComplete(
                                        () => Navigator.pop(context));
                                  })
                                : null;
                          },
                          child: const Text(
                            'Upload',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 530,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26)),
                    child: GridView.builder(
                      itemCount: _images.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(
                                _images[index],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.close),
      ),
    );
  }

  pickImage() async {
    final pickedImage =
        await picker.getImage(source: ImageSource.gallery, maxWidth: 480);
    if (pickedImage != null) {
      setState(() {
        _images.add(io.File(pickedImage.path));
      });
    } else {
      retrieveLostData();
    }
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _images.add(io.File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }

  Future uploadFile() async {
    var directory = widget.directory;
    for (var img in _images) {
      ref = storage.FirebaseStorage.instanceFor()
          .ref()
          .child('$directory)/${Path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          imgRef.add({'url': value});
        });
      });
    }
  }
}
