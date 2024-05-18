import "package:dropdown_textfield/dropdown_textfield.dart";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter/widgets.dart";
import "package:flutter_svg/flutter_svg.dart";

import "about_hall.dart";
import 'main.dart';

DropDownValueModel val = DropDownValueModel(name: "1-1", value: "m_3");

class bmap extends StatefulWidget {
  const bmap({super.key});

  @override
  State<bmap> createState() => _bmapState();
}

String map_image = "images/def.png";

class _bmapState extends State<bmap> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
          child: InteractiveViewer(
            child: Center(
              child: Image.asset(map_image),
            ),
          ),
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                  child: DropDownTextField(
                dropDownList: [
                  DropDownValueModel(name: "1-1", value: "m_3"),
                  DropDownValueModel(name: "1-2", value: "m_3"),
                  DropDownValueModel(name: "1-3", value: "m_3"),
                  DropDownValueModel(name: "1-4", value: "s_2"),
                  DropDownValueModel(name: "1-5", value: "s_2"),
                  DropDownValueModel(name: "1-6", value: "s_2"),
                  DropDownValueModel(name: "1-7", value: "s_2"),
                  DropDownValueModel(name: "1학년실", value: "s_2"),
                  DropDownValueModel(name: "2-1", value: "s_3"),
                  DropDownValueModel(name: "2-2", value: "s_3"),
                  DropDownValueModel(name: "2-3", value: "s_3"),
                  DropDownValueModel(name: "2-4", value: "s_4"),
                  DropDownValueModel(name: "2-5", value: "s_4"),
                  DropDownValueModel(name: "2-6", value: "s_4"),
                  DropDownValueModel(name: "2-7", value: "s_4"),
                  DropDownValueModel(name: "2학년실", value: "s_4"),
                  DropDownValueModel(name: "3-1", value: "m_2"),
                  DropDownValueModel(name: "3-2", value: "m_2"),
                  DropDownValueModel(name: "3-3", value: "m_2"),
                  DropDownValueModel(name: "3-4", value: "m_2"),
                  DropDownValueModel(name: "3-5", value: "m_2"),
                  DropDownValueModel(name: "3-6", value: "m_2"),
                  DropDownValueModel(name: "3-7", value: "m_2"),
                  DropDownValueModel(name: "3학년실", value: "m_2"),
                  DropDownValueModel(name: "학생생활 안전부", value: "m_1"),
                  DropDownValueModel(name: "방송실", value: "m_1"),
                  DropDownValueModel(name: "교무실", value: "m_1"),
                  DropDownValueModel(name: "보건실", value: "m_1"),
                  DropDownValueModel(name: "남교사 휴게실", value: "m_1"),
                  DropDownValueModel(name: "행정실", value: "m_1"),
                  DropDownValueModel(name: "교장실", value: "m_1"),
                  DropDownValueModel(name: "기술가정실", value: "m_1"),
                  DropDownValueModel(name: "학습도움실2", value: "m_1"),
                  DropDownValueModel(name: "전환교육실", value: "m_1"),
                  DropDownValueModel(name: "미술실", value: "m_1"),
                  DropDownValueModel(name: "정독실", value: "m_2"),
                  DropDownValueModel(name: "더오름터", value: "m_2"),
                  DropDownValueModel(name: "진학상담실", value: "m_2"),
                  DropDownValueModel(name: "수학실", value: "m_3"),
                  DropDownValueModel(name: "여교사 휴게실", value: "m_3"),
                  DropDownValueModel(name: "학생자치실, 학부모 회의실", value: "m_3"),
                  DropDownValueModel(name: "AI 교실", value: "m_3"),
                  DropDownValueModel(name: "갈릴레이실", value: "m_3"),
                  DropDownValueModel(name: "리소스 센터", value: "m_3"),
                  DropDownValueModel(name: "보어실", value: "m_3"),
                  DropDownValueModel(name: "융합과학부", value: "m_3"),
                  DropDownValueModel(name: "왓슨앤 크릭실", value: "m_3"),
                  DropDownValueModel(name: "진로진학 상담실", value: "m_3"),
                  DropDownValueModel(name: "별숲도서관", value: "s_1"),
                  DropDownValueModel(name: "학습도움실 2", value: "s_1"),
                  DropDownValueModel(name: "대강의실1", value: "s_2"),
                  DropDownValueModel(name: "토론실(2층)", value: "s_2"),
                  DropDownValueModel(name: "더 배움터", value: "s_3"),
                  DropDownValueModel(name: "문서고", value: "s_3"),
                  DropDownValueModel(name: "대강의실2", value: "s_3"),
                  DropDownValueModel(name: "대강의실3", value: "s_4"),
                  DropDownValueModel(name: "토론실(4층)", value: "s_4"),
                  DropDownValueModel(name: "시청각실", value: "h_1"),
                  DropDownValueModel(name: "제2 외국어실", value: "h_2"),
                  DropDownValueModel(name: "교육실", value: "h_2"),
                  DropDownValueModel(name: "악기보관실", value: "h_3"),
                  DropDownValueModel(name: "음악실", value: "h_3"),
                ],
                enableSearch: true,
                textFieldDecoration: InputDecoration(
                  hintText: "교실 선택",
                ),
                searchDecoration: InputDecoration(
                  hintText: "검색하기",
                ),
                validator: (value) {},
                onChanged: (alffd) {
                  if (alffd.runtimeType == DropDownValueModel) {
                    print(alffd);
                    val = alffd;
                    if (val.value.toString().toString() == "m_1") {
                      search_color = Colors.green.shade100;
                      search_map = mainbd();
                      mainbd_img = "images/d.png";
                      map_image = "images/m.png";
                    } else if (val.value.toString() == "m_2") {
                      search_color = Colors.green.shade100;
                      search_map = mainbd();
                      mainbd_img = "images/e.png";
                      map_image = "images/m.png";
                    } else if (val.value.toString() == "m_3") {
                      search_color = Colors.green.shade100;
                      search_map = mainbd();
                      mainbd_img = "images/c.png";
                      map_image = "images/m.png";
                    } else if (val.value.toString() == "s_1") {
                      search_color = Colors.yellow.shade100;
                      search_map = subbd();
                      subbd_img = "images/1f.png";
                      map_image = "images/s.png";
                    } else if (val.value.toString() == "s_2") {
                      search_color = Colors.yellow.shade100;
                      search_map = subbd();
                      subbd_img = "images/2f.png";
                      map_image = "images/s.png";
                    } else if (val.value.toString() == "s_3") {
                      search_color = Colors.yellow.shade100;
                      search_map = subbd();
                      subbd_img = "images/3f.png";
                      map_image = "images/s.png";
                    } else if (val.value.toString() == "s_4") {
                      search_color = Colors.yellow.shade100;
                      search_map = subbd();
                      subbd_img = "images/4f.png";
                      map_image = "images/s.png";
                    } else if (val.value.toString() == "h_1") {
                      search_color = Colors.purple.shade100;
                      search_map = hall();
                      hall_img = "images/h1.png";
                      map_image = "images/h.png";
                    } else if (val.value.toString() == "h_2") {
                      search_color = Colors.purple.shade100;
                      search_map = hall();
                      hall_img = "images/h2.png";
                      map_image = "images/h.png";
                    } else if (val.value.toString() == "h_3") {
                      search_color = Colors.purple.shade100;
                      search_map = hall();
                      hall_img = "images/h3.png";
                      map_image = "images/h.png";
                    }
                  } else {
                    map_image = "images/def.png";
                  }

                  setState(() {});
                },
              )),
            )),
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: SizedBox(
            width: 100,
            height: 30,
            child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: search_color,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          child: search_map,
                          height: 500,
                        ),
                      );
                    },
                  );
                },
                child: Text("보러가기")),
          ),
        ),
      ],
    );
  }
}
