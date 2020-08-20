import 'package:dkatalisdemo/ui/custom_progress_indicator.dart';
import 'package:dkatalisdemo/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduleCallScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScheduleState();
  }
}

class ScheduleState extends State<ScheduleCallScreen> with TickerProviderStateMixin{

  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

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
              child: CustomProgressIndicator(progressCount: 3,),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0,0, 0),
              child: calendarAnimatedWidget(),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: Text(AppConstants.TEXT_SCHEDULE_CALL,
                style: TextStyle(color: Colors.white,fontSize: 18),),),
            Padding(padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
              child: Text(AppConstants.SCHEDULE_SCREEN_TEXT,
                style: TextStyle(color: Colors.white,fontSize: 16),),),
            datePickerWidget(),
            timePickerWidget(),
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


  Widget datePickerWidget(){
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
      child: Container(
       width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Date',style:
                        TextStyle(fontSize: 12,color: Colors.grey),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(AppConstants.CHOOSE_DATE_TEXT,style:
                          TextStyle(fontSize: 16,color: Colors.black),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.expand_more,size: 30,)
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

  Widget timePickerWidget(){
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Time',style:
                        TextStyle(fontSize: 12,color: Colors.grey),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(AppConstants.CHOOSE_TIME_TEXT,style:
                          TextStyle(fontSize: 16,color: Colors.black),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.expand_more,size: 30,)
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

  Widget calendarAnimatedWidget(){

    return Container(
      color: Colors.blue,
      child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Container(
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.5),
                shape: CircleBorder(),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0 * animationController.value),
                child: child,
              ),
            );
          },
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: CircleBorder(),
            ),
            child: IconButton(
              onPressed: () {},
              color: Colors.blue,
              icon: Icon(Icons.calendar_today, size: 24),
            ),
          ),
        ),

    )/*Container(

      width: 80,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: 40,
          height: 40,
          child: Center(
            child: Icon(Icons.calendar_today,size: 25,color: Colors.blue,),
          ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
            )
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue[300]
      ),
    )*/;
  }
}