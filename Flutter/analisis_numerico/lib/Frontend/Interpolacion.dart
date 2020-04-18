import 'package:analisis_numerico/Frontend/EcLineales/incremental.dart';
import 'package:flutter/material.dart';


class Interpolacion extends StatefulWidget {

  Interpolacion({Key key}) : super(key: key);
  @override
  _InterpolacionHomeState createState() => _InterpolacionHomeState();
}

class _InterpolacionHomeState extends State<Interpolacion> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interpolation'),
      ),
      body: Center(
          child: Container(child: Text("This is not enough sexy yet"),)
      ),
    );
  }

  Widget buttonsList(){
    final List<String> entries = <String>['Incremental', 'Bisection'];
    final List<Widget> pages = <Widget>[IncrementalFront()];
    //final List<int> colorCodes = <int>[600, 500, 100];
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (context, int index){
        return GestureDetector(
            onTap: (){
              print("${entries[index]} clicked");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pages[index]),
              );
            },
            child: new Container(
              padding: new EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
              child: Text(
                entries[index],
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 1,),
    );
  }

}
