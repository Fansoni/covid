import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

class PhotoPage extends StatefulWidget {
  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {

  File _image;

  /*Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save_alt), onPressed: (){print('salvo com sucesso!');},),
          IconButton(icon: Icon(Icons.cancel), onPressed: (){
            /*getImage();
            print(_image);*/
          },),
        ],
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              //color: Colors.yellow,
            ),
            Positioned(
              child: Container(
                color: Colors.blue,
                height: MediaQuery.of(context).size.height,
                child: Text(
                  'O que é ?',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            DraggableImage(offset: Offset(20.0, 20.0),),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 210,
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.red,
                      child: CustomPaint(
                        painter: MolduraPainter(color: Colors.red.withOpacity(0.8), padding: 10)
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.red,
                      child: CustomPaint(
                        painter: MolduraPainter(color: Color.fromRGBO(147, 38, 38, 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.home, size: 100, color: Colors.white,)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    '#FIQUE EM CASA',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(height: 135,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Container(
                                    width: 170,
                                    child: Text(
                                      'Proteja a tua e a vida das pessoas que amas. Todos na luta contra o Covid-19!',
                                      style: TextStyle(
                                        color: Colors.white60
                                      ),
                                    )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 70,
              right: 40,
              child: Container(
                child: stopIcon()),
            ),
          ],
        ),
      ),
    );
  }

  Stack stopIcon() {
    return Stack(
      children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Container(
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset('assets/corona.png', width: 70,),
                ),
              ),
              Positioned(
                top: 50,
                right: 5,
                child: Transform(
                  origin: Offset(0.0, 0.0),
                  transform: Matrix4.rotationZ(18.3),
                  child: Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(40))
                    ),
                    child: Center(child: 
                      Text('Stop', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class MolduraPainter extends CustomPainter{
  
  final Color color;
  final double padding;
  MolduraPainter({
    this.color,
    this.padding : 0.0
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
    ..color = this.color
    ..strokeWidth = 8.0;

    var firtControlPoint = Offset(size.width/4, 0.0);
    var firtEndPoint = Offset(size.width/4 + 78, size.height - 150);

    var secondControlPoint = Offset(size.width - 100 + this.padding, size.height - (80 + this.padding));
    var secondEndPoint = Offset(size.width - 50, size.height - (120 + this.padding));

    Path path = new Path()
    ..lineTo(0.0, 0.0)
    ..quadraticBezierTo(firtControlPoint.dx, firtControlPoint.dy, firtEndPoint.dx, firtEndPoint.dy)
    ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy)
    ..lineTo(size.width, size.height - (115 + this.padding))
    ..lineTo(size.width, size.height)
    ..lineTo(0.0, size.height)
    ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
  
}

class DraggableImage extends StatefulWidget {
  Offset offset;

  DraggableImage({Key key, this.offset}):super(key:key);

  @override
  _DraggableImageState createState() => _DraggableImageState();
}

class _DraggableImageState extends State<DraggableImage> {

  Offset position;

  @override
  void initState() {
    super.initState();
    position = (widget.offset == null) ? Offset(0.0,0.0) : widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position.dy,
      left: position.dx,
      child: Draggable(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child: Center(
            child: Text('Fansoni'),
          ),
        ),
        feedback: Container(
          width: 200,
          height: 200,
          color: Colors.blue.withOpacity(0.75),
          child: Center(
            child: Text('Fansoni'),
          ),
        ),
        onDraggableCanceled: (velocity, offset){
          setState(() {
            position = offset;
          });
        },
      ),
    );
  }
}