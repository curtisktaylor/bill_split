import 'package:bill_split/person_select.dart';
import 'package:flutter/material.dart';
import "main.dart";

class OrderTotals extends StatefulWidget {
  final List<PersonSelect> people;

  const OrderTotals({Key? key, required this.people}) : super(key: key);

  @override
  _OrderTotalsState createState() => _OrderTotalsState(people);
}

class _OrderTotalsState extends State<OrderTotals> {
  List<PersonSelect> people;

  _OrderTotalsState(this.people);

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

            Container( // ALL DONE PROMPT
                margin: const EdgeInsets.only(left: 50, right: 50, top: 50),
                width: double.infinity,
                height: 80,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white
                ),
                child: Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text(
                      "All Done!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.black,
                      ),
                    )
                )
            ),

            Expanded(// ORDER TOTALS
              child: Container(
                margin: const EdgeInsets.only(left: 50, right: 50, top: 50),
                width: double.infinity,
                color: Colors.lightGreen,

                child: ListView.builder(
                    itemCount: people.length,
                    itemBuilder: (BuildContext context, int i){
                      return Container(
                        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        width: double.infinity,
                        height: 60,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white
                          ),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[

                              Expanded(
                                child: Text(
                                  people[i].name,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ),

                              Text(
                                "\$${people[i].total}",
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              )

                            ],
                          ),
                        )
                      );
                    }

                ),

                ),
              ),

            Container( // NEXT BUTTON
                margin: const EdgeInsets.only(left: 50, right: 50, bottom: 20, top: 50),
                width: double.infinity,
                height: 50,

                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFFFFB341)
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyHomePage()),
                      );
                    },
                    child: const Text(
                      "Home Page",
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
