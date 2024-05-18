import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'main.dart';

class ttable extends StatefulWidget {
  const ttable({super.key});

  @override
  State<ttable> createState() => _ttableState();
}

class Tt_item {
  String PERIO;
  String ITRT_CNTNT;
  Tt_item({required this.ITRT_CNTNT, required this.PERIO});
}

String ind = "1";
String ind2 = "2";
List a = ["", "", "", "", "", "", ""];

class _ttableState extends State<ttable> {
  Tt_item tt_item = new Tt_item(ITRT_CNTNT: '', PERIO: '');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              DropdownButton<String>(
                style: TextStyle(fontSize: 20, color: Colors.black),
                items: [
                  DropdownMenuItem(
                    value: "1",
                    child: Text("1학년"),
                  ),
                  DropdownMenuItem(
                    value: "2",
                    child: Text("2학년"),
                  ),
                  DropdownMenuItem(
                    value: "3",
                    child: Text("3학년"),
                  ),
                ],
                onChanged: (String? value) {
                  setState(() {
                    ind = value!;
                  });
                },
                value: ind,
              ),
              SizedBox(
                width: 30,
              ),
              DropdownButton<String>(
                style: TextStyle(fontSize: 20, color: Colors.black),
                items: [
                  DropdownMenuItem(
                    value: "1",
                    child: Text("1반"),
                  ),
                  DropdownMenuItem(
                    value: "2",
                    child: Text("2반"),
                  ),
                  DropdownMenuItem(
                    value: "3",
                    child: Text("3반"),
                  ),
                  DropdownMenuItem(
                    value: "4",
                    child: Text("4반"),
                  ),
                  DropdownMenuItem(
                    value: "5",
                    child: Text("5반"),
                  ),
                  DropdownMenuItem(
                    value: "6",
                    child: Text("6반"),
                  ),
                  DropdownMenuItem(
                    value: "7",
                    child: Text("7반"),
                  ),
                ],
                onChanged: (String? value) {
                  setState(() {
                    ind2 = value!;
                  });
                },
                value: ind2,
              ),
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      print(ind2);
                      var dN = DateTime.now();
                      var dS = DateFormat("yyMMdd").format(dN).toString();
                      var url =
                          "https://open.neis.go.kr/hub/hisTimetable?ATPT_OFCDC_SC_CODE=Q10&SD_SCHUL_CODE=8490243&ALL_TI_YMD=$dS&GRADE=$ind&CLASS_NM=$ind2&KEY=d2a8ab309d3146298d48386b6a80f274&Type=json";
                      var response = await http.get(Uri.parse(url));
                      String jsonData = response.body;
                      List vv = jsonDecode(jsonData)['hisTimetable'][1]["row"];

                      a[0] = jsonDecode(jsonData)['hisTimetable'][1]["row"][0]
                          ["ITRT_CNTNT"];
                      a[1] = jsonDecode(jsonData)['hisTimetable'][1]["row"][1]
                          ["ITRT_CNTNT"];
                      a[2] = jsonDecode(jsonData)['hisTimetable'][1]["row"][2]
                          ["ITRT_CNTNT"];
                      a[3] = jsonDecode(jsonData)['hisTimetable'][1]["row"][3]
                          ["ITRT_CNTNT"];
                      a[4] = jsonDecode(jsonData)['hisTimetable'][1]["row"][4]
                          ["ITRT_CNTNT"];

                      if (vv.length == 7) {
                        a[6] = jsonDecode(jsonData)['hisTimetable'][1]["row"][6]
                            ["ITRT_CNTNT"];
                        a[5] = jsonDecode(jsonData)['hisTimetable'][1]["row"][5]
                            ["ITRT_CNTNT"];
                      } else if (vv.length == 6) {
                        a[6] = "";
                        a[5] = jsonDecode(jsonData)['hisTimetable'][1]["row"][5]
                            ["ITRT_CNTNT"];
                      } else if (vv.length == 5) {
                        a[5] = "";
                        a[6] = "";
                      }

                      print(a[0]);
                      setState(() {});
                    } on Exception catch (e) {
                      print('url 정보 불러오기 실패');
                    }
                  },
                  child: Text("시간표 불러오기"))
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
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
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    "1교시 : ${a[0]}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "2교시 : ${a[1]}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "3교시 : ${a[2]}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "4교시 : ${a[3]}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "5교시 : ${a[4]}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "6교시 : ${a[5]}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "7교시 : ${a[6]}",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
