import 'package:flutter/material.dart';
import 'package:mountain/pages/homepage.dart';
import '../services/networkhelper.dart';
import '../models/loginmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Image(image: AssetImage('assets/mountainlogo.png')),
            Text(
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
                "Login to your account"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(children: [
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: 'Enter Username',
                    labelText: 'Username',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(width: 2, color: Colors.blue)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide(width: 2, color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    labelText: 'Password',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(width: 2, color: Colors.blue)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide(width: 2, color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: check,
                        onChanged: (bool? value) {
                          if (value != null)
                            setState(() {
                              check = value;
                            });
                        },
                      ),
                      Text('Remember Me'),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width: 400,
                    height: 60,
                    child: ElevatedButton(
                        child: Text("Login"),
                        onPressed: () async {
                          var phoneData = phoneController.text.toString();
                          var passwordData = passwordController.text.toString();

                          Login logindata = await NetworkHelper().getLogin(
                              phone: phoneData, password: passwordData);

                          var status = logindata.status;
                          print(status);

                          if (status == 'success') {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }));
                          }
                        })),
              ]),
            ),
          ],
        ),
      )),
    );
  }
}
