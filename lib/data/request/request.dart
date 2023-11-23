import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class CompleteSignUpRequest{
  String password;
  String email;
  String fullName;
  String mobile;
  PhoneAuthCredential credential;
  CompleteSignUpRequest({
    required this.password,
    required this.mobile,
    required this.email,
    required this.fullName,
    required this.credential
});
}

class LoginDetailsRequest{
  String email;
  String password;
  LoginDetailsRequest(this.email,this.password);
}


