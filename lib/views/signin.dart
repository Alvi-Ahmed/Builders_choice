import 'package:builders_choice/helper/functions.dart';
import 'package:builders_choice/services/auth.dart';
import 'package:builders_choice/views/home.dart';
import 'package:builders_choice/views/signup.dart';
import 'package:builders_choice/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  String email, password;
  AuthService authService = new AuthService();

  bool isloading =false;

  signIn() async{
    if(_formKey.currentState.validate()){
      setState(() {
        isloading = true;
      });

    await authService.signInEmailAndPass(email, password).then((val){
      if(val != null){
        setState(() {
          isloading = false;
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
      body: isloading ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
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
                 signIn();
                },
                child: blueButton(context, "Sign In")
              ),
              SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Text("Don't have an account? ", style: TextStyle(fontSize: 15.5),),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: Text("Sign Up ", style: TextStyle(fontSize: 15.5, decoration: TextDecoration.underline),))
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
