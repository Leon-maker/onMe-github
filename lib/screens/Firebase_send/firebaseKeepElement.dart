import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String randomName = "";
String randomUrl = "";
String nameClothes = "";
String imageClothesUrl = "";

void recupererCollectionBrands(void Function(String, String, String, String) callback) {
  FirebaseFirestore.instance
    .collection('brands')
    .get()
    .then((QuerySnapshot querySnapshot) {
      List<DocumentSnapshot> documents = querySnapshot.docs;
      if (documents.isNotEmpty) {
        int randomIndex = Random().nextInt(documents.length);
        DocumentSnapshot randomDoc = documents[randomIndex];
        Map<String, dynamic>? data = randomDoc.data() as Map<String, dynamic>?;
        if (data != null) {
          randomName = data['name'];
          randomUrl = data['logo_url'];

          print('Élément aléatoire : $randomName');
          // Récupérer la collection "clothes" associée au nom aléatoire
          CollectionReference clothesCollection = randomDoc.reference.collection('clothes');
          clothesCollection.get().then((QuerySnapshot clothesSnapshot) {
            // Vérifier si la collection n'est pas vide
            if (clothesSnapshot.docs.isNotEmpty) {
              int randomClothesIndex = Random().nextInt(clothesSnapshot.docs.length);
              DocumentSnapshot randomClothesDoc = clothesSnapshot.docs[randomClothesIndex];
              var clothesData = randomClothesDoc.data();
              if (clothesData != null && clothesData is Map<String, dynamic>) {
                nameClothes = clothesData['nameClothes'];
                imageClothesUrl = clothesData['imageClothesUrl'];
                if (nameClothes != null && imageClothesUrl != null) {
                  print(nameClothes);
                  print(imageClothesUrl);
                }
              }
            } else {
              print('La collection "clothes" est vide.');
            }

            // Appeler le callback avec les valeurs
            callback(randomName, randomUrl, nameClothes, imageClothesUrl);
          }).catchError((e) {
            print('Erreur lors de la récupération de la collection "clothes" : $e');
          });
        } else {
          print('Le document sélectionné est vide.');
        }
      } else {
        print('La collection "brands" est vide.');
      }
    }).catchError((e) {
      print('Erreur lors de la récupération de la collection "brands" : $e');
    });
}

