import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../utils/common_utils.dart';

enum DatabaseTable { product, users }

class FirebaseService {
  late FirebaseDatabase firebaseRef;
  late FirebaseAuth firebaseAuth;

  Future<void> init() async {
    firebaseRef = FirebaseDatabase.instance;
    firebaseAuth = FirebaseAuth.instance;
  }

  Future<String> storeProduct({
    required String tableName,
    required String dataId,
    required String productName,
    required String productPrice,
    required String quantity,
    required String description,
    required String totalPrice,
  }) async {
    final database = firebaseRef.ref("$tableName/$dataId");
    try {
      await database.set({
        "product_name": productName,
        "product_price": productPrice,
        "quantity": quantity,
        "description": description,
        "totalPrice": totalPrice
      });
      return 'success';
    } catch (e) {
      dPrint("failed to store data into Firebase:$e");
      return 'failed';
    }
  }

  Future<Map<String, dynamic>?> fetchProducts() async {
    Map<String, dynamic>? responseMessage;
    try {
      final database = firebaseRef.ref();
      final snapshot = await database.child('product').get();
      if (snapshot.exists) {
        final jsonData = jsonEncode(snapshot
            .value); //this will convert the row response into proper json format
        responseMessage = jsonDecode(jsonData) as Map<String, dynamic>;
      } else {
        dPrint('No data available.');
      }
      return responseMessage;
    } catch (e) {
      dPrint('failed to fetch data :$e');
      return responseMessage;
    }
  }

  //
  // Future<void> updateData({required String databaseTableName,required String updateIn})async{
  //
  //   // Get a key for a new Post.
  //   final newPostKey =
  //       FirebaseDatabase.instance.ref().child('posts').push().key;
  //
  //   // Write the new post's data simultaneously in the posts list and the
  //   // user's post list.
  //   final Map<String, Map> updates = {};
  //   updates['/posts/$newPostKey'] = postData;
  //   updates['/user-posts/$uid/$newPostKey'] = postData;
  //
  //   return FirebaseDatabase.instance.ref().update(updates);
  //
  // }

  Future<String> checkAuthStateChange() async {
    String respond = '';
    firebaseAuth.authStateChanges().listen((User? user) {
      dPrint('userDetail:$user');
      if (user == null) {
        dPrint('User is currently signed out!');
        respond = 'loggedOut';
      } else {
        dPrint('User is signed in!');
        respond = 'loggedIn';
      }
    });
    return respond;
  }

  Future<String> createAccount({
    required String userEmail,
    required String password,
  }) async {
    String responseMessage = '';
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: userEmail,
        password: password,
      );
      dPrint("signUpEmailPasswordRespond:$credential");
      responseMessage = 'success';
      return responseMessage;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        dPrint('The password provided is too weak.');
        responseMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        dPrint('The account already exists for that email.');
        responseMessage = 'The account already exists for that email.';
      }
      return responseMessage;
    } catch (e) {
      responseMessage = 'failed to create account';
      dPrint('Exception while creating account:$e');
      return responseMessage;
    }
  }

  Future<String> loginUserWithEmail({
    required String userEmail,
    required String password,
  }) async {
    String loginResponse = '';
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: userEmail,
        password: password,
      );
      dPrint('loginNewUserRespond:$credential');
      return loginResponse = 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        dPrint('No user found for that email.');
        loginResponse = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        dPrint('Wrong password provided for that user.');
        loginResponse = 'Wrong password provided for that user';
      }
      return loginResponse;
    }
  }
}
