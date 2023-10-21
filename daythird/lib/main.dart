import 'package:daythird/infoperson.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INFORMATIONS PERSONNELS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: InteractivePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget{
@override
Widget build(BuildContext context) {
var size = MediaQuery.of(context).size;
return Scaffold(
  appBar: AppBar(
    title: const Text("INFORMATION PERSONNEL"),
    backgroundColor: Colors.blue,
  ),
  body: SizedBox(
    width: size.width,
    height: size.height,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children:[
        Padding(
        padding: const EdgeInsets.all(4),
        child: SizedBox (child:
        Image.asset('asset/image/login.jpg'),
        width: 150,
        height: 100,
        )               
        ),
        Container(
            padding:const EdgeInsets.only(left: 10),
            width: size.width,
            height: 50,
            child: const Text("Nom et Prénom", style:TextStyle(
              fontSize: 20,
            )),
        ),
        Container(
            padding:const EdgeInsets.only(left: 10),
            width: size.width,
            height: 50,
            child: const Text("Age, Sexe, Taille", style:TextStyle(
              fontSize: 20,
            )),
        ),
        Container(
            padding:const EdgeInsets.only(left: 10),
            width: size.width,
            height: 50,
            child: const Text("Liste des technologies",style:TextStyle(
              fontSize: 20,
            )),
        ),      
        Container(
            padding:const EdgeInsets.only(left: 10),
            width: size.width,
            height: 50,
            child: const Text("BMI",style:TextStyle(
              fontSize: 20,
            )),
        ),  
        Container(
            padding:const EdgeInsets.only(left: 10),
            width: size.width,
            height: 50,
            child: const Text("Loisir",style:TextStyle(
              fontSize: 20,
            )),
        ),         
      ],
    )
    ),

);
}
}