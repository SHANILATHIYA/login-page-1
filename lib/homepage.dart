import 'package:flutter/material.dart';
import 'package:flutter_loginapp_22/loginpage.dart';
import 'package:flutter_loginapp_22/registerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  var name, password;
  getdata() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString("id").toString();
      password = pref.getString("pass").toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Container(child: Text("welcomne")),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Text("my Profile"),
            Text("id$name"),
            Text("pass$password"),
            ElevatedButton(
                onPressed: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.remove("islogin");
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => MyLogin()));
                },
                child: Text("Logout")),
          ],
        ),
      ),
    );
  }
}
