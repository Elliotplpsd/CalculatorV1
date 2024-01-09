import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import "calculator.dart";

class ExpandedButton extends StatelessWidget 
{

  final Widget child;
  final VoidCallback? onPressed;
  final Color color;

  const ExpandedButton({ this.onPressed, this.child = const Icon(Icons.graphic_eq), this.color = Colors.green, super.key});

  @override
  Widget build(BuildContext context) =>
  Expanded
  (
    flex:1,
    child: TextButton
    (
      onPressed: onPressed,
      child: child,
    ),
  );
}

class ExpandedRow extends StatelessWidget //custom class for easier expanded rows
{
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  const ExpandedRow({required this.children, required this.crossAxisAlignment, super.key});

  @override
  Widget build(BuildContext context) =>
  Expanded
  (
    flex:1,

    child: Row
    (
      crossAxisAlignment: crossAxisAlignment,
      children: children,
    ),
  );
}

void main() => runApp(MyApp());
class MyApp extends StatelessWidget 
{

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      title: "Flutter Calculator",
      theme: ThemeData
      (
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorHomePage(title: "Flutter Calculator", ),
    );
  }
}

class CalculatorHomePage extends StatefulWidget 
{
  const CalculatorHomePage({super.key, required this.title});
  final String title;
  @override
  CalculatorHomePageState createState() => CalculatorHomePageState();

}

class CalculatorHomePageState extends State<CalculatorHomePage> 
{

  String _str = "0";//user inputs are changed with this variable
  var _calculation = Calculation();//constructs instance of calculator
  void add( String a) //when a button is clicked it is added to the string a
  {
    setState(()
    {
      _calculation.add(a);
      _str = _calculation.getString();
    });
  }
  void deleteAll() //if the user wants to delete all inputs from teh calculator
  {
    setState(() 
    {
      _calculation.deleteAll();
      _str = _calculation.getString();
    });
  }

  void deleteOne() //pretty much just a backspace
  {
    setState(() 
    {
      _calculation.deleteOne();
      _str = _calculation.getString();
    });
  }
  void getResult() //pressed "="
  {
    setState(() 
    {
      _str = _calculation.getResult().toString();
    });
    _calculation = Calculation();
  }
  //everything here is the visual aspect of the calculator
  @override
  Widget build(BuildContext context) 
  {
    return Center
    (
      child: Scaffold
      (
        appBar: AppBar(title: Text(widget.title),),
        body: Column
        (
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisSize: MainAxisSize.max,
          children: <Widget>
          [
            Expanded
            (
              flex: 2,
              child: Card
              (
                color: Colors.lightGreen[50],
                child: Padding
                (
                  padding: const EdgeInsets.all(15.0),
                  child: Text
                  (
                    _str,
                    textScaleFactor: 2.0,
                  ),
                ),
              ),
            ),
            Expanded
            (
              flex: 1,
              child: Row
              (
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>
                [
                  Expanded
                  (
                    flex: 3,
                    child: TextButton
                    (
                      child: const Text
                      (
                        'C',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: (){deleteAll();},


                    ),
                  ),
                  Expanded
                  (
                    flex: 1,
                    child: TextButton
                    (
                      child: const Text
                      (
                        '<-',
                        style: TextStyle(color: Colors.blue)
                      ),
                      onPressed: (){deleteOne();},

                    ),
                  ),
                ],
              ),
            ),
            Expanded
            (
              flex: 4,
              child: Row
              (
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>
                [
                  Expanded
                  (
                    flex: 3,
                    child: Column
                    (
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>
                      [
                        ExpandedRow
                        (
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>
                          [
                            ExpandedButton
                            (

                              onPressed: () {add( '7');},
                              color: Colors.blueAccent,
                              child: const Text
                              (
                                '7',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            ExpandedButton
                            (


                              onPressed: () {add( '8');},
                              color: Colors.blueAccent,
                              child: const Text
                              (
                                '8',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            ExpandedButton
                            (

                              onPressed: () {add( '9');},
                              color: Colors.blueAccent,
                              child: const Text
                              (
                                '9',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                        ExpandedRow
                        (
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children:<Widget>
                          [
                            ExpandedButton
                            (

                              onPressed: () {add( '4');},
                              color: Colors.blueAccent,
                              child: const Text
                              (
                                '4',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            ExpandedButton
                            (

                              onPressed: () {add( '5');},
                              color: Colors.blueAccent,
                              child: const Text
                              (
                                '5',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            ExpandedButton
                            (

                              onPressed: () {add( '6');},
                              color: Colors.blueAccent,
                              child: const Text
                              (
                                '6',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                        ExpandedRow
                        (

                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>
                          [
                            ExpandedButton
                            (

                              onPressed: () {add( '1');},
                              color: Colors.blueAccent,
                              child: const Text
                              (
                                '1',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            ExpandedButton
                            (

                              onPressed: () {add( '2');},
                              color: Colors.blueAccent,
                              child: const Text
                              (
                                '2',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            ExpandedButton
                            (

                              onPressed: () {add( '3');},
                              color: Colors.blueAccent,
                              child: const Text
                              (
                                '3',
                                style: TextStyle(color: Colors.blue)
                              ),
                            ),
                          ],
                        ),
                        ExpandedRow
                        (
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>
                          [
                            ExpandedButton
                            (

                              onPressed: () {add( '0');},
                              color: Colors.blueAccent,
                              child: const Text
                              (
                                '0',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            ExpandedButton
                            (

                              onPressed: () {add( '.');},
                              color: Colors.blueAccent,
                              child: const Text
                              (
                                '.',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            ExpandedButton
                            ( 
                              onPressed: () {getResult();},
                              color: Colors.blue,
                              child: const Text( '=',),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded
                  (
                    flex: 1,
                    child: Column
                    (
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>
                      [
                        ExpandedButton
                        (

                          onPressed: () {add( '÷');},
                          color: Colors.blue,
                          child: const Icon(CupertinoIcons.divide),
                        ),
                        ExpandedButton
                        (

                          onPressed: () {add( 'x');},
                          color: Colors.blue,
                          child: const Text( 'x'),
                        ),
                        ExpandedButton
                        (

                          onPressed: () {add( '-');},
                          color: Colors.blue,
                          child: const Text( '-'),
                        ),
                        ExpandedButton
                        (

                          onPressed: () {add( '+');},
                          color: Colors.blue,
                          child: const Text( '+'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
//it looks really messy when you scroll quickly but its just a bunch of buttons inside rows which are inside more rows