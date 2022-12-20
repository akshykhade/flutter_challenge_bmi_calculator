import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());
const kPink = Color(0xffea1556);
const kInactive = Color(0x601d1f33);
const kAccent = Color(0xff232634);

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff0a0e21),
        primaryColor: Color(0xff0a0e21),
      ),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int _height = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xff0a0e21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.male,
                        size: 50,
                      ),
                      Text('Male')
                    ],
                  )),
                ),
                Expanded(
                  child: CustomCard(
                      isActive: false,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            size: 50,
                          ),
                          Text('Female')
                        ],
                      )),
                ),
              ],
            ),
          ),
          Expanded(
              child: CustomCard(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Height'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    _height.toString(),
                    style: TextStyle(fontSize: 50),
                  ),
                  Text('cm'),
                ],
              ),
              Slider(
                value: _height.toDouble(),
                min: 120,
                max: 250,
                activeColor: kPink,
                onChanged: (double c) {
                  setState(() {
                    _height = c.round();
                  });
                },
              ),
            ]),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Weight'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '80',
                            style: TextStyle(fontSize: 50),
                          ),
                          Text('kg'),
                        ],
                      ),
                      PlusMinusButtons(),
                    ],
                  )),
                ),
                Expanded(
                  child: CustomCard(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Age'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '28',
                            style: TextStyle(fontSize: 50),
                          ),
                        ],
                      ),
                      PlusMinusButtons(),
                    ],
                  )),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              print('button clicked');
            },
            child: Container(
              color: kPink,
              height: 80,
              alignment: Alignment.center,
              child: Text(
                'Calculate your BMI'.toUpperCase(),
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PlusMinusButtons extends StatelessWidget {
  const PlusMinusButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
          child: Icon(Icons.remove),
          shape: CircleBorder(),
          constraints: BoxConstraints.tightFor(height: 56, width: 56),
          fillColor: kAccent,
          onPressed: () {},
        ),
        SizedBox(
          width: 10,
        ),
        RawMaterialButton(
          child: Icon(Icons.add),
          shape: CircleBorder(),
          constraints: BoxConstraints.tightFor(height: 56, width: 56),
          fillColor: kAccent,
          onPressed: () {},
        )
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  final Widget? child;
  final bool isActive;
  CustomCard({this.child, this.isActive = true});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      // margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: isActive ? Color(0xff1c2033) : kInactive,
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: child,
    );
  }
}
