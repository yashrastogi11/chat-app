import 'package:flutter/material.dart';
import 'package:we_chat/auth.dart';
import 'package:we_chat/homepage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

//  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//
//  @override
//  void initState() {
//    super.initState();
//    _firebaseMessaging.configure(
//      onMessage: (Map<String, dynamic> message) async {
//        print('onMessage: $message');
//      },
//      onLaunch: (Map<String, dynamic> message) async {
//        print('onMessage: $message');
//      },
//      onResume: (Map<String, dynamic> message) async {
//        print('onMessage: $message');
//      },
//    );
//
//    _firebaseMessaging.requestNotificationPermissions(
//      const IosNotificationSettings(alert: true, sound: true, badge: true)
//    );
//  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/wallpaper.jpg"),
              fit: BoxFit.fill,
            )),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            child: Text(
              "We Chat",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width,
            child: Text(
              "One stop for all your chats",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.3,
            width: MediaQuery.of(context).size.width - 120,
            left: 60,
            child: MaterialButton(
              onPressed: () {
                authService.googleSignIn();
                //                     Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                          currentUserId: authService.userid,
                        ),
                  ),
                );
              },
              child: Image.asset("images/google.png"),
            ),
          ),
        ],
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authService.user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialButton(
            onPressed: () => authService.signOut(),
            color: Colors.red,
            textColor: Colors.white,
            child: Text('Signout'),
          );
        } else {
          return MaterialButton(
            onPressed: () => authService.googleSignIn(),
            color: Colors.red,
            textColor: Colors.white,
            child: Text('Login with Google'),
          );
        }
      },
    );
  }
}
