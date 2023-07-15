import 'package:flutter/material.dart';
import 'package:flutter_loginapp_22/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController _fild1 = TextEditingController();
  TextEditingController _fild2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LogIn Page")),
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            TextField(
              controller: _fild1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0))),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _fild2,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0))),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  var fild1 = _fild1.text.toString();
                  var fild2 = _fild2.text.toString();
                  var s_id;
                  var s_pass;
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  if (pref.containsKey("id") && pref.containsKey("pass")) {
                    s_id = pref.getString("id").toString();
                    s_pass = pref.getString("pass").toString();
                  }
                  if (fild1 == '' && fild2 == '') {
                    Fluttertoast.showToast(
                        msg: "Enter Id and Pass",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else if (fild1 == s_id && fild2 == s_pass) {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setString("islogin", "yes");
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyHomepage()));
                  } else {
                    Fluttertoast.showToast(
                        msg: "Data Not Found",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
