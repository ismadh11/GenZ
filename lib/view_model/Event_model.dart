import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EventModel {
  String userId;
  final GeoPoint Latitude;
  final String event_type;
  final int phone;
  final String upload_image;
  final String title;
  final String description;
  final Timestamp start_time;
  final Timestamp end_time;
  final int required_number;
  final List<String> image_url; // Use List instead of Array

  // تعيين القيم الافتراضية
  EventModel({
    this.userId = '',
    this.title = '',
    this.description = '',
    required this.start_time,
    required this.end_time,
    required this.required_number,
    required this.image_url,
    required this.Latitude,
    required this.event_type,
    required this.phone,
    required this.upload_image,
  });

  factory EventModel.fromJson(Map<String, dynamic> map) {
    return EventModel(
      userId: map['userId'] ?? '', // Handle null cases
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      start_time:
          map['start_time'] ?? Timestamp.now(), // Default to current time
      end_time: map['end_time'] ?? Timestamp.now(),
      required_number: map['required_number'] ?? 0,
      image_url:
          List<String>.from(map['image_url'] ?? []), // Default empty list
      Latitude: map['Latitude'] ?? const GeoPoint(0.0, 0.0),
      event_type: map['event_type'] ?? '',
      phone: map['phone'] ?? 0,
      upload_image: map['upload_image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'title': title,
      'description': description,
      'start_time': start_time,
      'end_time': end_time,
      'required_number': required_number,
      'image_url': image_url,
      'Latitude': Latitude,
      'event_type': event_type,
      'phone': phone,
      'upload_image': upload_image,
    };
  }

  Future<void> addEvent(EventModel event) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        event.userId =
            currentUser.uid; // Set the userId from the current logged-in user
        await FirebaseFirestore.instance
            .collection('Events')
            .add(event.toJson());
      } else {
        print('No user is logged in.');
      }
    } catch (e) {
      print('Error adding event: $e');
    }
  }
}
