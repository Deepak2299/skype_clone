import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:skype_clone/resources/firebase_method.dart';
import 'package:skype_clone/models/message.dart';
import 'package:skype_clone/models/user.dart';
import 'package:skype_clone/provider/image_upload_provider.dart';

class FirebaseRepository {
  FirebaseMethods _firebaseMethod = FirebaseMethods();

  Future<FirebaseUser> getCurrentUser() => _firebaseMethod.getCurrentUser();

  Future<User> getUserDetails() => _firebaseMethod.getUserDetails();

  Future<FirebaseUser> signIn() => _firebaseMethod.signIn();

  Future<bool> authenticateuser(FirebaseUser user) =>
      _firebaseMethod.authenticateUser(user);

  Future<void> addDataToDB(FirebaseUser user) =>
      _firebaseMethod.addDataToDB(user);

  Future<void> signOut() => _firebaseMethod.signOut();

  Future<List<User>> fetchAllUsers(FirebaseUser user) =>
      _firebaseMethod.fetchAllUsers(user);

  Future<void> addMessageToDb(Message message, User sender, User receiver) =>
      _firebaseMethod.addMessageToDb(message, sender, receiver);

  void uploadImage(
          {@required File image,
          @required String receiverId,
          @required String senderId,
          // ignore: non_constant_identifier_names
          @required ImageUploadProvider imageUploadProvider}) =>
      _firebaseMethod.uploadImage(
          image, receiverId, senderId, imageUploadProvider);
}
