//stful
import "package:flutter/material.dart";
import "main.dart";

class HistoryMain extends StatefulWidget {
  const HistoryMain({Key? key}) : super(key: key);

  @override
  _HistoryMainState createState() => _HistoryMainState();
}

class _HistoryMainState extends State<HistoryMain> {
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
            )

          ],
        )
      )
    );
  }
}

