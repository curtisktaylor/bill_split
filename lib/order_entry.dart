import 'package:bill_split/order_totals.dart';
import 'package:bill_split/person_select.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';


class OrderEntry extends StatefulWidget {
  final List<PersonSelect> people;
  final int current;

  const OrderEntry({Key? key, required this.people, required this.current}) : super(key: key);

  @override
  _OrderEntryState createState() => _OrderEntryState(people, current);
}

class _OrderEntryState extends State<OrderEntry> {
  String currentText = "";
  int current = 0;
  List<PersonSelect> people;
  List<double> items = [];

  _OrderEntryState(this.people, this.current);

  String currentPerson(){
    return people[current].name;
  }

  void addItem(String item){
    setState(() {
      if(item.isEmpty){
        return;
      }
      items.add(double.parse(item));
    });
  }

  void removeItem(int i){
    setState(() {
      items.removeAt(i);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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

            Container( // UPPER PROMPT
                margin: const EdgeInsets.only(left: 50, right: 50, top: 50),
                width: double.infinity,
                height: 90,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    color: Color(0xFFD2D2D2)
                ),
                child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Text(
                      "${currentPerson()}'s Order",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 36,
                        color: Colors.black,
                      ),
                    )
                )
            ),

            Container( // LOWER PROMPT
                margin: const EdgeInsets.only(left: 50, right: 50),
                width: double.infinity,
                height: 130,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                    color: Color(0xFFE5E5E5)
                ),
                child: Container(
                    margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: const Text(
                      "Enter the price of each item",
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.black,
                      ),
                    )
                )
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container( // ADD NEW ITEM BUTTON
                    margin: const EdgeInsets.only(right: 10, top: 30),
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xFF54FF38)
                    ),
                    child: TextButton(
                        onPressed: () {
                          addItem(currentText);
                        },
                        child: const Text(
                          "+",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        )
                    )
                ),

                Container(
                  margin: const EdgeInsets.only(top: 30),
                    width: 170,
                    height: 50,
                    color: Colors.white,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (String text){
                        currentText = text;
                      },

                    )
                )

              ],
            ),

            Expanded( // ITEM LIST
                child: Container(
                    margin: const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
                    color: Colors.lightGreen,
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int i){
                          return Container(
                              margin: const EdgeInsets.only(left: 50, right: 50),
                              width: double.infinity,
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  Container( // REMOVE ITEM BUTTON
                                      margin: const EdgeInsets.only(right: 10),
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          color: Color(0xFFFF6868)
                                      ),
                                      child: TextButton(
                                          onPressed: () {
                                            removeItem(i);
                                          },
                                          child: const Text(
                                            "-",
                                            style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.black,
                                            ),
                                          )
                                      )
                                  ),

                                  Container(
                                      margin: const EdgeInsets.only(),
                                      width: 100,
                                      height: 50,
                                      color: Colors.white,
                                      child: Text(
                                        "${items[i]}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 36,
                                          color: Colors.black,
                                        ),
                                      )
                                  )

                                ],
                              )
                          );
                        }
                    )
                )
            ),

            Container( // NEXT BUTTON
                margin: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
                width: double.infinity,
                height: 50,

                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFFFFB341)
                ),
                child: TextButton(
                    onPressed: () {
                      double? tax = 0;

                      SharedPreferences.getInstance().then((pref) {
                        tax = pref.getDouble("tax");
                        for(int i = 0; i < items.length; i++){
                          people[current].total += items[i];
                        }

                        people[current].total += (people[current].total * (tax! / 100));

                        if(people.length - 1 > current){
                          current++;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OrderEntry(people: people, current: current)),
                          );
                        } else{
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OrderTotals(people: people)),
                          );
                        }
                      });


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
