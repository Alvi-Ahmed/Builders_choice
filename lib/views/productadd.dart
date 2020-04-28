import 'package:builders_choice/services/database.dart';
import 'package:builders_choice/widgets/widgets.dart';
import 'package:flutter/material.dart';


class productAdd extends StatefulWidget {
  final String projectid;

   productAdd(this.projectid);

  @override
  _productAddState createState() => _productAddState();
}

class _productAddState extends State<productAdd> {


 // var selectedType;
  final _formKey = GlobalKey<FormState>();
  String productquan , productvalue , selectedType;
  bool _isLoading= false;

  DatabaseService databaseService = new DatabaseService();

  uploadProductData() async{
    if(_formKey.currentState.validate()){

      setState(() {
        _isLoading = true;
      });

      Map<String, String> productMap ={
        "selectedType" : selectedType,
        "productquan"   : productquan,
        "productvalue"  : productvalue
      };

      await databaseService.addProductData(productMap, widget.projectid).then((val){


        setState(() {
          _isLoading = false;
        });

      }).catchError((e){
        print(e);
      });
    }else{
      print("error is happening");
    }

  }
  List<String> _productType=<String>[
        "Rod",
        "Cement",
        "Brick",
        "Sand",
        "Stone",
        "Vereities",
        "Color",
        "Tiles",
        "Mozaik",
        "Pipe",
        "Comode",
         "Window",
         "Door",
          "Fan",
          "Switch",
           "Wire",
           "Bulb"

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),

      ),
      body: _isLoading ? Container(
        child: Center(child: CircularProgressIndicator(),),
      ) : Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(

            children: [
              DropdownButtonFormField(

                items: _productType.map((value) => DropdownMenuItem(child:
                  Text(
                    value,
                  ),
                value: value,
                )).toList(),
                onChanged: (selectedProductType){
                  setState(() {
                     selectedType=selectedProductType;
                  });
                },
               value: selectedType,
                isExpanded: true,
                hint: Text('Choose Product'),
              ),
              SizedBox(height: 6,),
              TextFormField(
                validator: (val) => val.isEmpty ? "Product Quantity" : null,
                decoration: InputDecoration(
                    hintText: "Product Quantity"
                ),
                onChanged: (val){
                  productquan = val;
                },
              ),
              SizedBox(height: 6,),
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter Product Value" : null,
                decoration: InputDecoration(
                    hintText: "Product Value"
                ),
                onChanged: (val){
                  productvalue = val;
                },
              ),
              Spacer(),
              GestureDetector(
                  onTap: (){
                    uploadProductData();
                  },
                  child: blueButton(context, "Buy Product")),
              SizedBox(height: 300,)
            ],
          ),
        ),
      ),
    );
  }
}
