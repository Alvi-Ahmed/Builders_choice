import 'package:builders_choice/services/database.dart';
import 'package:builders_choice/views/addinfo.dart';
import 'package:builders_choice/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class CreateProject extends StatefulWidget {
  @override
  _CreateProjectState createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {

  final _formkey = GlobalKey<FormState>();
  String projectname , projectaddress, projectid, projectvalue;
  bool _isLoading = false;
  DatabaseService databaseService = new DatabaseService();

  createProject() async {
    if(_formkey.currentState.validate()){
      setState(() {
        _isLoading = true;
      });


     projectid = randomAlphaNumeric(16);
     Map<String, String> projectMap = {
       "projectid" : projectid,
       "projectName" : projectname,
       "projectAddress" : projectaddress,
       "projectvalue" : projectvalue
     };
   //  Map<String, num> projecteMap = {
   //    "projectValue" : projectvalue
   //  };
     //await databaseService.addProjectData(projecteMap, projectid).then((value)
    //{
     //  setState(() {
     //    _isLoading = false;
     //    Navigator.pushReplacement(context, MaterialPageRoute(
      //     builder: (context) => addinfo()
     //    ));
    //   });
   //  });
     await  databaseService.addProjectData(projectMap, projectid).then((value){
       setState(() {
         _isLoading = false;
         Navigator.pushReplacement(context, MaterialPageRoute(
             builder: (context) => addinfo(
               projectid
             )));
       });
     });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
      ),
      body: _isLoading ? Container(
        child: Center(child: CircularProgressIndicator(),),
      ) : Form(
        key: _formkey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: (
          Column(
            children: [
            TextFormField(
              validator: (val) => val.isEmpty ? "Enter Project Name" : null,
              decoration: InputDecoration(
                hintText: "Project Name"
              ),
              onChanged: (val){
                projectname = val;
              },
            ),
              SizedBox(height: 6,),
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter Project Address" : null,
                decoration: InputDecoration(
                    hintText: "Project Address"
                ),
                onChanged: (val){
                  projectaddress = val;
                },
              ),
              SizedBox(height: 6,),
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter Project Value" : null,
                decoration: InputDecoration(
                    hintText: "Project Value"
                ),
                onChanged: (val){
                  projectvalue = val;
                },
              ),
              Spacer(),
              GestureDetector(
                  onTap: (){
                    createProject();
                  },
                  child: blueButton(context, "Add Project")),
              SizedBox(height: 60,),
            ],
          )
          ),
        ),
      )
    );
  }
}
