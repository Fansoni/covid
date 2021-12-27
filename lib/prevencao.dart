import 'package:covid/model/prevencaoItem.dart';
import 'package:flutter/material.dart';

class PrevencaoPage extends StatefulWidget {
  @override
  _PrevencaoPageState createState() => _PrevencaoPageState();
}

class _PrevencaoPageState extends State<PrevencaoPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Color sintomasBack = Color.fromRGBO(147, 38, 38, 1);
  Color sintomasFore = Colors.white;

  Color medidasBack = Color.fromRGBO(0, 0, 0, 0.1);
  Color medidasFore = Colors.black;

  List<PrevencaoModel> listaSend = sintomasList;

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
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),
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
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
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
                      Padding(
                        padding: EdgeInsets.only(top:70.0, left: 20.0),
                        child: Text(
                          'Prevenção',
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

          SizedBox(height: 10.0,),

          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        var auxBack = sintomasBack;
                        var auxFore = sintomasFore;

                        sintomasBack = medidasBack;
                        sintomasFore = medidasFore;

                        medidasBack = auxBack;
                        medidasFore = auxFore;

                        listaSend = sintomasList;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 5.0),
                      child:  ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Material(
                          elevation: 4.0,
                          color: sintomasBack,
                          child: Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Text('Sintomas', style: TextStyle(fontSize: 20, color: sintomasFore), textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        var auxBack = medidasBack;
                        var auxFore = medidasFore;

                        medidasBack = sintomasBack;
                        medidasFore = sintomasFore;

                        sintomasBack = auxBack;
                        sintomasFore = auxFore;

                        listaSend = medidasList;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 10.0),
                      child:  ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Material(
                          elevation: 4.0,
                          color: medidasBack,
                          child: Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Text('Medidas', style: TextStyle(fontSize: 20, color: medidasFore), textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          PrevencaoList(listaSend)
          
        ],
      ),
    );
  }
}

class PrevencaoList extends StatelessWidget {

  final List<PrevencaoModel> lista;

  PrevencaoList(this.lista);

  @override
  Widget build(BuildContext context) {
    var item = lista[0];
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            //for (var item in lista){
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Material(
                  //color: Color.fromRGBO(0, 0, 0, 0.1),
                  elevation: 4.0,
                  shadowColor: Color.fromRGBO(147, 38, 38, 1),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Image(image: AssetImage(item.imagem), width: 130,),
                        SizedBox(width: 10.0,),
                        Expanded(child: Text(
                          item.descricao,
                          style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            //}
          ],
        ),
      ),
    );
  }
}