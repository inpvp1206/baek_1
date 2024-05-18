import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';

class cs extends StatefulWidget {
  const cs({super.key});

  @override
  State<cs> createState() => _csState();
}

class _csState extends State<cs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ct(),
          nm(),
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      ),
    );
  }
}

class nm extends StatefulWidget {
  const nm({super.key});

  @override
  State<nm> createState() => _nmState();
}

var _uem = "";
var _uen = "";

class _nmState extends State<nm> {
  void sm() {
    FocusScope.of(context).unfocus();
    FirebaseFirestore.instance
        .collection("chat")
        .add({"name": _uen, "string": _uem, "time": Timestamp.now()});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "이름", border: OutlineInputBorder()),
                onChanged: (value) {
                  setState(() {
                    _uen = value;
                  });
                },
              ),
            ),
          ),
          Expanded(
              child: TextField(
            decoration:
                InputDecoration(labelText: "채팅", border: OutlineInputBorder()),
            onChanged: (value) {
              setState(() {
                _uem = value;
              });
            },
          )),
          IconButton(
            onPressed: _uem.trim().isEmpty || _uen.trim().isEmpty
                ? null
                : () {
                    sm();
                  },
            icon: Icon(Icons.send),
            color: thh.primaryColor,
          )
        ],
      ),
    );
  }
}

class ct extends StatelessWidget {
  const ct({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('chat')
              .orderBy("time", descending: true)
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              reverse: true,
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.8,
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
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.docs[index]["name"],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              " - ${snapshot.data!.docs[index]["string"]}",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
