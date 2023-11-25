
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

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
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Login",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                          SizedBox(width: 33),
                          TextButton(
                            onPressed: () {},
                            child: Text("Sign Up",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          )
                        ],
                      ),
                      SizedBox(height: 37),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(

                          decoration: InputDecoration(
                              hintStyle:TextStyle(
                                  color: Colors.white
                              ) ,
                              hintText: "Email",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(color: Colors.white)),
                              prefixIcon: const Icon(Icons.email),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(color: Colors.white))

                          ),

                        ),
                      ),
                      SizedBox(height: 23),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(

                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
                                  borderSide:BorderSide(color: Colors.white) ),
                              prefixIcon: const Icon(Icons.password),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(color: Colors.white))


                          ),

                        ),

                      ),
                      SizedBox(height: 23),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(

                          decoration: InputDecoration(
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
                                  borderSide:BorderSide(color: Colors.white) ),
                              prefixIcon: const Icon(Icons.password),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(color: Colors.white))


                          ),

                        ),

                      ),
                      SizedBox(height: 23),
                      ElevatedButton(
                        child: Text("Submit"),
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10.0),
                            fixedSize: Size(150, 50),
                            textStyle: TextStyle(color: Color(0xFFF5F5F5), fontSize: 19, fontWeight: FontWeight.w700,),
                            primary: Colors.grey,
                            onPrimary: Colors.white,
                            elevation: 15,
                            shadowColor: Colors.grey,
                            shape: StadiumBorder()
                        ),

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
