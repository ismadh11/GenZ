// ignore_for_file: unused_local_variable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User; // لتجنب التعارض
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Loginuser.dart';
import '../create account/org.dart';
import '../service/firestoreOrg.dart';
import '../service/firestoreuser.dart';
import '../view_model/Event_model.dart';
import '../view_model/org_model.dart';
import '../view_model/user_model.dart';
import '../widget_Org/control_home.dart';

class Authviewmodel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late String email, password, avatar, address, name;
  late String title, description, event_type, upload_image;
  late Timestamp end_time, start_time;
  late int required_number;
  late GeoPoint Latitude;
  late List<String> image_url;
  late double age, phone;
  late String url;
  Rx<User?> user = Rx<User?>(null);
  Rx<Org?> org = Rx<Org?>(null);
  final FirebaseAuth auth = FirebaseAuth.instance;

  String get userEmail => user.value?.email ?? 'No user logged in';

  void signUpWithEmailAndPassword() async {
    try {
      if (email.isEmpty || password.isEmpty) {
        Get.snackbar(
          "Signup Error",
          "Please enter both email and password.",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.red,
          backgroundColor: Colors.white,
        );
        return;
      }

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.offAll(const controll_home_org());
    } on FirebaseAuthException catch (e) {
      String errorMessage = "An unexpected error occurred";
      if (e.code == 'user-not-found') {
        errorMessage = "No user found with this email. Please sign up.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Incorrect password. Please try again.";
      } else if (e.code == 'invalid-email') {
        errorMessage =
            "The email address is invalid. Please enter a valid email.";
      }

      Get.snackbar(
        "Signup Error",
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.red,
        backgroundColor: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Signup Error",
        "An unexpected error occurred: $e",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.red,
        backgroundColor: Colors.white,
      );
    }
  }

  void createUserWithEmailAndPassword() async {
    try {
      if (email.isEmpty || password.isEmpty || name.isEmpty || phone == 0.0) {
        Get.snackbar(
          "Signup Error",
          "Please fill in all fields.",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.red,
          backgroundColor: Colors.white,
        );
        return;
      }

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await Firestoreuser().addUserToFireStore(UserModel(
        userId: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: name,
        age: age,
        password: password,
        phone: phone,
      ));

      final supabase = Supabase.instance.client;
      final response = await supabase.from('users').insert({
        'user_id': userCredential.user!.uid,
        'email': userCredential.user!.email,
        'password': password,
        'name': name,
        'age': age,
        'phone': phone,
      }).select();
      print(response.printError); // طباعة الخطأ إذا كان موجودًا
      print(response.printError);
      print('Data synced with Supabase successfully!');

      Get.offAll(CreateUser());
    } catch (e) {
      print(e);
      Get.snackbar(
        "Signup Error Create account",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.red,
        backgroundColor: Colors.white,
      );
    }
  }

  EventModel defaultEvent = EventModel(
    userId:
        'default_event_id', // يمكن تعيين هذا كمعرف افتراضي أو من قاعدة البيانات
    title: 'Default Event',
    description: 'This is the default event for the organization.',
    start_time: Timestamp.now(),
    end_time: Timestamp.now(),
    required_number: 10,
    image_url: [],
    Latitude: const GeoPoint(0.0, 0.0),
    event_type: 'General',
    phone: 1234567890,
    upload_image: '',
  );
  void createOrgWithEmailAndPassword() async {
    try {
      if (email.isEmpty || password.isEmpty || name.isEmpty || phone == 0.0) {
        Get.snackbar(
          "Signup Error",
          "Please fill in all fields.",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.red,
          backgroundColor: Colors.white,
        );
        return;
      }

      await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((Org) async {
        DocumentReference eventDoc = await FirebaseFirestore.instance
            .collection('events')
            .add(defaultEvent.toJson());
        await FirestoreOrg().addUserToFireStore(Firestoreorg(
          userid: Org.user!.uid,
          email: Org.user!.email!,
          name: name,
          password: password,
          phone: phone,
          url: url,
          address: "",
          role: "org",
          defaultEventId: eventDoc.id,
        ));
        final supabase = Supabase.instance.client;
        final response = await supabase.from('organizations').insert({
          'userid': Org.user!.uid,
          'email': Org.user!.email!,
          'name': name,
          'password': password,
          'phone': phone,
          'url': url,
          'address': "",
          'role': "org",
        }).select();
        print(response.printError); // طباعة الخطأ إذا كان موجودًا
        print(response.printError);
        print('Data synced with Supabase successfully!');
      });
      Get.offAll(CreateUser());
    } catch (e) {
      print(e);
      Get.snackbar("Signup Error create account", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.red,
          backgroundColor: Colors.white);
    }
  }
}
