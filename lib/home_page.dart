import 'dart:math';

import 'package:age/age.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_minip3/age_Calculater.dart';

class Homepage extends StatefulWidget {
  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  DateTime todaydate = DateTime.now();
  DateTime dob = DateTime(1998, 1, 1);
   late AgeDuration _ageDuration;
  late AgeDuration _nextBirthdate;
  late int _nextbdayWeekDay;

  @override
  void initState() {
    super.initState();
    _ageDuration=AgeCalculater().calculaterAge(todaydate, dob);
    _nextBirthdate=AgeCalculater().nextBirthday(todaydate, dob);
   _nextbdayWeekDay=AgeCalculater().nextbday(todaydate, dob); }


  List<String> _monthes = [
    "monthes",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  List<String> _weeks=["weeks","saturday","sunday","monday","tuesday",
    "wednesday","thursday","Friday"];
//Future<null>
 Future<Null> _selectTodayDate(BuildContext context) async {
    final DateTime? piceked = await showDatePicker(
        context: context,
        initialDate: todaydate,
        firstDate: dob,
        lastDate: DateTime(2100));
    if(piceked!=null&& piceked!=todaydate){
      setState(() {
        todaydate=piceked;
        _ageDuration=AgeCalculater().calculaterAge(todaydate, dob);
        _nextBirthdate=AgeCalculater().nextBirthday(todaydate, dob);
        _nextbdayWeekDay=AgeCalculater().nextbday(todaydate, dob);
      });

    }

 }
  Future<Null> _selectdobDate(BuildContext context) async {
    final DateTime? piceked = await showDatePicker(
        context: context,
        initialDate: dob,
        firstDate:DateTime(1990),
        lastDate: todaydate);
    if(piceked!=null&& piceked!=todaydate){
      setState(() {
        dob =piceked;
        _ageDuration=AgeCalculater().calculaterAge(todaydate, dob);
        _nextBirthdate=AgeCalculater().nextBirthday(todaydate, dob);
        _nextbdayWeekDay=AgeCalculater().nextbday(todaydate, dob);
      });

    }

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.pexels.com/photos/1102909/pexels-photo-1102909.jpeg?cs=srgb&dl=pexels-johannes-plenio-1102909.jpg&fm=jpg"),
              fit: BoxFit.fill)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                    width: double.maxFinite,
                  ),
                  Text("Age Clacuater",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Today",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        Row(
                          children: [
                            Text(
                              "${todaydate.day}/${_monthes[todaydate
                                  .month]}/${todaydate.year}",
                              style: TextStyle(
                                  color: Colors.yellowAccent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: (){
                                _selectTodayDate(context);
                              },
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date of birth",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        Row(
                          children: [
                            Text(
                              "${dob.day}/${_monthes[dob.month]}/${dob.year}",
                              style: TextStyle(
                                  color: Colors.yellowAccent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: (){
                                _selectdobDate(context);
                              },
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 40),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 200,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Age',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${_ageDuration.years}",
                                        style: TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 80,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                        child: Text(
                                          "Years",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    '${_ageDuration.months}Monthes | '
                                        '${_ageDuration.days} day',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 50),
                              color: Colors.white,
                              height: 180,
                              width: 1,
                            ), //the line
                            Container(
                              color: Colors.blue.withOpacity(0.2),
                              height: 200,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Next_Birthday",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(
                                    Icons.cake_outlined,
                                    color: Colors.yellow,
                                    size: 50,
                                  ),
                                  Text(
                                    "${_weeks[_nextbdayWeekDay]}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '${_nextBirthdate.months} months | '
                                        '${_nextBirthdate.days} days',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          width: double.maxFinite,
                          color: Colors.white60,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                        ), //line

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "summary",
                            style:
                            TextStyle(color: Colors.yellow, fontSize: 18),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("Years",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100)),
                                Text("${_ageDuration.years}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w100)),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Months",
                                    style: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100)),
                                Text("${((_ageDuration.years)*12)+
                                    (_ageDuration.months)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w100)),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Weeks",
                                    style: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100)),
                                Text("${(todaydate.difference(dob).inDays/7)
                                    .floor()}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w100)),
                              ],
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("Days",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100)),
                                Text("${(todaydate.difference(dob).inDays)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w100)),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Hours",
                                    style: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100)),
                                Text("${(todaydate.difference(dob).inHours)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w100)),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Minutes",
                                    style: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100)),
                                Text("${todaydate.difference(dob).inMinutes}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w100)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
