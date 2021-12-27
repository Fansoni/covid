import 'package:flutter/material.dart';

class WhatPage extends StatefulWidget {
  @override
  _WhatPageState createState() => _WhatPageState();
}

class _WhatPageState extends State<WhatPage>
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Hero(
            tag: 'banner',
            child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
                    child: Image.asset(
                      'assets/banner.jpg',
                      fit: BoxFit.cover,
                      height: 1000.0,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
                  ),
                  child: Column(
                    children: <Widget>[
                       Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 20.0),
                          child:  Material(
                            color: Colors.transparent,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30.0,), 
                              onPressed: (){
                                Navigator.pop(context);
                              }
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(top:60.0, right: 20.0),
                          child: Text(
                            'O que é ?',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ),
          
          Container(
            //color: Colors.yellow,
            //height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.only(left:10.0, right: 10.0, top: 20.0),
              child: Container(
                //color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Coronavírus',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(147, 38, 38, 1),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Text(
                      'Coronavírus é uma família de vírus que causam infecções respiratórias. O novo agente do coronavírus foi descoberto em 31 de Dezembro de 2019 após casos registados na China. Provoca a doença chamada de coronavírus (COVID-19).',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 6.0,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'A COVID-19 é uma infecção que se inicia com um quadro semelhante ao da gripe e resfriado, no entanto, pode agravar-se, podendo levar a óbito',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                        Image.asset('assets/tosse.jpg', width: 150,),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      'Os primeiros casos surgiram na cidade de Wuhan, na China, em Dezembro de 2019 e com o grande número de pessoas infectadas fez com que o Governo daquela cidade determinasse um período de quarentena a partir de 23 de Janeiro de 2020.',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}