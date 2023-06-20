import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:on_me/screens/Firebase_send/firebaseKeepElement.dart';

class TendanceScreen extends StatefulWidget {
  TendanceScreen({Key? key}) : super(key: key);

  @override
  _TendanceScreenState createState() => _TendanceScreenState();
}

class _TendanceScreenState extends State<TendanceScreen> {
  String localRandomName = "";
  String localRandomUrl = "";
  String localNameClothes = "";
  String localImageClothesUrl = "";

  @override
  void initState() {
    super.initState();
    recupererCollectionBrands((randomName, randomUrl, nameClothes, imageClothesUrl) {
      setState(() {
        localRandomName = randomName;
        localRandomUrl = randomUrl;
        localNameClothes = nameClothes;
        localImageClothesUrl = imageClothesUrl;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterChat'),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      body: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 233, 206),
        body: SafeArea(
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 1.0,
              heightFactor: 0.8,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: <Widget>[
                    Image.network(
                      localRandomUrl,
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Image.network(
                              localImageClothesUrl,
                              width: 200,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                            Text(
                              localNameClothes,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Spacer(),
                                TextButton(
                                  onPressed: () {
                                    recupererCollectionBrands((randomName, randomUrl, nameClothes, imageClothesUrl) {
                                      setState(() {
                                        localRandomName = randomName;
                                        localRandomUrl = randomUrl;
                                        localNameClothes = nameClothes;
                                        localImageClothesUrl = imageClothesUrl;
                                      });
                                    });
                                    print("dislike");
                                  },
                                  child: Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                    size: 80.0,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                Spacer(),
                                TextButton(
                                  onPressed: () {
                                    recupererCollectionBrands((randomName, randomUrl, nameClothes, imageClothesUrl) {
                                      setState(() {
                                        localRandomName = randomName;
                                        localRandomUrl = randomUrl;
                                        localNameClothes = nameClothes;
                                        localImageClothesUrl = imageClothesUrl;
                                      });
                                    });
                                    print("like");
                                  },
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
                                    size: 80.0,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                Spacer(),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}