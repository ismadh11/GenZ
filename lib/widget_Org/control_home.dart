import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/Home_view_model.dart';


class controll_home_org extends GetWidget<HomeViewModel> {
  const controll_home_org({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Scaffold(
        body: controller.currentScreen2,
        bottomNavigationBar: bottomNavigationBar2(),
      ),
    );
  }
}

Widget bottomNavigationBar2() {
  final FirebaseAuth auth2 = FirebaseAuth.instance;
  return GetBuilder<HomeViewModel>(
    init: HomeViewModel(),
    builder: (controller) => Stack(
      children: [
        // خلفية التدرج اللوني
        Container(
          height: 70, // نفس ارتفاع الـ BottomNavigationBar
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(71, 136, 124, 176),
                Color.fromARGB(48, 194, 130, 27),
                Color.fromARGB(55, 251, 134, 0),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        // الـ BottomNavigationBar
        BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text("Home"),
              ),
              label: "",
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Image/home-05.png',
                  fit: BoxFit.contain,
                  width: 30,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text("Event"),
              ),
              label: "",
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Image/Calendar_duotone_line.png',
                  fit: BoxFit.contain,
                  width: 30,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text("Add"),
              ),
              label: "",
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Image/server-02.png',
                  fit: BoxFit.contain,
                  width: 30,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text("Organization"),
              ),
              label: "",
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Image/server-02.png',
                  fit: BoxFit.contain,
                  width: 30,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text("User"),
              ),
              label: "",
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Image/User_scan_duotone_line.png',
                  fit: BoxFit.contain,
                  width: 30,
                ),
              ),
            ),
          ],
          currentIndex: controller.navigatorValue,
          onTap: (index) async {
            controller.changeSelectedValue_org(index);

          //   if (controller.navigatorValue == 2) {
          //     try {
          //       User? currentUser = FirebaseAuth.instance.currentUser;
          //       if (currentUser != null) {
          //         // جلب بيانات المنظمة بناءً على معرف المستخدم
          //         DocumentSnapshot orgDoc = await FirebaseFirestore.instance
          //             .collection('Orgnaization')
          //             .doc(currentUser.uid)
          //             .get();

          //         if (orgDoc.exists) {
          //           // إنشاء حدث افتراضي وربطه بالمنظمة
          //           EventModel defaultEvent = EventModel(
          //             userId: currentUser.uid,
          //             title: 'Default Event for Organization',
          //             description:
          //                 'This is an event associated with the organization.',
          //             start_time: Timestamp.now(),
          //             end_time: Timestamp.now(),
          //             required_number: 20,
          //             image_url: [], // إضافة الصور إذا لزم الأمر
          //             Latitude: const GeoPoint(0.0, 0.0),
          //             event_type: 'General',
          //             phone:
          //                 orgDoc['phone'], // جلب رقم الهاتف من بيانات المنظمة
          //             upload_image: '', // رابط الصورة المرفقة مع الحدث
          //           );

          //           // إضافة الحدث إلى Firestore
          //           DocumentReference eventDoc = await FirebaseFirestore
          //               .instance
          //               .collection('events')
          //               .add(defaultEvent.toJson());

          //           // تحديث معرّف الحدث في وثيقة المنظمة
          //           await FirebaseFirestore.instance
          //               .collection('Orgnaization')
          //               .doc(currentUser.uid)
          //               .update({'defaultEventId': eventDoc.id});

          //           Get.snackbar(
          //             'Success',
          //             'Default event created and linked to the organization.',
          //             snackPosition: SnackPosition.BOTTOM,
          //             backgroundColor: Colors.green,
          //             colorText: Colors.white,
          //           );
          //         } else {
          //           Get.snackbar(
          //             'Error',
          //             'Organization data not found.',
          //             snackPosition: SnackPosition.BOTTOM,
          //             backgroundColor: Colors.red,
          //             colorText: Colors.white,
          //           );
          //         }
          //       } else {
          //         Get.snackbar(
          //           'Error',
          //           'No user is currently logged in.',
          //           snackPosition: SnackPosition.BOTTOM,
          //           backgroundColor: Colors.red,
          //           colorText: Colors.white,
          //         );
          //       }
          //     } catch (e) {
          //       Get.snackbar(
          //         'Error',
          //         'Failed to create event: $e',
          //         snackPosition: SnackPosition.BOTTOM,
          //         backgroundColor: Colors.red,
          //         colorText: Colors.white,
          //       );
          //     }
          //   }
           },
          elevation: 0,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.transparent,
        ),
      ],
    ),
  );
}
