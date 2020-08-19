import 'package:dkatalisdemo/ui/schedule_call_screen.dart';
import 'package:dkatalisdemo/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_progress_indicator.dart';

class PersonalInfoScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PersonalInfoState();
  }
}

class PersonalInfoState extends State<PersonalInfoScreen>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedItem = items[0];
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:  AppBar(
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
              child: CustomProgressIndicator(),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: Text(AppConstants.TEXT_PERSONAL_INFO,
                style: TextStyle(color: Colors.white,fontSize: 18),),),
            Padding(padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
              child: Text(AppConstants.PERSONAL_INFO_SUB_HEADING,
                style: TextStyle(color: Colors.white,fontSize: 16),),),
            goalDropDown(),
            monthlyIncomeDropDown(),
            monthlyExpenseDropDown(),
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

  List<String> items = <String>[AppConstants.TEXT_CHOOSE_OPITON,
    'Normal', 'Sick', 'Others'];
  String selectedItem = '';

  Widget goalDropDown(){
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                child: Text(AppConstants.TEXT_GOAL,style:
                TextStyle(fontSize: 12,color: Colors.grey),),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text('Test'),
                  icon: Icon(Icons.expand_more,size: 30,),
                  value: selectedItem,
                  onChanged: (String Value) {
                    setState(() {
                      selectedItem = Value;
                    });
                  },
                  items: items.map((String str) {
                    return DropdownMenuItem<String>(
                      value: str,
                      child: Text(
                        str,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  isExpanded: true,
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(

          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
  Widget monthlyIncomeDropDown(){
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                child: Text(AppConstants.TEXT_MONTH_INCOME,style:
                TextStyle(fontSize: 12,color: Colors.grey),),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text('Test'),
                  icon: Icon(Icons.expand_more,size: 30,),
                  value: selectedItem,
                  onChanged: (String Value) {
                    setState(() {
                      selectedItem = Value;
                    });
                  },
                  items: items.map((String str) {
                    return DropdownMenuItem<String>(
                      value: str,
                      child: Text(
                        str,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  isExpanded: true,
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(

          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
  Widget monthlyExpenseDropDown(){
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
      child: Container(

        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                child: Text(AppConstants.TEXT_MONTH_EXPENSE,style:
                TextStyle(fontSize: 12,color: Colors.grey),),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text('Test'),
                  value: selectedItem,

                  icon: Icon(Icons.expand_more,size: 30,),
                  onChanged: (String Value) {
                    setState(() {
                      selectedItem = Value;
                    });
                  },
                  items: items.map((String str) {
                    return DropdownMenuItem<String>(
                      value: str,
                      child: Text(
                        str,
                        style: TextStyle(color: Colors.black,fontSize: 16),
                      ),
                    );
                  }).toList(),
                  isExpanded: true,
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(

          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  
  Widget nextButton(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ScheduleCallScreen()));
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