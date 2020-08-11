import 'package:dkatalisdemo/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WelcomeScreen(),
    theme:  ThemeData(
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
      // This makes the visual density adapt to the platform that you run
      // the app on. For desktop platforms, the controls will be smaller and
      // closer together (more dense) than on mobile platforms.
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ));
}

class WelcomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.blue,
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 200, 0, 0),

            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(AppConstants.WELCOME_SCREEN_HEADING,
                        style: TextStyle(color: Colors.black,fontSize: 22,
                          fontWeight: FontWeight.bold,),textScaleFactor: 1.5,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Text(AppConstants.WELCOME_SCREEN_TEXT_1,
                        style: TextStyle(color: Colors.black,fontSize: 14,
                          fontWeight: FontWeight.bold,),textScaleFactor: 1.5,),
                    ),
                    emailTextfieldWidget(),
                    Spacer(flex: 1,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: nextButton(),
                    )
                  ],
                ),
              ),
            ),)
        ] ,
      ),
    );
  }

  Widget emailTextfieldWidget() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(

          child: TextField(
              onChanged: (value) {

              },
              decoration: InputDecoration(
                hintText: AppConstants.TEXT_EMAIL,
                contentPadding:
                EdgeInsets.symmetric(vertical: 20),
                hintStyle:
                TextStyle(color: Colors.grey, fontSize: 16),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.email),
                focusColor: Colors.black,
              )),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ) //Text(AppConstants.TEXT_SEARCH,style: TextStyle(color: Colors.grey[600],fontSize: 16),),
    );
  }

  Widget nextButton() {
    return SizedBox(
        width: double.infinity,
        child: RaisedButton(
          onPressed: () {

          },
          color: Colors.blue,
          child: Text(AppConstants.TEXT_NEXT,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(15.0),
        ));
  }
}