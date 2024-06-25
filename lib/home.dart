import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'timetable.dart';
import 'profile.dart';
import 'locate.dart';
import 'chart.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<IconData> data = [
    Icons.home,
    Icons.location_on_rounded,
    Icons.auto_graph_rounded,
    Icons.person,
    Icons.settings,
  ];

  Widget selectBody(BuildContext context) {
    if(selectedIndex == 0) {
      return option0(context);
    }
    else if(selectedIndex == 1) {
      return option1(context);
    }
    else if(selectedIndex == 2) {
      return option2(context);
    }
    else if(selectedIndex == 3) {
      return option3(context);
    }

    else {
      return const SizedBox(

      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      resizeToAvoidBottomInset: false,
      //start of background
      body: Stack(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height),
            width: (MediaQuery.of(context).size.width*0.5),
            color: Colors.black,
          ),
          Column(
            children: [
              Container(
                height: (MediaQuery.of(context).size.height * 0.3),
                width: (MediaQuery.of(context).size.width),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [
                      0.25,
                      0.5,
                      0.75,
                    ],
                    colors:[
                      Colors.black,
                      Colors.grey.shade800,
                      Colors.black,
                    ],
                  ),
                  borderRadius: const  BorderRadius.only(
                    bottomRight: Radius.circular(60),
                  ),
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height * 0.7),
                width: (MediaQuery.of(context).size.width),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(60),
                  ),
                ),
              )
            ],
          ),
          //end of background

          //start of header

          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                top: (MediaQuery.of(context).size.width * 0.15),
                left: (MediaQuery.of(context).size.width * 0.05),
              ),
              child: SizedBox(
                width: (MediaQuery.of(context).size.width * 0.85),
                height: (MediaQuery.of(context).size.height * 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                        AutoSizeText(
                            'Abhay Mohanan',
                            textScaleFactor: 1.2,
                            style: TextStyle(
                              color: Colors.white,
                            )
                        ),
                        AutoSizeText(
                            "20BCS001",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: Colors.white,
                            )
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: (MediaQuery.of(context).size.width * 0.25),
                        right: (MediaQuery.of(context).size.width * 0.05),
                      ),
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.12),
                        height: (MediaQuery.of(context).size.height * 0.12),
                        child: const CircleAvatar(
                          radius: 1,
                          foregroundImage: AssetImage('images/ProfPic.png'),
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ),
          ),

          //end of header

          //start of timetable
          selectBody(context),
          //end of timetable

          //start of bottom navigation bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
                child: SizedBox(
                  height: 70,
                  width: (MediaQuery.of(context).size.width*0.85),
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (ctx, i) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = i;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: (MediaQuery.of(context).size.width*0.17),
                        decoration: BoxDecoration(
                          borderRadius: i == 0 ? const BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)):
                          i == 4 ? const BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)): null,
                          gradient: i == selectedIndex
                              ? const LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.white
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                              : null,
                        ),
                        child: Icon(
                          data[i],
                          size: 35,
                          color: i == selectedIndex
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
