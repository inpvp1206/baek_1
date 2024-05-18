import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'main.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';

class cal extends StatefulWidget {
  const cal({super.key});

  @override
  State<cal> createState() => _calState();
}

class Event {
  final DateTime date;
  final String name;
  Event({required this.name, required this.date});
}

List? hp;
String ind = "1";
String ind2 = "2";
int? ic = 0;
String? t1 = "";
String? t2 = "";
String sh = "";

class _calState extends State<cal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
        ),
        SizedBox(
          child: ElevatedButton(
              onPressed: () async {
                try {
                  print(ind2);
                  var dN = DateTime.now();
                  var dS4 = DateFormat("yyyy").format(dN).toString();
                  print(dS4);
                  var url =
                      "https://open.neis.go.kr/hub/SchoolSchedule?ATPT_OFCDC_SC_CODE=Q10&SD_SCHUL_CODE=8490243&AA_YMD=$dS4&KEY=d2a8ab309d3146298d48386b6a80f274&Type=json&pSize=300";
                  var response = await http.get(Uri.parse(url));
                  String jsonData = response.body;
                  hp = jsonDecode(jsonData)['SchoolSchedule'][1]["row"];
                  print(hp);
                  ic = hp?.length;
                  setState(() {});
                } on Exception catch (e) {
                  print('url 정보 불러오기 실패');
                }
              },
              child: Text("학사일정 불러오기")),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: TextField(
            decoration: InputDecoration(
              hintText: "일정 검색",
              border: OutlineInputBorder(),
            ),
            cursorColor: thh.primaryColorLight,
            onChanged: (value) {
              sh = value;
              print(sh);
              setState(() {});
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: ListView.builder(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            itemCount: ic,
            itemBuilder: (context, index) {
              var y = hp![index]['AA_YMD'].toString().trim();
              y = y.substring(0, 4) +
                  "/" +
                  y.substring(4, 6) +
                  "/" +
                  y.substring(6, 8);
              if (hp![index]['EVENT_NM'].toString().contains("방학") |
                  hp![index]['EVENT_NM'].toString().contains("토요")) {
                return SizedBox();
              } else {
                if (sh.isNotEmpty &&
                    !hp![index]['EVENT_NM'].toString().contains(sh)) {
                  return SizedBox();
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 30),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: thh.primaryColorLight,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: thh.primaryColorLight,
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (hp != null)
                              Text(
                                y,
                                style: TextStyle(fontSize: 20),
                              ),
                            if (hp != null)
                              Text(
                                hp![index]['EVENT_NM'].toString().trim(),
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }
            },
          ),
        )
      ],
    );
  }
}
