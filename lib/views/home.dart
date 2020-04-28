import 'package:builders_choice/services/database.dart';
import 'package:builders_choice/views/CreateProject.dart';
import 'package:builders_choice/widgets/widgets.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream projectStream;
  DatabaseService databaseService = new DatabaseService();

  Widget projectList(){
    return Container(
      child: StreamBuilder(
        stream: projectStream,
          builder: (context, snapshots){
          return snapshots.data == null
              ? Container():
              ListView.builder(
                  itemCount: snapshots.data.documents.length,
                  itemBuilder:(context, index){
                    return ProjectTile(name: snapshots.data.documents[index].data["projectName"],
                    desc: snapshots.data.documents[index].data["projectAddress"]);
          });
          },
      ),
    );
  }
@override
  void initState() {
    databaseService.getProjectData().then((val){
    setState(() {
      projectStream= val;
    });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
      ),
      body: projectList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => CreateProject()
          ));
        },
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  final String name;
  final String desc;
   ProjectTile({@required this.name,
   @required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(

    child: Stack(
    children: [
    Container(
    child: Column(children: [
    Text(name),
     Text(desc)
    ],),
    ),
    ],
    ),

    );
  }
}

