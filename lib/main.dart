import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reto 1',
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
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Aplicaciones Movil - Reto 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final textorigin = TextEditingController();
final textdestino = TextEditingController();

class calculadora {
  final titulo;
  final icono;
  final color;

  calculadora(this.titulo, this.icono, this.color);
}

String op1 = "USD";
String op2 = "COP";

List<String> item2 = <String>["USD", "EUR", "COP"];

List<DropdownMenuItem<String>> item3 = <DropdownMenuItem<String>>[
  DropdownMenuItem(
    child: Text("USD"),
    value: "USD",
  ),
  DropdownMenuItem(
    child: Text("EUR"),
    value: "EUR",
  ),
  DropdownMenuItem(
    child: Text("COP"),
    value: "COP",
  ),
];

List<calculadora> cal = <calculadora>[
  calculadora("9", Icon(Icons.abc), Color.fromARGB(255, 171, 248, 240)),
  calculadora("8", Icon(Icons.abc), Color.fromARGB(255, 171, 248, 240)),
  calculadora("7", Icon(Icons.abc), Color.fromARGB(255, 171, 248, 240)),
  calculadora("6", Icon(Icons.abc), Color.fromARGB(255, 171, 248, 240)),
  calculadora("5", Icon(Icons.abc), Color.fromARGB(255, 171, 248, 240)),
  calculadora("4", Icon(Icons.abc), Color.fromARGB(255, 171, 248, 240)),
  calculadora("3", Icon(Icons.abc), Color.fromARGB(255, 171, 248, 240)),
  calculadora("2", Icon(Icons.abc), Color.fromARGB(255, 171, 248, 240)),
  calculadora("1", Icon(Icons.abc), Color.fromARGB(255, 171, 248, 240)),
  calculadora("0", Icon(Icons.abc), Color.fromARGB(255, 171, 248, 240)),
  calculadora("Limpiar", Icon(Icons.cleaning_services),
      Color.fromARGB(255, 171, 248, 240)),
  calculadora(
      "Calcular", Icon(Icons.calculate), Color.fromARGB(255, 171, 248, 240)),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(children: [
                Text("origin"),
                DropdownButton(
                    value: op1,
                    items: item3,
                    onChanged: (String? x) {
                      setState(() {
                        op1 = x.toString();
                      });
                    }),
                Text("Destino"),
                DropdownButton(
                    value: op2,
                    items: item3,
                    onChanged: (String? x) {
                      setState(() {
                        op2 = x.toString();
                      });
                    }),
              ]),
              TextField(
                controller: textorigin,
                decoration: InputDecoration(labelText: "Origen", hintText: "0"),
              ),
              TextField(
                controller: textdestino,
                decoration:
                    InputDecoration(labelText: "Destino", hintText: "0"),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: cal.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        color: cal[index].color,
                        child: ListTile(
                          title: Center(
                            child: index > 9
                                ? cal[index].icono
                                : Text(
                                    cal[index].titulo,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                          onTap: () {
                            print(cal[index].titulo);

                            if (index < 10) {
                              textorigen.text =
                                  textorinen.text + cal[index].titulo;
                            } else if (index == 10) {
                              textorigen.text = "";
                              textdestino.text = "";
                            } else {
                              if (op1 == "USD" && op2 == "COP") {
                                textdestino.text =
                                    (double.parse(textorigin.text) * 5000)
                                        .toString();
                              } else if (op1 == "COP" && op2 == "USD") {
                                textdestino.text =
                                    (double.parse(textorigin.text) / 5000)
                                        .toString();
                            } (op1 == "EUR" && op2 == "COP") {
                                textdestino.text =
                                    (double.parse(textorigin.text) * 5050)
                                        .toString();}
                          } 
                        ));
                  },
                ),
              )
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
