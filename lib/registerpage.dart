import 'package:flutter/material.dart';
import 'package:flutter_loginapp_22/homepage.dart';
import 'package:flutter_loginapp_22/loginpage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _id = TextEditingController();
  TextEditingController _pass = TextEditingController();
  cheklogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("islogin")) {
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MyHomepage()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cheklogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register yors self'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            TextField(
              controller: _id,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0))),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _pass,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0))),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  if (_id.text == '') {
                    Fluttertoast.showToast(
                        msg: "This is Center Short Toast",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else if (_pass.text == '') {
                    Fluttertoast.showToast(
                        msg: "This is Center Short Toast",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    //get and store
                    var id = _id.text.toString();
                    var pass = _pass.text.toString();
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setString("id", id.toString());
                    pref.setString("pass", pass.toString());
                    _id.text = '';
                    _pass.text = '';
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyLogin()));
                  }
                },
                child: Text("Register account")),
          ],
        ),
      ),
    );
  }
}
