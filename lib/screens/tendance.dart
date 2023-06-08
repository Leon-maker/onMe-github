import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TendanceScreen extends StatefulWidget  {
  TendanceScreen({Key? key}) : super(key: key);

  @override
  _TendanceScreenState createState() => _TendanceScreenState();
}

class _TendanceScreenState extends State<TendanceScreen> {
  String randomName = "";
  String randomUrl = "";

  void recupererCollectionBrands() {
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
              setState(() {
                randomName = data['name'];
                randomUrl = data['logo_url'];
              });

              print('Élément aléatoire : $randomName');
              // Récupérer la collection "clothes" associée au nom aléatoire
              CollectionReference clothesCollection = randomDoc.reference.collection('clothes');
              clothesCollection.get().then((QuerySnapshot clothesSnapshot) {
                // Traiter les documents de la collection "clothes" ici
                clothesSnapshot.docs.forEach((DocumentSnapshot clothesDoc) {
                  var clothesData = clothesDoc.data();
                  // Faire quelque chose avec les données des vêtements
                  print(clothesData);
                });
                }).catchError((e) {
                  print('Erreur lors de la récupération de la collection "clothes" : $e');
                });
            } else {
              print('Le document sélectionné est vide.');
            }
          } else {
            print('La collection "brands" est vide.');
          }
        })
        .catchError((e) {
          print('Erreur lors de la récupération de la collection "brands" : $e');
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterChat'),
        actions: [
          IconButton(onPressed: () {
            FirebaseAuth.instance.signOut();
          }, icon: Icon(
            Icons.exit_to_app, 
          color: Theme.of(context).colorScheme.primary,
          ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
          Text('Logged in!'),
          IconButton(onPressed: () {
            recupererCollectionBrands();
          }, icon: Icon(
            Icons.access_time_filled, 
          ),
          ),
          Text(randomName),
          Image.network(
            randomUrl,
            width: 200, // spécifiez la largeur souhaitée de l'image
            height: 200, // spécifiez la hauteur souhaitée de l'image
            fit: BoxFit.contain, // spécifiez comment l'image doit être ajustée dans son conteneur
          ),
          ]),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// void main() {
//   List<List<String>> dataList = [
//     ['https://www2.hm.com//fr_fr/productpage.1120814001.html', 'Chemise Regular Fit façon crochet avec col cubain', '39,99 €', 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F39%2F49%2F3949194c193543fb724f22ce694a5a8cc4587003.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D'],
//     ['https://www2.hm.com//fr_fr/productpage.1152892001.html', 'Polo Regular Fit en maille fine', '39,99 €', 'https:////lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F28%2Ff1%2F28f12f71666e26103a9e9aae3186ccd350ff69c1.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D'],
//     ['https://www2.hm.com//fr_fr/productpage.1123347003.html', 'Pantalon Relaxed Fit en lin mélangé', '34,99 €', 'https:////lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F54%2F8d%2F548d8e7547226cfd009b08827155d64f5fd58f36.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bmen_trousers_linentrousers%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D'],
//   ];

//   // Parcourir la liste dataList
//   for (int i = 0; i < dataList.length; i++) {
//     // Récupérer l'URL
//     String url = dataList[i][3];

//     // Remplacer 'https:////' par 'https://'
//     String newUrl = url.replaceFirst('https:////', 'https://');

//     // Mettre à jour l'URL dans la liste
//     dataList[i][3] = newUrl;
//   }

//   runApp( OnMe(dataList: dataList));

// }

// class OnMe extends StatefulWidget {
//   final List<List<String>> dataList;

//   const OnMe({Key? key, required this.dataList}) : super(key: key);

//   _OnMeState createState() => _OnMeState();
// }

// class _OnMeState extends State<OnMe> {
//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 255, 233, 206),
//         body: SafeArea(
//           child: Center(
//             child: FractionallySizedBox(
//               widthFactor: 1.0, // Prend toute la largeur de l'écran
//               heightFactor: 0.8, // Occupe 60% de la hauteur de l'écran
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 25.0), // Marge de 25 sur les côtés
//                 child: Column(
//                   children: <Widget> [
//                     Image.asset('image/HM.png', width: 100),
//                     Card(
//                     color: Colors.white, // Couleur de fond de la carte
//                     child: Padding(
//                       padding:
//                           EdgeInsets.all(16.0), // Marge intérieure de la carte
//                       child: Column(
//                         children: <Widget>[
//                           Image.network(
//                             widget.dataList[currentIndex][3],
//                             width: 200,
//                           ),
//                           Text(
//                             widget.dataList[currentIndex][1],
//                             style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold,
//                               ),
//                           ),
//                           Text(
//                             widget.dataList[currentIndex][2],
//                             style: TextStyle(
//                               fontSize: 15,
//                               ),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               Spacer(),
//                               TextButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     if (currentIndex > 0) {
//                                       currentIndex--;
//                                     }
//                                   });
//                                   print(widget.dataList[currentIndex][1]);
//                                   print("dislike");
//                                 },
//                                 child: Icon(
//                                   Icons.cancel,
//                                   color: Colors.red,
//                                   size: 80.0,
//                                 ),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.transparent,
//                                 ),
//                               ),
//                               Spacer(),
//                               TextButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     if (currentIndex < widget.dataList.length - 1) {
//                                       currentIndex++;
//                                     }
//                                   });
//                                   print(widget.dataList[currentIndex][1]);
//                                   print("like");
//                                 },
//                                 child: Icon(
//                                   Icons.favorite,
//                                   color: Colors.pink,
//                                   size: 80.0,
//                                 ),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.transparent,
//                                 ),
//                               ),
//                               Spacer(),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }