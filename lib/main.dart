import 'package:covid/photo.dart';
import 'package:covid/prevencao.dart';
import 'package:covid/transmissao.dart';
import 'package:covid/what.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: true,
    title: 'Covid-19',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Hello world!');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Hero(
            tag: 'banner',
            child: Material(
              elevation: 10.0,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(280)),
              shadowColor: Colors.red,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(147, 38, 38, 1),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(290)),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/corona.png',
                  height: 150.0,
                ),
                SizedBox(height: 20,),
                Text(
                  'COVID-19',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 20,),
                ButtonCostumize('O que é?', Icon(Icons.help), 'what'),
                SizedBox(height: 15,),
                ButtonCostumize('Transmissão', Icon(Icons.queue), 'transmissao'),
                SizedBox(height: 15,),
                ButtonCostumize('Como se prevenir?', Icon(Icons.person), 'prevencao'),
                SizedBox(height: 25,),
              ],
            ),
          ),
          Positioned(
            top: 30.0,
            right: 10.0,
            child: Row(
              children: <Widget>[
                 IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.white,), 
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PhotoPage()));
                  }
                ),
                IconButton(
                  icon: Icon(Icons.info, color: Colors.white,), 
                  onPressed: (){
                    print('Clicado!');
                  }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonCostumize extends StatelessWidget {
  final Icon icon;
  final String texto;
  final String rota;

  ButtonCostumize(this.texto, this.icon, this.rota);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        child: RaisedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icon,
              SizedBox(width: 20,),
              Text(
                texto,
                style: TextStyle(fontSize: 16,),
              ),
            ],
          ),
          color: Colors.white,
          elevation: 5,
          textColor: Colors.black,
          onPressed: (){
            Navigator.push(context, 
              MaterialPageRoute(
                builder: (context) => 
                  (rota == 'what')?WhatPage():
                  (rota == 'transmissao')?TransmissaoPage():PrevencaoPage()
              )
            );
          }
        ),
      )
    );
  }
}