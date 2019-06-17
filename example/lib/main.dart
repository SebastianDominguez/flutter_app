import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/constans.dart';
import 'package:flutter_local_notifications/src/widgets/local_notification_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blue, accentColor: Colors.blueAccent),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyanAccent[700],
          leading: FlutterLogo(),
          title: Text('HeartTutor', style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],

        ),
        body: Container(
            color: Colors.white,
            child: Column(children: [
              Column(children: [
                Text(
                    'Bienvenido a HeartTutor',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 2,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan)),
                Image.asset('assets/heartbeats.png'),
              ]),
              Column(children: [
                Text(
                    'Si deseas registrar tu consumo de cigarros diario, presione el siguente botón:',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 1.5,
                    style: TextStyle(fontWeight: FontWeight.w400)
                )
              ]),
              Column(children: <Widget>[
                const SizedBox(height: 25),
                RaisedButton(
                  child: const Text('Cigarros',textScaleFactor: 1.25,style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black)),
                  color: Theme.of(context).accentColor,
                  elevation: 4.0,
                  splashColor: Colors.blueGrey,

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuVicios()),
                    );
                  },
                ),
              ]),
              Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center, children: [
                Column(children: [
                  Text(
                    '\n Si deseas registrar tu consumo de alcohol, entonces presiona el siguente botón: ',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 1.5,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  )
                ]),
                Column(children: <Widget>[
                  const SizedBox(height: 25),
                  RaisedButton(
                    child: const Text('Alcohol',textScaleFactor: 1.25,style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black)),
                    color: Theme.of(context).accentColor,
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuVicios2()),
                      );
                    },
                  ),
                ]),
              ])
            ])));
  }
  void choiceAction(String choice) {
    if (choice == Constants.Settings) {

      noLoSe();
    } else if (choice == Constants.Subscribe) {
      print('Subscribe');
    } else if (choice == Constants.SignOut) {
      print('SignOut');
    }
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notificaciones"),
      ),
      body: Center(
        child: HomePage(),
      ),
    );
  }
}

class MenuVicios extends StatefulWidget {
  MenuVicios({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MenuCigarrillo createState() => MenuCigarrillo();
}

class MenuVicios2 extends StatefulWidget {
  MenuVicios2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MenuAlcohol createState() => MenuAlcohol();
}

class MenuAlcohol extends State<MenuVicios2> {
  void positivo() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Vino()),
    );
  }

  void negativo() {
    print("Usuario no fumo");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            ),
            title: Text('Alcohol'),
            backgroundColor: Colors.pink[900]
        ),
        body: Container(
            color: Colors.white,
            child: Column(children: [
              Column(children: [
                Text(
                  'Seleccione a continuación el tipo de bebida que tomó.\n',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  textScaleFactor: 2.2,
                  style: TextStyle(fontWeight: FontWeight.w400),
                )
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(children: [
                  IconButton(
                    iconSize: 120,

                    icon: Image.asset('assets/wine.png'),
                    highlightColor: Colors.blueGrey,
                    padding: EdgeInsets.all(15),
                    onPressed: positivo,
                  ),
                  Text(
                    'Vino',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 1.8,
                    style: TextStyle(fontWeight: FontWeight.normal),
                  )
                ]),
                Column(children: [
                  IconButton(
                    iconSize: 120,
                    icon: Image.asset('assets/beer.png'),
                    padding: EdgeInsets.all(15),
                    onPressed: positivo,
                  ),
                  Text(
                    'Cerveza',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 1.8,
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ]),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(children: [
                  IconButton(
                    iconSize: 120,
                    icon: Image.asset('assets/whisky.png'),
                    padding: EdgeInsets.all(15),
                    onPressed: positivo,
                  ),
                  Text(
                    'Whisky',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 1.8,
                    style: TextStyle(fontWeight: FontWeight.normal),
                  )
                ]),
                Column(children: [
                  IconButton(
                    padding: EdgeInsets.all(0.0),
                    color: Colors.red,
                    icon: Icon(Icons.close),
                    highlightColor: Colors.white,
                    onPressed: (negativo),
                    alignment: Alignment.centerRight,
                    iconSize: 155,
                  ),
                  Text(
                    'Ninguna',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 1.8,
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ]),


              ]),
              Column(children:[
                Text('\nSi no consumió ninguna presione la X.',textScaleFactor: 2.2,overflow: TextOverflow.clip,textAlign: TextAlign.center)
              ])
            ])));
  }


}

class Vino extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SiTomoVino();
  }

}
DateTime date = DateTime.now();

class SiTomoVino extends State<Vino> {
  var _cantidades = ['1', '2', '3', '4', '5', '6', '>7'];
  var _currentItemSelected = '1';

  Future _guardar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String counter = _currentItemSelected;
    print('Seleccionado:  $counter.');
    await prefs.setString('counter', counter);
  }


  Future _leer() async {
    final prefs = await SharedPreferences.getInstance();
    final key = _currentItemSelected;
    final value = prefs.getString(key) ?? 0;
    print('read: $value');
  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Vino"),
          backgroundColor: Colors.pink[900],
        ),
        body: Container(
            child: Column(children: [
              Column(children: [
                Text(
                  'Indique a continuación el número de copas que bebió:\n',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  textScaleFactor: 2.3,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                DropdownButton<String>(
                  iconSize: 50,
                  items: _cantidades.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem, textScaleFactor: 1.7),
                    );
                  }).toList(),
                  onChanged: (String newValueSelected) {

                    setState(() {
                      this._currentItemSelected = newValueSelected;
                    });
                  },
                  value: _currentItemSelected,
                ),
              ]),
              Column(children: [
                RaisedButton(
                  child: const Text('Registrar',textScaleFactor: 1.8,style: TextStyle(fontWeight: FontWeight.w400)),
                  color: Theme.of(context).accentColor,
                  elevation: 4.0,
                  splashColor: Colors.blueGrey,
                  onPressed: (){
                    _guardar();
                  },
                ),
              ]),
              Column(children: [
                RaisedButton(
                  child: const Text('Ver registro',textScaleFactor: 1.8,style: TextStyle(fontWeight: FontWeight.w400)),
                  color: Theme.of(context).accentColor,
                  elevation: 4.0,

                  splashColor: Colors.blueGrey,
                  onPressed: (){
                    _leer();
                  },
                ),
              ]),
            ])));
  }
}

class MenuCigarrillo extends State<MenuVicios> {
  void positivo() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Cigarrillos()),
    );
  }

  void negativo() {
    print("Usuario no fumo");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
          title: Text('Cigarros'),
          backgroundColor: Colors.blueGrey[900],

        ),
        body: Container(
            color: Colors.white,
            child: Column(children: [
              Column(children: [
                Image.asset('assets/cigarette.png'),
                Text(
                  '¿Ha consumido tabaco en las últimas 24 horas?',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  textScaleFactor: 2.5,
                  style: TextStyle(fontWeight: FontWeight.w400),
                )
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(children: [
                  IconButton(
                    color: Colors.green,
                    icon: Icon(Icons.check),
                    splashColor: Colors.white12,
                    highlightColor: Colors.white,
                    alignment: Alignment.centerLeft,
                    onPressed: positivo,
                    iconSize: 130,
                  ),
                  Text(
                    'Si',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 2.5,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  )
                ]),
                Column(children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    color: Colors.red,
                    splashColor: Colors.white12,
                    highlightColor: Colors.white,
                    onPressed: negativo,
                    alignment: Alignment.centerRight,
                    iconSize: 130,
                  ),
                  Text(
                    'No',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 2.5,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ]),
              ]),
            ])));
  }

  void choiceAction(String choice) {
    if (choice == Constants.Settings) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondRoute()),
      );
    } else if (choice == Constants.Subscribe) {
      print('Subscribe');
    } else if (choice == Constants.SignOut) {
      print('SignOut');
    }
  }
}

class Cigarrillos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SiFumo();
  }
}

class SiFumo extends State<Cigarrillos> {
  var _cantidades = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '>10'];
  var _currentItemSelected = '1';
  Future _guardar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String counter = _currentItemSelected;
    print('Seleccionado: $counter.');
    await prefs.setString('counter', counter);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registro de consumo de cigarros"),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Container(
            child: Column(children: [
              Column(children: [
                Text(
                  'Indique a continuación el número de cigarros que consumió:',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  textScaleFactor: 2.7,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                DropdownButton<String>(
                  iconSize: 60,
                  items: _cantidades.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem, textScaleFactor: 2),
                    );
                  }).toList(),
                  onChanged: (String newValueSelected) {
                    setState(() {
                      this._currentItemSelected = newValueSelected;
                    });
                  },
                  value: _currentItemSelected,
                ),

              ]),
              Column(children: [
                RaisedButton(
                  child: const Text('Registrar',textScaleFactor: 2,style: TextStyle(fontWeight: FontWeight.w400)),
                  color: Theme.of(context).accentColor,
                  elevation: 4.0,

                  splashColor: Colors.blueGrey,
                  onPressed: (){
                    _guardar();
                  },
                ),
              ]),
              Column(children: [
                RaisedButton(
                  child: const Text('Ver registro',textScaleFactor: 2,style: TextStyle(fontWeight: FontWeight.w400)),
                  color: Theme.of(context).accentColor,
                  elevation: 4.0,

                  splashColor: Colors.blueGrey,
                  onPressed: (){
                    _guardar();
                  },
                ),
              ]),
            ])));
  }
}

class Day {
  static const Sunday = const Day(1);
  static const Monday = const Day(2);
  static const Tuesday = const Day(3);
  static const Wednesday = const Day(4);
  static const Thursday = const Day(5);
  static const Friday = const Day(6);
  static const Saturday = const Day(7);

  static get values =>
      [Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday];

  final int value;

  const Day(this.value);
}

/// Used for specifying a time in 24 hour format
class Time {
  /// The hour component of the time. Accepted range is 0 to 23 inclusive
  final int hour;

  /// The minutes component of the time. Accepted range is 0 to 59 inclusive
  final int minute;

  /// The seconds component of the time. Accepted range is 0 to 59 inclusive
  final int second;

  Time([this.hour = 0, this.minute = 0, this.second = 0]) {
    assert(this.hour >= 0 && this.hour < 24);
    assert(this.minute >= 0 && this.minute < 60);
    assert(this.second >= 0 && this.second < 60);
  }

  Map<String, int> toMap() {
    return <String, int>{
      'hour': hour,
      'minute': minute,
      'second': second,
    };
  }


}



