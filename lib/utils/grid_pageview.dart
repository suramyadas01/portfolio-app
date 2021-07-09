import 'package:flutter/material.dart';
import 'package:portfolio_app/utils/nav_prompt_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class GridPageBody extends StatelessWidget {
  String headingText;
  String collectionTitle;
  BuildContext buildContext;

  // ignore: use_key_in_widget_constructors
  GridPageBody(
      {required this.headingText,
      required this.collectionTitle,
      required this.buildContext});

  @override
  Widget build(BuildContext buildContext) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  headingText,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const NavPromptButton(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Divider(
              thickness: 3,
              color: Colors.green.shade300,
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(collectionTitle)
                  .snapshots(),
              builder: (buildContext, snapshot) {
                return !snapshot.hasData
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (buildContext, index) {
                          return Container(
                            padding: const EdgeInsets.all(2),
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  snapshot.data!.docs[index].get('url')),
                            ),
                          );
                        });
              },
            ),
          ),
        ],
      ),
    );
  }
}
