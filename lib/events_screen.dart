import 'package:flutter/material.dart';
import 'package:genz_2024/Repetitions/all_events.dart';
import 'package:genz_2024/Repetitions/events_foryou.dart';

import 'widget_event/popular.dart';


class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFebe9f2),
                Color(0xFFfaead6),
              ],
            ),
          ),
          child: const DefaultTabController(
            initialIndex: 1,
            length: 3,
            child: Column(
              children: [
                TabBar(
                  indicatorColor: Color.fromARGB(255, 33, 40, 113),
                  labelColor: Color.fromARGB(255, 33, 40, 113),
                  unselectedLabelColor: Color(0xff5A5D62),
                  tabs: [
                    Tab(
                      text: "For you",
                    ),
                    Tab(
                      text: "All Events",
                    ),
                    Tab(
                      text: "Popular",
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      EventsForYou(),
                      AllEvents(),
                      PopularEvents(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
