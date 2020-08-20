import 'package:dkatalisdemo/ui/password_screen.dart';
import 'package:dkatalisdemo/utils/app_constants.dart';
import 'package:dkatalisdemo/utils/common_utils.dart';
import 'package:dkatalisdemo/utils/validation_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_progress_indicator.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WelcomeScreen(),
    theme:  ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ));
}

class WelcomeScreen extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WelcomeState();
  }

}
class WelcomeState extends State<WelcomeScreen>{

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool autoValidate = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
          children: <Widget>[
            Container(
              height: 200,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: CustomProgressIndicator(progressCount: 0,),
              ),
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
                        child: nextButton(context),
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
        child: Form(
          child: Container(

            child: TextFormField(
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
                ),validator: ValidationUtils.validateEmail,),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          key: _formKey,
          autovalidate: autoValidate,
        ) //Text(AppConstants.TEXT_SEARCH,style: TextStyle(color: Colors.grey[600],fontSize: 16),),
    );
  }

  Widget nextButton(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: RaisedButton(
          onPressed: () {

            CommonUtils.hideKeyboard();
            _validateInputs();


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


  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>PasswordScreen()));
    
    } else {
      setState(() {
        autoValidate = true;
      });
    }
  }

}