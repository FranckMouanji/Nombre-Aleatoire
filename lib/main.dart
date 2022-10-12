import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Main(),
  ));
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {

  Color pairColor = const Color.fromRGBO(247, 247, 247, 1);
  Color pairColorText = Colors.black;
  Color pairColorShadow = const Color.fromRGBO(247, 247, 247, 1);
  Color pairColorsBackground = Colors.white;

  Random random = Random();

  int tailleMax = 4;
  List<int> vieuxChoix = [];

  late TextEditingController firstNumberContrlleur;
  late TextEditingController secondNumberContrlleur;

  dynamic choice = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNumberContrlleur = TextEditingController();
    secondNumberContrlleur = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstNumberContrlleur.dispose();
    secondNumberContrlleur.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: pairColorsBackground,
      appBar: AppBar(
        backgroundColor: pairColorsBackground,
        elevation: 0,
        shadowColor: pairColorsBackground,
        title: Center(
          child: Text(
            "",
            style: TextStyle(
              color: pairColorText,
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Container(
                margin: const EdgeInsets.fromLTRB(30, 35, 30, 60),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: pairColor,
                      spreadRadius: 7,
                      blurRadius: 16,

                    )
                  ],
                  color: pairColor,
                ),
                child: const Image(
                  height: 200,
                  image: AssetImage(
                    "images/background.jpeg",
                  ),
                )
            ),


            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Text(
                    choice.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: pairColorText
                  ),
                )
            ),


            Container(
              height: (size.height * 0.07),
              margin: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: pairColorShadow,
                    spreadRadius: 7,
                    blurRadius: 16,

                  )
                ],
                color: pairColorsBackground,
              ),
              child: TextField(

                controller: firstNumberContrlleur,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Entrez la premiere valeur",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: pairColorText,
                    )
                ),
              ),
            ),


            Container(
              height: (size.height * 0.07),
              margin: const EdgeInsets.fromLTRB(30, 35, 30, 0),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: pairColor,
                    spreadRadius: 7,
                    blurRadius: 16,

                  )
                ],
                color: pairColorsBackground,
              ),
              child: TextField(
                controller: secondNumberContrlleur,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Entrez la deuxieme valeur",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: pairColorText,
                    )
                ),
              ),
            ),


            Container(
              height: (size.height * 0.07),
              margin: const EdgeInsets.fromLTRB(30, 35, 30, 0),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(1, 31, 57, 1),
              ),
              child: MaterialButton(
                onPressed: (){
                  setState(() {
                    int aleatoire = nombreAletoire(int.parse(firstNumberContrlleur.text.toString()),  int.parse(secondNumberContrlleur.text.toString()));
                    while(vieuxChoix.contains(aleatoire)){
                      aleatoire = nombreAletoire(int.parse(firstNumberContrlleur.text.toString()),  int.parse(secondNumberContrlleur.text.toString()));
                    }

                    if(vieuxChoix.length == tailleMax) {
                      vieuxChoix.removeAt(0);
                    }

                    vieuxChoix.add(aleatoire);
                    choice = aleatoire;

                  });
                },
                child: Text(
                    "Lancer",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: pairColor,
                    )
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  int nombreAletoire(int minimum, int maximum){
    return random.nextInt(maximum) + minimum;
  }
}
