import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'main.dart';

class res extends StatefulWidget {
  const res({super.key});

  @override
  State<res> createState() => _resState();
}

class Tt_item {
  String PERIO;
  String ITRT_CNTNT;
  Tt_item({required this.ITRT_CNTNT, required this.PERIO});
}

String ind = "1";
String ind2 = "2";
List a = ["", "", "", "", "", "", ""];

class _resState extends State<res> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () async {
              try {
                print(ind2);
                var dN = DateTime.now();
                var dS = DateFormat("yyMMdd").format(dN).toString();
                print(dS);
                var url =
                    "https://open.neis.go.kr/hub/mealServiceDietInfo?ATPT_OFCDC_SC_CODE=Q10&SD_SCHUL_CODE=8490243&MLSV_YMD=$dS&KEY=d2a8ab309d3146298d48386b6a80f274&Type=json";
                var response = await http.get(Uri.parse(url));
                String jsonData = response.body;
                List vv = jsonDecode(jsonData)['mealServiceDietInfo'][1]["row"];
                if (vv[0]["MMEAL_SC_NM"] == "중식") {
                  a[0] = "없음";
                  a[1] = vv[0]['DDISH_NM'];
                  a[2] = vv[1]['DDISH_NM'];
                } else {
                  a[0] = vv[0]['DDISH_NM'];
                  a[1] = vv[1]['DDISH_NM'];
                  a[2] = vv[2]['DDISH_NM'];
                }

                print(a[0]);
                setState(() {});
              } on Exception catch (e) {
                print('url 정보 불러오기 실패');
              }
            },
            child: Text("급식표 불러오기")),
        SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 40,
                ),
                Container(
                  width: 300,
                  height: 300,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("조식", style: TextStyle(fontSize: 30)),
                        Text(
                          a[0].toString().replaceAll('<br/>', '\n'),
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 300,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("중식", style: TextStyle(fontSize: 30)),
                        Text(
                          a[1].toString().replaceAll('<br/>', '\n'),
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 300,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("석식", style: TextStyle(fontSize: 30)),
                        Text(
                          a[2].toString().replaceAll('<br/>', '\n'),
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
