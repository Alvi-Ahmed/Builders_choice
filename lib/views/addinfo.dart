import 'package:builders_choice/views/productadd.dart';
import 'package:builders_choice/widgets/widgets.dart';
import 'package:flutter/material.dart';

class addinfo extends StatefulWidget {
  final String projectid;
   addinfo(this.projectid);

  @override
  _addinfoState createState() => _addinfoState();
}

class _addinfoState extends State<addinfo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),

      ),
      body: Container(
        alignment: Alignment.center,
        child:Column(
          children: [
            Spacer(),

          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => productAdd(widget.projectid)
              ));

            },
            child: Container(
            height:50,
            width: 200,
                alignment: Alignment.center,
             // margin: const EdgeInsets.all(100.0),
            child: Text("Add Product"),
              decoration: BoxDecoration(
                  color: Colors.teal[600],
                  borderRadius:  BorderRadius.circular(30)
              ),
             ),
          ),
            SizedBox(height: 15,),
            Container(
              height:50,
              width: 200,
              alignment: Alignment.center,
             // margin: const EdgeInsets.all(100.0),
              child: Text("Add Labour"),
              decoration: BoxDecoration(
                  color: Colors.teal[600],
                  borderRadius:  BorderRadius.circular(30)
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height:50,
              width: 200,
              alignment: Alignment.center,
             // margin: const EdgeInsets.all(100.0),
              child: Text("Add Product"),
              decoration: BoxDecoration(
                  color: Colors.teal[600],
                  borderRadius:  BorderRadius.circular(30)
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height:50,
              width: 200,
              alignment: Alignment.center,
             // margin: const EdgeInsets.all(100.0),
              child: Text("Add Product"),
              decoration: BoxDecoration(
                  color: Colors.teal[600],
                  borderRadius:  BorderRadius.circular(30)
              ),
            ),

            Spacer(),
          ],
        ),
      ),


    );
  }
}
