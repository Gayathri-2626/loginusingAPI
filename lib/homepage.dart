import 'package:flutter/material.dart';
import 'package:login_http/login.dart';
import 'custom_widgets.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: HeroImage(
              imgHeight: MediaQuery.of(context).size.height*0.6,
            ),
          ),
          Positioned(
              bottom: 5,
              child:Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: <Widget>[
                      Text('Testing Http', style: Theme.of(context).textTheme.headline,),
                      SizedBox(height: 20,),
               CustomButton(onBtnPressed: (){
                 print('hello');
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                   return Login();
                 }));
               },
                 btnText: 'Lets go',)
                    ],
              ),
          ),

      ),
      ],
      ),
    );
  }
}
