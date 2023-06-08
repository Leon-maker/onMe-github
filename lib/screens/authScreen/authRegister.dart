import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  // Définir les variables de couleur
  static const Color primaryColor = Color(0xFFFF8E8E);
  static const Color secondaryColor = Color(0xFFEFEBCB);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 30), // Ajoutez ici la valeur de marge souhaitée
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Naviguer vers l'écran précédent
                    },
                    icon: CircleAvatar(
                      backgroundColor: secondaryColor,
                      child: Icon(
                        Icons.arrow_back,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 200,
                child: Image.asset('image/logo/2.png'),
              ),
            ],
          )
        ),
      ),
    );
  }
}