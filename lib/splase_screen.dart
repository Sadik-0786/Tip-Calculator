import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tip_calculator/main.dart';
class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHome()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,

        decoration: BoxDecoration(
          color:Colors.white70
        ),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assites/loti/blueMoney.json',height: 200,width:200,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Mr ',style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300
                  ),),
                  Text('TIP',style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              ),
              Text('Calculater',style:TextStyle(
                  fontSize:20 ,
                  fontWeight: FontWeight.w300
              ),),
            ],
          ),
          SizedBox(width: 15,)
        ],
      ),
        ),
      );
    
  }
}
