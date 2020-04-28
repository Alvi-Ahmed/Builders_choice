import 'package:builders_choice/helper/functions.dart';
import 'package:builders_choice/services/auth.dart';
import 'package:builders_choice/views/home.dart';
import 'package:builders_choice/views/signin.dart';
import 'package:builders_choice/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String name, email, password;
  bool _isloading = false;
  AuthService authService = new AuthService();
  signUp() async{
    if(_formKey.currentState.validate()) {
      setState(() {
        _isloading = true;
      });
      authService.signUpWithEmailAndPassword(email, password).then((value){
      if(value!= null){
        setState(() {
          _isloading = false;
        });
        HelperFunction.saveUserLoggedInDetails(isLoggedin: true);
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => Home()
        ));
      }
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
      ),
      body: _isloading ? Container(
         child: Center(child: CircularProgressIndicator(),)
      ) : Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
              children: [
                Spacer(),
                TextFormField(
                  validator: (val){ return val.isEmpty ? "Enter correct emailid" : null;},
                  decoration: InputDecoration(
                      hintText: "Name"
                  ),
                  onChanged: (val){
                    name = val;
                  },
                ),
                TextFormField(
                  validator: (val){ return val.isEmpty ? "Enter correct emailid" : null;},
                  decoration: InputDecoration(
                      hintText: "Email"
                  ),
                  onChanged: (val){
                    email = val;
                  },
                ),
                SizedBox(height: 6,),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Passwords"
                  ),
                  onChanged: (val){
                    password = val;
                  },
                ),
                SizedBox(height: 24,),
                GestureDetector(
                  onTap: (){
                    signUp();
                  },
                  child: blueButton(context, "Sign Up")
                ),
                SizedBox(height: 18,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account? ", style: TextStyle(fontSize: 15.5),),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                        child: Text("Sign In ", style: TextStyle(fontSize: 15.5, decoration: TextDecoration.underline),))
                  ],
                ),
                SizedBox(height: 80,)
              ]
          ) ,
        ),
      ),
    );
  }
}
