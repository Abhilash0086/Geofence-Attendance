import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Mulish'),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDEDEDE),
      body: Stack(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height),
            width: (MediaQuery.of(context).size.width * 0.5),
            color: Colors.deepPurpleAccent[700],
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
                    colors: [
                      Colors.deepPurpleAccent.shade700,
                      Colors.deepPurpleAccent.shade400,
                      Colors.deepPurpleAccent.shade700,
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height * 0.7),
                width: (MediaQuery.of(context).size.width),
                decoration: const BoxDecoration(
                  color: Color(0xFFDEDEDE),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                  ),
                ),
              )
            ],
          ),
          Center(
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
                                  children: const [
                                    Text(
                                      'Monday',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '12/10/2002',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
