import 'package:bill_split/settings.dart';
import 'package:flutter/material.dart';
import "history_main.dart";
import "new_billsplit_main.dart";
import "person_select.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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

            Container( //TITLE
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 100, left: 50, right: 50),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: const Center(
                    child: Text(
                      "BillSplit",
                      style: TextStyle(
                        fontSize: 67,
                        color: Colors.black
                      ),
                    )
                )
            ),

            Container( // NEW BILLSPLIT BUTTON
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 50, left: 50, right: 50),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewBillsplitMain()),
                    );
                  },
                  child: const Text(
                    "New BillSplit",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  )
              ),
            ),

            Container( // SETTINGS BUTTON
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 30, left: 50, right: 50),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  },
                  child: const Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  )
              ),
            ),

          ],
        )


      ),
    );
  }
}
