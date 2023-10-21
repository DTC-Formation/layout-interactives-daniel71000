import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class InteractivePage extends StatefulWidget {
  const InteractivePage({super.key});

  @override
  State<InteractivePage> createState() => _InteractivePageState();
}

class _InteractivePageState extends State<InteractivePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //String sexGroup="M";
  String? gender;
  int _value = 6;
  String? svalue;
  bool valuefirst = false;
  bool valuesecond = false;
  DateTime _selectedDate = DateTime.now();
  String? path;
  //String? imageAppSource;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PAGE PERSONNEL"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
      // ***************************TEXTFIELD ***********************************
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Votre nom',
                  label: Text("NOM"),
                  labelStyle: TextStyle(fontSize: 20),
                ),
                //maxLength: 10,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'votre prenom',
                    label: Text("PRENOM"),
                    labelStyle: TextStyle(fontSize: 20),
                  )),
            ),
      // *******************************RADIO*************************************
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Row(children: [
                const Text(
                  "Male",
                  style: TextStyle(fontSize: 20),
                ),
                Radio(
                  //title: const Text("Male"),
                  value: "male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                const Text(
                  "Female",
                  style: TextStyle(fontSize: 20),
                ),
                Radio(
                  // title: const Text("Female"),
                  value: "female",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                const Text(
                  "Other",
                  style: TextStyle(fontSize: 20),
                ),
                Radio(
                  //title: const Text("Other"),
                  value: "other",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                )
              ]),
            ),
      //*********************************SLIDER******************************
            Row(children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Taille",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: Slider(
                    value: _value.toDouble(),
                    min: 1.0,
                    max: 200.0,
                    divisions: 10,
                    activeColor: Colors.green,
                    inactiveColor: Colors.orange,
                    label: svalue, //'Set taille value',
                    onChanged: (double newValue) {
                      setState(() {
                        _value = newValue.round();
                        svalue = _value.toString();
                      });
                    }),
              ),
            ]),
      //***************************CHECKBOX************************** */
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Technologie: ',
                  style: TextStyle(fontSize: 17.0),
                ),
                Checkbox(
                  checkColor: Colors.greenAccent,
                  activeColor: Colors.red,
                  value: valuefirst,
                  onChanged: (bool? newValue) {
                    setState(() {
                      valuefirst = newValue!;
                    });
                  },
                ),
                Checkbox(
                  checkColor: Colors.greenAccent,
                  activeColor: Colors.red,
                  value: valuesecond,
                  onChanged: (bool? newValue) {
                    setState(() {
                      valuesecond = newValue!;
                    });
                  },
                ),
              ],
            ),
      
      //********************************DATE PICHER */
      
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Date naissance: '),
                ),
                // Bouton pour ouvrir le sélecteur de date
                ElevatedButton(
                  onPressed: () {
                    // Appel de la méthode showDatePicker() pour afficher le sélecteur de date
                    _selectDate();
                  },
                  child: Text(
                    DateFormat("dd/MM/yyyy").format(_selectedDate),
                  ),
                ),
              ],
            ),
      
          Padding(
          padding: const EdgeInsets.all(4),
          child: SizedBox (width: 150,
          height: 100,child:
          //imageAppSource=captureImage(),
          path==null?Image.network("https://static.vecteezy.com/ti/photos-gratuite/t2/2098203-chat-tigre-argente-assis-sur-fond-vert-gratuit-photo.jpg"):Image.file(File(path!))),
          ) 
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.photo_camera),
        onPressed: () {
          captureImage();
          //print(path);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _selectDate() async {
    // Date sélectionnée par l'utilisateur
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    // Mise à jour de la date sélectionnée
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<XFile?> pickImage() async {
    final picker = ImagePicker();
    return await picker.pickImage(source: ImageSource.gallery);
  }

  captureImage() async {
    final pickedFile = await pickImage();
    if (pickedFile != null) {
      setState(() {
        path = pickedFile.path;
      });
      
    }
  }
}
