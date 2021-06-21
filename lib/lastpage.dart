import 'package:flutter/material.dart';
import 'package:login_http/homepage.dart';

class Lastpage extends StatefulWidget {
  var user;

  @override
  _LastpageState createState() => _LastpageState();
}

class _LastpageState extends State<Lastpage> {

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
    _name.text = widget.user['username'];
    _firstname.text = widget.user['first_name'];
    _lastname.text = widget.user['last_name'];
    _email.text = widget.user['email'];
    _password.text = widget.user['phone'];
    super.initState();
    Homepage homepage = Homepage();
    @override
    Widget build(BuildContext context) {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/bellie2.jpg'),
                )
              ],
            ),
          ),
          ),
        ),
      );
  }
}
