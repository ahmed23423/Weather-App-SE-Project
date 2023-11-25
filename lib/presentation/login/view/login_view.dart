import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_windows/presentation/resources/routes_manager.dart';
import 'package:window_manager/window_manager.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/back2.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Text(
                    'ClearSky',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text("Login",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                      SizedBox(width: 33),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.signUp);
                        },
                        child: Text("Sign Up",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
                      )
                    ],
                  ),
                  SizedBox(height: 37),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.white)),
                          prefixIcon: const Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ),
                  SizedBox(height: 23),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.white)),
                          prefixIcon: const Icon(Icons.password),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ),
                  SizedBox(height: 23),
                  ElevatedButton(
                    child: Text("Login"),
                    onPressed: () async{
                      await windowManager.setMinimumSize(const Size(1024, 700));
                      await windowManager.setSize(const Size(1024, 700));
                      await windowManager.setResizable(true);
                      await windowManager.setHasShadow(false);
                      await windowManager.setAlignment(Alignment.center);
                      await windowManager.focus();
                      await windowManager.show();

                      Navigator.pushNamed(context, AppRoutes.home);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10.0),
                        fixedSize: Size(150, 50),
                        textStyle: TextStyle(
                          color: Color(0xFFF5F5F5),
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                        primary: Colors.grey,
                        onPrimary: Colors.white,
                        elevation: 15,
                        shadowColor: Colors.grey,
                        shape: StadiumBorder()),
                  ),
                  SizedBox(height: 23),
                  TextButton(
                    onPressed: () async{
                    },
                    child: Text("Forgot Password?",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
