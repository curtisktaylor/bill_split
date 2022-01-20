import 'package:bill_split/person_select.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import "main.dart";
import "add_new_person.dart";
import "person_select.dart";
import "order_entry.dart";

class NewBillsplitMain extends StatefulWidget {
  const NewBillsplitMain({Key? key}) : super(key: key);

  @override
  _NewBillsplitMainState createState() => _NewBillsplitMainState();
}

class _NewBillsplitMainState extends State<NewBillsplitMain> {

  _NewBillsplitMainState(){
    SharedPreferences.getInstance().then((pref) {
      var list = pref.getStringList("people");

      if(list != null){
        for(int i = 0; i < list.length; i++){
          names.add(PersonSelect(list[i], Colors.white));
        }
      }

    });
  }

  Color nextButtonColor = Colors.white;

  List<PersonSelect> names = <PersonSelect>[PersonSelect("Barry", Colors.white), PersonSelect("Ben", Colors.white), PersonSelect("Joe", Colors.white)];
  //List<PersonSelect> names = [];
  List<PersonSelect> selectedNames = <PersonSelect>[];

  void getData(){
    SharedPreferences.getInstance().then((pref) {
      var list = pref.getStringList("people");

      if(list != null){
        for(int i = 0; i < list.length; i++){
          names.add(PersonSelect(list[i], Colors.white));
        }
      } else{
        print("THE LIST IS NULL!");
      }
    });
  }

  /*void getNames() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    prefPeople = pref.getStringList("people");
  }*/

  void toggleName(PersonSelect person){
    setState(() {
      if(person.color.value == Colors.white.value){
        person.color = const Color(0xFFAAEAD0);
        selectedNames.add(person);
      } else{
        person.color = Colors.white;
        selectedNames.remove(person);
      }

      if(selectedNames.isNotEmpty){
        nextButtonColor = const Color(0xFFFFB341);
      } else{
        nextButtonColor = Colors.white;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container( // GRADIENT

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
                  height: 130,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text(
                      "Select who will be dining",
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.black,
                      ),
                    )
                  )
                ),

                Expanded( // PERSON SELECTION
                    child: Container(
                      margin: const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
                      color: Colors.lightGreen,
                      child: ListView.builder(
                          itemCount: names.length,
                          itemBuilder: (BuildContext context, int i){
                            return Container(
                                margin: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
                                width: double.infinity,
                                height: 50,

                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    color: names[i].color
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      toggleName(names[i]);
                                    },
                                    child: Text(
                                      names[i].name,
                                      style: const TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                      ),
                                    )
                                )
                            );
                          }
                      )
                    )
                ),

                Container( // ADD NEW PERSON BUTTON
                    margin: const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
                    width: double.infinity,
                    height: 50,

                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AddNewPerson()),
                          );
                        },
                        child: const Text(
                          "+ New Person",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        )
                    )
                ),

                Container( // NEXT BUTTON
                    margin: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
                    width: double.infinity,
                    height: 50,

                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: nextButtonColor
                    ),
                    child: TextButton(
                        onPressed: () {
                          if(selectedNames.isNotEmpty){//make sure at least one person is selected before navigating
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OrderEntry(people: selectedNames, current: 0)),
                            );
                          }
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        )
                    )
                )


              ],
            )
        )

    );
  }
}
