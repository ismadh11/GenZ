import 'package:flutter/material.dart';
import 'events_container.dart';

class PopularEvents extends StatelessWidget {
  const PopularEvents({super.key});

  final List<EventContainer> events = const [
    EventContainer(
      imgPath: "assets/images/1.png",
      eventName: "رحلة للبحر",
      eventTime: "04 November",
    ),
    EventContainer(
      imgPath: "assets/images/2.png",
      eventName: "تعلم التصميم",
      eventTime: "25 November",
    ),
    EventContainer(
      imgPath: "assets/images/3.png",
      eventName: "تعامل مع الايرورز",
      eventTime: "04 October",
    ),
    EventContainer(
      imgPath: "assets/images/4.png",
      eventName: "المبيدات الحشرية",
      eventTime: "04 October",
    ),
    EventContainer(
      imgPath: "assets/images/5.png",
      eventName: "الطبيعة",
      eventTime: "04 October",
    ),
    EventContainer(
      imgPath: "assets/images/6.png",
      eventName: "برامج تلفازية",
      eventTime: "04 October",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          events[0],
          events[1],
          events[2],
          events[3],
          events[4],
          events[5],
        ],
      ),
    );
  }
}