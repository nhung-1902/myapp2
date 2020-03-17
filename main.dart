import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _userErr = "Username không hợp lệ";
  var _passErr = "Password phải trên 6 ký tự";
  var _userInvalid = false;
  var _passInvalid = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffd8d8d8) 
                  ),
                  child: FlutterLogo()
                ),
              ), 
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Text("Hello\nWelcome Flutter", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    color: Colors.black, 
                    fontSize: 30 
                  ), 
                ), 
              ), 
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  controller: _userController,
                  decoration: InputDecoration(
                    labelText: "USERNAME", 
                    errorText: _userInvalid ? _userErr : null,
                    labelStyle: TextStyle(color: Color(0xff888888),
                    fontSize: 15)
                  ), 
                ), 
              ), 
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      controller: _passController,
                      obscureText: !_showPass,
                      decoration: InputDecoration(
                        labelText: "PASSWORD", 
                        errorText: _passInvalid ? _passErr : null,
                        labelStyle: TextStyle(color: Color(0xff888888),
                        fontSize: 15)
                      ),
                    ),
                    GestureDetector(
                      onTap: onToggleshowPass,
                      child: Text(
                        _showPass ? "HIDE" : "SHOW", 
                        style: TextStyle(
                        color: Colors.blue, 
                        fontSize: 13, 
                        fontWeight: FontWeight.bold
                        )
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: SizedBox(
                  width: double.infinity, 
                  height: 56, 
                  child: RaisedButton(
                    color: Colors.blue, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Text(
                      "Sign In", 
                      style: TextStyle(color: Colors.white, fontSize: 16)
                    ),
                    onPressed: onSignInClicked, 
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onToggleshowPass(){
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClicked() {
    setState(() {
      if(_userController.text.length < 6 || _userController.text.contains("@")) {
        _userInvalid = true;
      }
      else {
        _userInvalid = false;
      }

      if(_passController.text.length < 6) {
        _passInvalid = true;
      }
      else {
        _passInvalid = false;
      }

      if(!_userInvalid && !_passInvalid){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) {
              return HomePage();
            }
          )
        );
      }
    });
  }
}