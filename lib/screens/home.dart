import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();

  int radioValue = 0;
  bool switchValue = false;
  double _finalResult = 0.0;
  String _planetName = "";

  void handleRadioValueChanged(int value) {
    /*
    Source: https://www.livescience.com/33356-weight-on-planets-mars-moon.html
      Mercury: 0.38
      Venus: 0.91
      Earth: 1.00
      Mars: 0.38
      Jupiter: 2.34
      Saturn: 1.06
      Uranus: 0.92
      Neptune: 1.19
      Pluto: 0.06
     */
    if (_weightController.text.contains(new RegExp(r'[0-9]'))) {
      setState(() {
        radioValue = value;
        switch (radioValue) {
          case 0:
            _finalResult = calculateWeight(_weightController.text, 0.06);
            _planetName = (_finalResult > 0)
                ? "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)} Kg"
                : "Eveything in this Universe has some mass";
            break;
          case 1:
            _finalResult = calculateWeight(_weightController.text, 0.38);
            _planetName = (_finalResult > 0)
                ? "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)} Kg"
                : "Eveything in this Universe has some mass";
            break;
          case 2:
            _finalResult = calculateWeight(_weightController.text, 0.91);
            _planetName = (_finalResult > 0)
                ? "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)} Kg"
                : "Eveything in this Universe has some mass";
            break;
          default:
            print("Nothing selected!");
        }
         //  print("Value is ${radioValue.toString()}");
      });
    }else{
      setState(() {
        _planetName = "Don\'t you Mess with Me";
        radioValue = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Your Weight on Earth',
                      hintText: 'In Kg',
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),

                  new Padding(padding: new EdgeInsets.all(5.0)),
                  //three toggle buttons
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //radiobuttons go here
                      new Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Pluto",
                        style: new TextStyle(color: Colors.black),
                      ),
                      new Radio<int>(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Mars",
                        style: new TextStyle(color: Colors.black),
                      ),
                      new Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Venus",
                        style: new TextStyle(color: Colors.black),
                      ),
                    ],
                  ),

                  //Result text
                  new Padding(padding: new EdgeInsets.all(15.0)),

                  new Text(
                    _weightController.text.isEmpty
                        ? "Please enter weight"
                        : _planetName,
                    style: new TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (weight.isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      print("Wrong!");
      return -11 * 0.38; // give a default weight! Be creative!
    }
  }
}
