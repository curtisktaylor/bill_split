import 'package:bill_split/person_select.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "new_billsplit_main.dart";

class AddNewPerson extends StatefulWidget {
  const AddNewPerson({Key? key}) : super(key: key);

  @override
  _AddNewPersonState createState() => _AddNewPersonState();
}

class _AddNewPersonState extends State<AddNewPerson> {

  List<String>? prefPeople;

  /*Future<void> addName(String text) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    getNames();

    prefPeople!.add(text);
    if(prefPeople == null){
      prefPeople = [text];
    }
    await pref.setStringList("people", prefPeople!);
    getNames();
    print("eeee");
  }

  void getNames() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    prefPeople = await pref.getStringList("people");
    print(prefPeople.toString());
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

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
                              MaterialPageRoute(builder: (context) => const NewBillsplitMain()),
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
                          "Enter a name",
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
                        onSubmitted: (String text) {
                          var list;
                          SharedPreferences.getInstance().then((pref) {
                            list = pref.getStringList("people");

                            if(list != null){
                              list.add(text);
                              pref.setStringList("people", list);
                            } else{
                              pref.setStringList("people", [text]);
                            }

                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const NewBillsplitMain()),
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
