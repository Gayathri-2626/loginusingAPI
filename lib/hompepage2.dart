import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  var user;
  Home(this.user);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  TextEditingController _name = TextEditingController();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    _name.dispose();
    _firstname.dispose();
    _lastname.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _name.text=widget.user['username'];
    _firstname.text=widget.user['first_name'];
    _lastname.text=widget.user['last_name'];
    _email.text=widget.user['email'];
    _password.text=widget.user['phone'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: SingleChildScrollView(
         child: Form(
           key: _formkey,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               CircleAvatar(
                 radius: 70,
                 child: Image.asset('assets/bellie.jpg'),
               ),
               SizedBox(height: 15,),

               Padding(
                   padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                 child: TextFormField(
                   controller: _name,
                   keyboardType: TextInputType.text,
                   decoration: buildInputDecoration(Icons.person, "userame"),
                   validator: (String value){
                     if(value.isEmpty){
                       return "Please Enter name";
                     }
                     return null;
                   },
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                 child: TextFormField(
                   controller: _firstname,
                   keyboardType: TextInputType.text,
                   decoration: buildInputDecoration(Icons.person, "First Name"),
                   validator: (String value){
                     if(value.isEmpty){
                       return "Please Enter name";
                     }
                     return null;
                   },
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                 child: TextFormField(
                   controller: _lastname,
                   keyboardType: TextInputType.text,
                   decoration: buildInputDecoration(Icons.person, "Last Name"),
                   validator: (String value){
                     if(value.isEmpty){
                       return "Please Enter name";
                     }
                     return null;
                   },
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                 child: TextFormField(
                   controller: _email,
                   keyboardType: TextInputType.text,
                   decoration: buildInputDecoration(Icons.person, "Email"),
                   validator: (String value){
                     if(value.isEmpty){
                       return "Please Enter email";
                     }
                     return null;
                   },
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                 child: TextFormField(
                   controller: _password,
                   keyboardType: TextInputType.text,
                   decoration: buildInputDecoration(Icons.person, "Password"),
                   validator: (String value){
                     if(value.isEmpty){
                       return "Please Enter password";
                     }
                     return null;
                   },
                 ),
               ),

               SizedBox(
                 width: 200,
                 height: 50,
                 child: RaisedButton(
                   color: Colors.redAccent,
                   onPressed: (){
                      if(_formkey.currentState.validate())
                        {
                          print("Successful");
                        }else{
                        print("Unsuccessful");
                      }
                   },
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(50.0),
                     side: BorderSide(color: Colors.black87,width: 2),
                   ),
                   textColor: Colors.white,
                   child: Text('Submit'),
                 ),
               )
             ],
           ),
         ),
       ),
     ),
    );
  }

  buildInputDecoration(
      IconData person, String s) {}
}
