import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<Position> _determinePosition() async {
  LocationPermission permission;

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
}

Future<GeoPoint> getLocFromDB() async {
  final data = await firestore.collection('geotag').get();
  GeoPoint gp = data.docs[0]['DAA Lab'];

  return gp;
}

late var initialPosition;

Future<Position> getPosition() async {
  initialPosition = await _determinePosition();
  return initialPosition;
}

double lat = 11.0775429; // => 11.0774613
double long = 76.9893338; // => 76.9896417

Widget option1(BuildContext context){
  late Future<GeoPoint> gp = getLocFromDB();

  return Center(
    child: FutureBuilder<Position>(
      future: getPosition(),
      builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
        if (snapshot.hasData) {
          Position p = snapshot.data as Position;
          if(p.latitude >= (lat - 0.00005) && p.latitude <= (lat + 0.00005) && p.longitude >= (long - 0.00005) && p.longitude <= (long + 0.0005)) {
            return Text(
              "Within range, ${p.latitude.toString()},${p.longitude.toString()}",
            );
          } else {
            return Text(
                "Out of range, ${p.latitude.toString()},${p.longitude.toString()}",
              );
          }
        } else {
          return const CircularProgressIndicator();
        }
      }
    ),
  );
}

/*
Center(
        child: FutureBuilder<GeoPoint> (
            future: gp,
            builder: (BuildContext context, AsyncSnapshot<GeoPoint> snapshot) {
              if(snapshot.hasData) {
                GeoPoint g = snapshot.data as GeoPoint;
                lat = g.latitude;
                long = g.longitude;
              }
              return const Text("GeoFencing");
            }
        ),
      ),
 */