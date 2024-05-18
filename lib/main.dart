import "package:baek_1/cal.dart";
import "package:baek_1/chat.dart";
import "package:baek_1/restaurant.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter/widgets.dart";
import "package:flutter_svg/flutter_svg.dart";
import 'time_table.dart';
import 'package:intl/date_symbol_data_local.dart';
import "about_hall.dart";
import 'bmap.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

ThemeData thh = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff206d00)));
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initializeDateFormatting().then((_) => runApp(MaterialApp(
        home: MyWidget(),
        theme: thh,
      )));
}

int cp = 0;
PageController pc = PageController();
int selected_page = 0;

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

Color search_color = Colors.green.shade100;
Widget search_map = mainbd();

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BAEK")),
        backgroundColor: thh.primaryColor.withOpacity(0.3),
      ),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          pc.animateToPage(value,
              duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
        },
        selectedItemColor: thh.primaryColor,
        unselectedItemColor: thh.focusColor,
        currentIndex: selected_page,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "학교 지도",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: "시간표",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: "급식표",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "학사일정",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "채팅",
          )
        ],
      ),
      body: PageView(
        children: [bmap(), ttable(), res(), cal(), cs()],
        controller: pc,
        onPageChanged: (value) {
          selected_page = value;
          setState(() {});
        },
      ),
    );
  }
}
