import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:flutter_svg/flutter_svg.dart";

class hall extends StatefulWidget {
  const hall({super.key});

  @override
  State<hall> createState() => _fs();
}

String hall_img = "images/h1.png";

String mainbd_img = "images/d.png";
String subbd_img = "images/1f.png";

class _fs extends State<hall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('시청각실 & 음악실'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("1층"),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text("2층"),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text("3층"),
                ),
              ];
            },
            icon: Icon(Icons.layers),
            onSelected: (value) {
              if (value == 0) {
                hall_img = "images/h1.png";
                setState(() {});
              } else if (value == 1) {
                hall_img = "images/h2.png";
                setState(() {});
              } else if (value == 2) {
                hall_img = "images/h3.png";
                setState(() {});
              }
            },
          )
        ],
      ),
      body: InteractiveViewer(
        child: Center(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              hall_img,
              width: 1000,
              height: 1000,
            ),
          ],
        )),
      ),
    );
  }
}

class mainbd extends StatefulWidget {
  const mainbd({super.key});

  @override
  State<mainbd> createState() => _mainbdState();
}

class _mainbdState extends State<mainbd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('본관'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("1층"),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text("2층"),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text("3층"),
                ),
              ];
            },
            icon: Icon(Icons.layers),
            onSelected: (value) {
              if (value == 0) {
                mainbd_img = "images/d.png";
                setState(() {});
              } else if (value == 1) {
                mainbd_img = "images/e.png";
                setState(() {});
              } else if (value == 2) {
                mainbd_img = "images/c.png";
                setState(() {});
              }
            },
          )
        ],
      ),
      body: InteractiveViewer(
        child: Center(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              mainbd_img,
              width: 1500,
              height: 1500,
            ),
          ],
        )),
      ),
    );
  }
}

class subbd extends StatefulWidget {
  const subbd({super.key});

  @override
  State<subbd> createState() => _subbdState();
}

class _subbdState extends State<subbd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('별관'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("1층"),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text("2층"),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text("3층"),
                ),
                PopupMenuItem<int>(
                  value: 3,
                  child: Text("4층"),
                ),
              ];
            },
            icon: Icon(Icons.layers),
            onSelected: (value) {
              if (value == 0) {
                subbd_img = "images/1f.png";
                setState(() {});
              } else if (value == 1) {
                subbd_img = "images/2f.png";
                setState(() {});
              } else if (value == 2) {
                subbd_img = "images/3f.png";
                setState(() {});
              } else if (value == 3) {
                subbd_img = "images/4f.png";
                setState(() {});
              }
            },
          )
        ],
      ),
      body: InteractiveViewer(
        child: Center(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              subbd_img,
              width: 1000,
              height: 1000,
            ),
          ],
        )),
      ),
    );
  }
}
