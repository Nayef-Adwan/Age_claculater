

import 'package:age/age.dart';

class AgeCalculater{
  // Calculate AGE OF PEESON
 AgeDuration calculaterAge(DateTime today,DateTime birthday){
   AgeDuration age;
   age=Age.dateDifference(fromDate: birthday, toDate: today,includeToDate: false);
   return age;
 }
 //Calculate the next Birthday
  AgeDuration nextBirthday(DateTime today,DateTime birthday){
   DateTime temp =DateTime(today.year,birthday.month,birthday.day);
   DateTime nextbirthdayDATE =
   temp.isBefore(today)?Age.add(date: temp, duration:AgeDuration(years: 1) )
       :temp;
   AgeDuration next_birthdayDuration=Age.dateDifference(fromDate: today, toDate:
   nextbirthdayDATE);
  return next_birthdayDuration;
   }
   int nextbday(DateTime today,DateTime birthday){
     DateTime temp =DateTime(today.year,birthday.day);
     DateTime nextbirthdayDATE =
     temp.isBefore(today)?Age.add(date: temp, duration:AgeDuration(years: 1) )
         :temp;
     return nextbirthdayDATE.weekday;


   }
 //Calculate the next Birthday weekday




}