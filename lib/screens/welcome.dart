import 'package:flutter/material.dart';
import 'package:on_me/screens/authScreen/auth.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

    // Méthode pour afficher l'écran d'inscription
  void navigateToRegisterScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthScreen()),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFFF8E8E),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 200,
                child: Image.asset('image/logo/2.png'),
              ),
              Text(
                "Bienvenue sur On me",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 100),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40), // Ajoutez ici la valeur de marge souhaitée
                  child: TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Continuer avec Google",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFEFEBCB),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40), // Ajoutez ici la valeur de marge souhaitée
                  child: TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Continuer avec Apple",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFEFEBCB),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40), // Ajoutez ici la valeur de marge souhaitée
                  child: TextButton(
                    onPressed: () {
                      navigateToRegisterScreen(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Créer un compte",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFEFEBCB),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Connexion",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}