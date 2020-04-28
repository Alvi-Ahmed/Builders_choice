
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  Future<void> addProjectData(Map projectData, String projectid) async{
    await Firestore.instance.collection("project")
        .document(projectid)
        .setData(projectData)
        .catchError((e){
          print(e.toString());
    });
  }
  Future<void> addProductData(productData, String projectid) async{
    await Firestore.instance
        .collection("project")
        .document(projectid)
        .collection("pdin")
        .add(productData)
        .catchError((e){
          print(e.toString());
    });
}
  getProjectData() async{
    return await Firestore.instance.collection("project").snapshots();
  }

}