import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomProgressState();
  }
}

class CustomProgressState extends State<CustomProgressIndicator>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(

      children: <Widget>[

        circularContainer('1'),
        lineSeperator(),
        circularContainer('2'),
        lineSeperator(),
        circularContainer('3'),
        lineSeperator(),
        circularContainer('4'),

      ],
    );
  }



  Widget circularContainer(String text){

    return Container(

      width: 50,
      height: 50,
      child: Center(
        child: Text(text,style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: Colors.black,width: 2.0)
      ),
    );
  }
  Widget lineSeperator(){
    return Expanded(
      child: Container(
        height: 4,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.black
        ),
      ),
    );
  }
}