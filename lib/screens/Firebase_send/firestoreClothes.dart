
import 'package:cloud_firestore/cloud_firestore.dart';

//ajouterCollectionClothesFirestore('HM');
void ajouterCollectionClothesFirestore(String nomDocument) {
  List<List<String>> dataList = [
    ['https://www2.hm.com//fr_fr/productpage.1120814001.html', 'Chemise Regular Fit façon crochet avec col cubain', '39,99 €', 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F39%2F49%2F3949194c193543fb724f22ce694a5a8cc4587003.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D'],
    ['https://www2.hm.com//fr_fr/productpage.1152892001.html', 'Polo Regular Fit en maille fine', '39,99 €', 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F28%2Ff1%2F28f12f71666e26103a9e9aae3186ccd350ff69c1.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D'],
    ['https://www2.hm.com//fr_fr/productpage.1123347003.html', 'Pantalon Relaxed Fit en lin mélangé', '34,99 €', 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F54%2F8d%2F548d8e7547226cfd009b08827155d64f5fd58f36.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bmen_trousers_linentrousers%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D'],
  ];

  CollectionReference brandsCollection = FirebaseFirestore.instance.collection('brands');

  brandsCollection.where('name', isEqualTo: nomDocument).get().then((QuerySnapshot querySnapshot) {
    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot docSnapshot = querySnapshot.docs[0];
      String documentId = docSnapshot.id;

      CollectionReference clothesCollection = brandsCollection.doc(documentId).collection('clothes');

      dataList.forEach((data) {
        Map<String, dynamic> clothesData = {
          'buyClothesUrl': data[0],
          'nameClothes': data[1],
          'priceClothes': data[2],
          'imageClothesUrl': data[3],
        };

        clothesCollection.add(clothesData).then((DocumentReference docRef) {
          print('Élément ajouté avec succès : ${data[1]}, ID : ${docRef.id}');
        }).catchError((error) {
          print('Erreur lors de l\'ajout de l\'élément : $error');
        });
      });
    } else {
      print('Aucun document avec le nom "$nomDocument" trouvé.');
    }
  }).catchError((error) {
    print('Erreur lors de la récupération des documents : $error');
  });
}
