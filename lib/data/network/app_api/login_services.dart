import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../request/request.dart';

abstract class LoginFunctionsClient {
  Future<String> signUp({required CompleteSignUpRequest completeSignUpRequest});
  Future<String> login({required LoginDetailsRequest loginDetailsRequest});
}

abstract class LoginServicesClientImpl implements LoginFunctionsClient {
  @override
  Future<String> signUp({required CompleteSignUpRequest completeSignUpRequest}) async {
    return '';
  }

  @override
  Future<String> login({required LoginDetailsRequest loginDetailsRequest}) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: loginDetailsRequest.email, password: loginDetailsRequest.password);
    return userCredential.user!.uid;
  }
}
