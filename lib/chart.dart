import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';

Widget option2(BuildContext context){
  final streamChart = FirebaseFirestore.instance.collection('attendanceStatistics').snapshots(includeMetadataChanges: true);
  return Padding(
    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.45),
    child: Center(
      child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              StreamBuilder(
                  stream: streamChart,
                  builder: (context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot){
                    if (snapshot.hasError){
                      return const Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting){
                      return const Text('loading');
                    }
                    if (snapshot.data == null){
                      return const Text('No enough data');
                    }
                    List listChart = snapshot.data!.docs.map((e){
                      return{
                        'domain':e.data()['subject'],
                         'measure': e.data()['attendance'],
                      };

                    }).toList();

                    return AspectRatio(
                      aspectRatio: 16/9,
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.85),
                        height: (MediaQuery.of(context).size.height * 0.65),
                        child: DChartBar(
                          data : [
                            {
                              'id':'attendanceStatistics',
                              'data': listChart,
                            },
                          ],
                          axisLineColor : Colors.black,
                          barColor: (barData, index , id) => Colors.grey,
                          showBarValue: true,

                        ),
                      ),
                    );
                  },
              ),
            ],
          ),
    ),
  );
}

