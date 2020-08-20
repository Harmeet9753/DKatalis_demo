

import 'package:dkatalisdemo/ui/custom_progress_indicator.dart';
import 'package:dkatalisdemo/ui/personal_info_Screen.dart';
import 'package:dkatalisdemo/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PaswwordState();
  }
}

class PaswwordState extends State<PasswordScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Create Account',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        centerTitle: false,

        elevation: 0.0,

      ),
      body: Container(
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: CustomProgressIndicator(progressCount: 1,),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: Text(AppConstants.TEXT_CREATE_PASSWORD,
                style: TextStyle(color: Colors.white,fontSize: 18),),),
            Padding(padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
              child: Text(AppConstants.PASSWORD_SCREEN_TEXT_1,
                style: TextStyle(color: Colors.white,fontSize: 16),),),
            passwordTextfieldWidget(),
            Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 24),
              child: Text(AppConstants.TEXT_COMPLEXITY,
                style: TextStyle(color: Colors.white,fontSize: 16),),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: passwordCriteriaRow(),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: nextButton(context),
            ),
          ],
        ),

      ),
    );
  }

  Widget passwordTextfieldWidget() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Container(

          child: TextField(
              onChanged: (value) {},
              obscureText: true,
              maxLines: 1,

              decoration: InputDecoration(
                hintText: AppConstants.TEXT_CREATE_PASSWORD,
                contentPadding:
                EdgeInsets.symmetric(vertical: 20,horizontal: 12
                ),
                hintStyle: TextStyle(color: Colors.black, fontSize: 16),
                border: InputBorder.none,
                focusColor: Colors.black,
                suffixIcon: Icon(Icons.visibility,color: Colors.blue,)
              )),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ) //Text(AppConstants.TEXT_SEARCH,style: TextStyle(color: Colors.grey[600],fontSize: 16),),
    );
  }

  Widget passwordCriteriaRow(){

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        passwordCriteriaItems('a', 'Lowercase'),
        passwordCriteriaItems('A', 'Upercase'),
        passwordCriteriaItems('123', 'Number'),
        passwordCriteriaItems('9+', 'Characters'),

      ],

    );
  }

  Widget passwordCriteriaItems(String heading,String desc){

    return Column(
      children: <Widget>[
        Text(heading,style: TextStyle(color: Colors.white,fontSize: 28),),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(desc,style: TextStyle(color: Colors.white,fontSize: 14),),
        )
      ],
    );
  }

  Widget nextButton(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>PersonalInfoScreen()));
          },
          color: Colors.grey,
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