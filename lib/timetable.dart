import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

late String day = "NULL";
late String date = "NULL";

Future<Map<String,List>> getData() async {
  DateTime dateToday = DateTime.now();
  String curdate = dateToday.toString().substring(0,10);


  final data = await firestore.collection('courses').where('date', isEqualTo: curdate).get();
  Map<String,List> tt = {};

  day = (data.docs[0]['day']);
  date = (data.docs[0]['date']);
  List course = (data.docs[0]['course']);
  List time = (data.docs[0]['time']);
  List faculty = (data.docs[0]['faculty']);
  List room = (data.docs[0]['room']);
  tt = {'course': course, 'time': time, 'faculty': faculty, 'room': room};

  return tt;
}

Widget option0(BuildContext context) {
  late Future<Map<String,List>> timetable = getData();
  return Center(
    child: Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      color: Colors.black,
      child: SizedBox(
        width: (MediaQuery.of(context).size.width * 0.85),
        height: (MediaQuery.of(context).size.height * 0.65),
        child: Column(
          children: [
            Container(
                width: (MediaQuery.of(context).size.width * 0.85),
                height: (MediaQuery.of(context).size.height * 0.65),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: Image(
                              image:
                              const AssetImage('images/calendar.png'),
                              width: (MediaQuery.of(context).size.width *
                                  0.08),
                              height: (MediaQuery.of(context).size.height *
                                  0.08),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  day,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  date,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder<Map<String,List>>(
                        future: timetable,
                        builder: (BuildContext context, AsyncSnapshot<Map<String,List>> snapshot) {
                          Map<String, List> ttmap = snapshot.data as Map<String,List>;

                          return Expanded(
                            child: ListView.separated(
                              itemCount: ttmap['course']!.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(
                                left: (MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.1),
                                right: (MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.1),
                              ),
                              separatorBuilder: (ctx, j) =>
                                  SizedBox(
                                    height: (MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.02),
                                  ),
                              itemBuilder: (ctx, j) =>
                                  Container(
                                    height: (MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.1),
                                    width: (MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.7),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50)),
                                      color: Colors.black,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Center(
                                          child: AutoSizeText(
                                            ttmap['course']![j],
                                            maxFontSize: 12,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: AutoSizeText(
                                            ttmap['time']![j],
                                            maxFontSize: 12,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: AutoSizeText(
                                            ttmap['faculty']![j],
                                            maxFontSize: 12,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: AutoSizeText(
                                            ttmap['room']![j],
                                            maxFontSize: 12,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            ),
                          );
                        }
                    ),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height * 0.05),
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    ),
  );
}