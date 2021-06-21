import 'package:flutter/material.dart';
import 'package:login_http/api.dart';
import 'package:login_http/custom_widgets.dart';
import 'package:login_http/hompepage2.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String message='';

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, elevation: 0.0),
      body: Column(
        children: <Widget>[
          HeroImage(imgHeight: MediaQuery.of(context).size.height*0.35,
          ),
          Expanded(
              child: ListView(
                children: <Widget>[
                  Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Form(key: _formkey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email',
                          labelStyle: TextStyle(fontSize: 20)),
                          controller: emailController,
                          validator: (value){
                            if(value.isEmpty){
                              return 'Required Email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10,),

                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(labelText: 'Password',
                              labelStyle: TextStyle(fontSize: 20)),
                          controller: passwordController,
                          validator: (value){
                            if(value.isEmpty){
                              return 'Required Password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('New user?'),
                            FlatButton(
                              child: Text('Signup',
                              style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),
                              ),onPressed: (){},)
                          ],
                        ),
                        CustomButton(onBtnPressed: ()async{
                          if(_formkey.currentState.validate()){
                            var email = emailController.text;
                            var password = passwordController.text;
                            setState(() {
                              message='Please wait...';
                            });
                            var rsp = await loginUser(email, password);
                            print(rsp);
                            if(true){
                              setState(() {
                                message='Success';
                              });
                              if(rsp['success']== true){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return Home(rsp['user']);
                                }));
                              }

                            }else{
                              setState(() {
                                message='Login Failed';
                              });
                            }
                          }
                        }, btnText: 'Login',),
                        SizedBox(height: 10,),
                        Text(message),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          SocialIcon(iconname: 'assets/facebook.png',),
                          SizedBox(width: 10,),
                            SocialIcon(iconname: 'assets/google.png',),
                            SizedBox(width: 10,),
                        ],)
                      ],
                    ),),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
