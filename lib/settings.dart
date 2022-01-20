import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( //GRADIENT
        height: double.infinity,
        width: double.infinity,

        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x6361FF00),
                  Color(0x9961FF00)
                ]
            )
        ),
       child: Column(
         children: <Widget>[

           Row(
               children: <Widget>[

                 Container( // BACK BUTTON
                     margin: const EdgeInsets.only(left: 20, top: 20),
                     width: 80,
                     height: 50,
                     decoration: const BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                         color: Colors.white
                     ),
                     child: TextButton(
                         onPressed: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => const MyHomePage()),
                           );
                         },
                         child: const Text(
                           "< Back",
                           style: TextStyle(
                             fontSize: 16,
                             color: Colors.black,
                           ),
                         )
                     )
                 ),

               ]
           ),

           Container( // PROMPT
               margin: const EdgeInsets.only(left: 50, right: 50, top: 20),
               width: double.infinity,
               height: 200,
               decoration: const BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(10)),
                   color: Color(0xFFE5E5E5)
               ),
               child: Column(
                 children: <Widget>[

                   Container(
                       margin: const EdgeInsets.all(20),
                       child: const Text(
                         "Enter a tax rate",
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           fontSize: 36,
                           color: Colors.black,
                         ),
                       )
                   ),

                   Container( // TEXT FIELD
                       margin: const EdgeInsets.all(20),
                       color: Colors.white,
                       child: TextField(
                         keyboardType: TextInputType.number,
                         onSubmitted: (String text) {
                           SharedPreferences.getInstance().then((pref) {
                             pref.setDouble("tax", double.parse(text));
                           });

                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => const MyHomePage()),
                           );
                         },
                         decoration: const InputDecoration(
                           border: OutlineInputBorder(),
                         ),
                       )
                   )

                 ],
               )
           ),
           
         ],
       )
      )
    );
  }
}
