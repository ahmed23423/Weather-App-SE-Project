import 'package:firebase_auth/firebase_auth.dart';

class SignUpResponse {
  int? status, numOfNotification;
  String? message, id, fullName, mobile, email, link, verificationID;
  PhoneAuthCredential? credential;

  SignUpResponse(
      { this.email,
       this.id,
       this.link,
       this.message,
       this.fullName,
       this.numOfNotification,
       this.mobile,
       this.status,
       this.verificationID,
        this.credential
      });
}
