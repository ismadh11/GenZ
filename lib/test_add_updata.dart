import 'package:flutter/material.dart';
import 'Repetitions/all_events.dart';
import 'Repetitions/events_foryou.dart';
import 'Repetitions/grawer__list.dart';
import 'widget_event/popular.dart';


class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              SizedBox(
                height: screenHeight *
                    0.35, // تحديد المسافة المخصصة لـ HomePage2 داخل Drawer
                child: const HomePage2(),
              ),
            ],
          ),
        ),
        body: DefaultTabController(
          initialIndex: 1,
          length: 3,
          child: Column(
            children: [
              // إظهار HomePage2 فوق TabBar
              SizedBox(
                height: screenHeight * 0.05,
                child: const HomePage2(),
              ),

              const TabBar(
                indicatorColor: Color.fromARGB(255, 33, 40, 113),
                labelColor: Color.fromARGB(255, 33, 40, 113),
                unselectedLabelColor: Color(0xff5A5D62),
                tabs: [
                  Tab(text: "For you"),
                  Tab(text: "All Events"),
                  Tab(text: "Popular"),
                ],
              ),
              const Expanded(
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
    );
  }
}
