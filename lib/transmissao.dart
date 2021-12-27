import 'package:flutter/material.dart';
import 'model/transmissaoItem.dart';

class TransmissaoPage extends StatefulWidget {
  @override
  _TransmissaoPageState createState() => _TransmissaoPageState();
}

class _TransmissaoPageState extends State<TransmissaoPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  int _itemIndex = 0;

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
                    //borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),
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
                    //borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 20.0),
                          child:  Material(
                            color: Colors.transparent,
                            child: InkWell(
                              child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30.0,), 
                              onTap: (){
                                Navigator.pop(context);
                              }
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:90.0, left: 20.0),
                        child: Text(
                          'Transmissão',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ),
          SizedBox(height: 20.0,),
          Row(
            children: <Widget>[
              Container(
                width: 30,
                height: 350.0,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(147, 38, 38, 1),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(100.0), topRight: Radius.circular(100.0)),
                ),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      if(_itemIndex > 0){
                        _itemIndex--;
                      }
                    });
                  },
                  child: Center(
                    child: Icon(Icons.arrow_left, color: Colors.white, size:30.0),
                  ),
                ),
              ),
              
              SlideItem(_itemIndex),

              Container(
                width: 30,
                height: 350.0,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(147, 38, 38, 1),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100.0), topLeft: Radius.circular(100.0)),
                ),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      if(_itemIndex < transmissaoList.length - 1){
                        _itemIndex++;
                      }
                    });
                  },
                  child: Center(
                    child: Icon(Icons.arrow_right, color: Colors.white, size:30.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          SlideDots(_itemIndex),
        ],
      ),
    );
  }
}

class SlideDots extends StatelessWidget {
  final int index;
  SlideDots(this.index);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        /*for (var i = 0; i < transmissaoList.length; i++)
          (index == i)?*/
            Icon(Icons.radio_button_checked, size: 30, color: Color.fromRGBO(147, 38, 38, 1),)
          //:
            ,Icon(Icons.radio_button_unchecked)
      ],
    );
  }
}

class SlideItem extends StatelessWidget {
  final int index;

  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-60,
      height: 350,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          child: Material(
            elevation: 4.0,
            shadowColor: Color.fromRGBO(147, 38, 38, 1),
            //color: Color.fromRGBO(0, 0, 0, 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10.0,),
                Image.asset(transmissaoList[index].imagem, width: 180.0,),
                SizedBox(height: 10.0,),
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(
                      color: Color.fromRGBO(147, 38, 38, 1),
                      style: BorderStyle.solid,
                      width: 2.0
                    )),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top:10.0),
                    child: Text(
                      transmissaoList[index].descricao,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}