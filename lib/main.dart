import 'package:builders_choice/helper/functions.dart';
import 'package:builders_choice/views/home.dart';
import 'package:builders_choice/views/signin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedin = false;
  @override
  void initState() {
    checkUserLoggedInState();
    super.initState();
  }

  checkUserLoggedInState()async{
   HelperFunction.getUserLoggedInDetails().then((value){
     setState(() {
       _isLoggedin = value;
     });
   });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness:Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF212121),
        accentColor: const Color(0xFF64ffda),
        canvasColor: const Color(0xFF303030),
      ),
      home: (_isLoggedin ?? false) ? Home() : SignIn(),
    );
  }
}

//class MyHomePage extends StatefulWidget {
 // MyHomePage({Key key}) : super(key: key);
 // @override
 // _MyHomePageState createState() => new _MyHomePageState();
//}

//class _MyHomePageState extends State<MyHomePage> {
 // @override
  //Widget build(BuildContext context) {
    //return new Scaffold(
     // appBar: new AppBar(
     //   title: new Text(' App Name '),
    //  ),
     // body:
  //    new Column(
    //      mainAxisAlignment: MainAxisAlignment.start,
      //    mainAxisSize: MainAxisSize.max,
   //       crossAxisAlignment: CrossAxisAlignment.center,
     //     children: <Widget>[
       //     new Row(
         //       mainAxisAlignment: MainAxisAlignment.center,
       //         mainAxisSize: MainAxisSize.max,
        //        crossAxisAlignment: CrossAxisAlignment.center,
          //      children: <Widget>[
     //             new Container(
      //              color: const Color(0xFF662828),
       //             padding: const EdgeInsets.all(0.0),
        //            alignment: Alignment.center,
     //               width: 130.0,
      //              height: 50.0,
       //           )
        //        ]

         //   )
        //  ]

     // ),

    //  floatingActionButton: new FloatingActionButton(
   //       child: new Icon(Icons.add_circle_outline),
    //      onPressed: fabPressed),
 //   );
 // }
 // void fabPressed() {}

//}