import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: true,

    home:MyWeather() ,
  ));
}



class MyWeather extends StatefulWidget {
  const MyWeather({super.key});

  @override
  State<MyWeather> createState() => _MyWeatherState();
}

class _MyWeatherState extends State<MyWeather> {

var temp;
var tempc;
var description;

  Future<void> getData() async{
 String url="https://api.openweathermap.org/data/2.5/weather?q=Kathmandu&appid=55aff65953c3dc53091c7cd4ca406691";

  var response=await get(Uri.parse(url));
 // print(response.body);
  Map data =jsonDecode(response.body);

  setState(() {

    tempc=data["main"]["temp"]-272.15;//is degree celcius frm kelvin
 temp=tempc.toString();

 // print(temp);

  description=data["weather"][0]["description"];
  //print(description);
    
  });


}

  @override
  void initState() { 
    super.initState();
     getData();
    
  }
  @override
  Widget build(BuildContext context) {

   
    return Scaffold(
    
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          
          children:
         [

          Text("Temperature of ktm valley",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          

          Text(temp!=null?"Temperature is: $temp":"loading",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          Text(description!=null?"Description is: $description":"loading",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        ]),
      ),
    );
  }
}