import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

Widget textObject(String text, int i) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: i == 0? 14: 12,
      color: i == 0 ? Colors.deepPurple: Colors.black,
    ),
  );
}

Widget option3(BuildContext context) {
  return Center(
    child: Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      color: Colors.black,
      child: SizedBox(
        child: Container(
            width: (MediaQuery.of(context).size.width * 0.8),
            height: (MediaQuery.of(context).size.height * 0.6),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                Center(
                  child: Image(
                    image: const AssetImage('images/ProfPic.png'),
                    width: (MediaQuery.of(context).size.width * 0.3),
                    height: (MediaQuery.of(context).size.width * 0.3),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          textObject('NAME:', 0),
                          textObject('Abhay Mohanan', 1)
                        ]
                      ),
                      const TableRow(
                        children: [
                          SizedBox(height: 16,),
                          SizedBox(height: 16,),
                        ]
                      ),
                      TableRow(
                          children: [
                            textObject('ROLL NO:', 0),
                            textObject('20BCS001', 1)
                          ]
                      ),
                      const TableRow(
                          children: [
                            SizedBox(height: 16,),
                            SizedBox(height: 16,),
                          ]
                      ),
                      TableRow(
                          children: [
                            textObject('DEPARTMENT:', 0),
                            textObject('Department of Computer Science and Engineering', 1)
                          ]
                      ),
                      const TableRow(
                          children: [
                            SizedBox(height: 16,),
                            SizedBox(height: 16,),
                          ]
                      ),
                      TableRow(
                          children: [
                            textObject('COURSE NAME:', 0),
                            textObject('B.E-Computer Science and Engineering', 1)
                          ]
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    ),
  );
}