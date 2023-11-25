import 'package:examplereto/pages/home_page.dart';
import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/fondo_init.jpg"),
              ),
        ),
        child: 
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text(
          "Navicury", 
          style: TextStyle(
            fontSize: 36, 
            fontWeight: FontWeight.bold,
            color: Colors.white,
            ),
          ),
        SizedBox(
          height: 48,
        ),
        InkWell(
          onTap: (){
            Navigator.push(
              context, MaterialPageRoute(builder: (context)=>HomePage())
            );
          },
          child: Image.asset(
            "assets/icon_fingerprint.png",
            width: 80,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "Toca con tu dedo para avanzar", 
          style: TextStyle(
            fontSize: 18, 
            fontWeight: FontWeight.normal,
            color: Colors.white,
            ),
          ),
        ],
        ),
        ),
      ),
      );
  }
}