class Calculation 
{
  List< String> a = [];//just holds values
  final RegExp regExp = RegExp( "[+\\-x÷]");//constructor for regular expressions

  Calculation();//constructor

  void add( String added) //add things to a list
  {
    if(a.isEmpty) 
    {

      if(!regExp.hasMatch(added)) //redundancy against adding an operator before a number
      {
        a.add(added);
      }
    }
    else if(regExp.hasMatch(a.last)) //redundancy against adding an operator immediately after another operator
    {
      if(!RegExp( "[+\\-x÷.]").hasMatch(added)) 
      {
        a.add(added);
      }
    }
    else 
    {
      if(regExp.hasMatch(added)) //if the user ends their input with a dot and not a .0 the program autofills the 0 for them
      {
        if(!RegExp( ".").hasMatch(a.last)) a.last+= ".0";
        a.add(added);
      } 
      else //adds input because it isnt a unique edge case like those above
      {
        a.last+=added;
      }
    }
  }


  String getString() //call this to display everything a currently has stored
  {
    String str = "";
    a.forEach(( String el) {str+=el;});
    return str;
  }


  double getResult() //this is where the magic happens
  {
    if( regExp.hasMatch(a.last) )//if the last value in the users input is an operator, remove the operator
    a.removeLast();

    if(a.last.lastIndexOf( ".") == a.last.length-1)//makes a substring based on the position of the .
    a.last = a.last.substring(0, a.length-1);// i dont fully understand this at the time of writing i wrote it following the tutorial

    for( int i = 0; i < a.length; i++) 
    {
      if(a[i] == "x") 
      {
        a[i-1] = "${double.parse(a[i-1]) * double.parse(a[i+1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;
      }
      else if(a[i] == "÷") 
      {
        a[i-1] = "${double.parse(a[i-1]) / double.parse(a[i+1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;

      }
    }
    for( int i = 0; i < a.length; i++) 
    {
      if(a[i] == "+") 
      {
        a[i-1] = "${double.parse(a[i-1]) + double.parse(a[i+1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;
      } 
      else if(a[i] == "-") 
      {
        a[i-1] = "${double.parse(a[i-1]) - double.parse(a[i+1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;
      }
    }
    if(a.length != 1) throw Error();
    return double.parse(a[0]);
  }


  void deleteOne() // just a really complicated looking backspace
  {
    if(a.length > 0) 
    {
      if(a.last.length > 1) 
      {
        a.last = a.last.substring(0, a.last.length-1);
      } 
      else 
      {
        a.removeLast();
      }
    }
  }


  void deleteAll() => a = [];//just makes the array(list?) empty
}