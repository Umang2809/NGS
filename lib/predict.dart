// ignore_for_file: prefer_const_constructors
// ignore_for_file: avoid_print

import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

class Predict extends StatefulWidget {
  const Predict({Key? key}) : super(key: key);

  @override
  State<Predict> createState() => _Predict();

}
class _Predict extends State<Predict> {
  late int bed,
      bath,
      sqftLiving,
      sqftLot,
      floors,
      waterfront,
      view,
      condition,
      grade,
      sqftAbove,
      basement,
      sqftLiving15,
      sqftLot15;
  late double lat, long;

//METHOD TO PREDICT PRICE
  Future<String?> predictPrice(var body) async {
    var client = http.Client();
    var uri = Uri.parse("http://065d-2409-4041-2d81-f8f2-30f0-21c0-8d35-5441.ngrok.io/predict");
    Map<String, String> headers = {"Content-type": "application/json"};
    String jsonString = json.encode(body);
    try {
      var resp = await client.post(uri, headers: headers, body: jsonString);
      // var respo=await http.get(Uri.parse("http://065d-2409-4041-2d81-f8f2-30f0-21c0-8d35-5441.ngrok.io/predict"));
      if (resp.statusCode == 200) {
        print("DATA FETCHED SUCCESSFULLY");
        var result = json.decode(resp.body);
        print(result["prediction"]);
        return result["prediction"];
      }
    } catch (e) {
      print("EXCEPTION OCCURRED: $e");
      return null;
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Builder(
        builder: (context) =>
            Scaffold(
              backgroundColor: const Color(0xff9FE3DA),
              body: Column(
                children: [
              Container(
              margin: EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Enter bedrooms',
                        ),
                        onChanged: (val) {
                          bed = int.parse(val);
                        },
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Enter bathrooms',
                        ),
                        onChanged: (val) {
                          bath = int.parse(val);
                        },
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Enter sqft of house',
                        ),
                        onChanged: (val) {
                          sqftLiving = int.parse(val);
                        },
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Enter sqft (parking)',
                        ),
                        onChanged: (val) {
                          sqftLot = int.parse(val);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter floors',
                        ),
                        onChanged: (val) {
                          floors = int.parse(val);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter waterfront',
                        ),
                        onChanged: (val) {
                          waterfront = int.parse(val);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter view',
                        ),
                        onChanged: (val) {
                          view = int.parse(val);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter condition',
                        ),
                        onChanged: (val) {
                          condition = int.parse(val);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter grade',
                        ),
                        onChanged: (val) {
                          grade = int.parse(val);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter sqft above',
                        ),
                        onChanged: (val) {
                          sqftAbove = int.parse(val);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter sqft basement',
                        ),
                        onChanged: (val) {
                          basement = int.parse(val);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter lat',
                        ),
                        onChanged: (val) {
                          lat = double.parse(val);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter long',
                        ),
                        onChanged: (val) {
                          long = double.parse(val);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter sqftLiving15',
                        ),
                        onChanged: (val) {
                          sqftLiving15 = int.parse(val);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter sqftLot15',
                        ),
                        onChanged: (val) {
                          sqftLot15 = int.parse(val);
                        },
                      ),
                      FlatButton(
                        color: Colors.blue,
                        onPressed: () async {
                          var body = [
                            {
                              "bedrooms": bed,
                              "bathrooms": bath,
                              "sqft_living": sqftLiving,
                              "sqft_lot": sqftLot,
                              "floors": floors,
                              "waterfront": waterfront,
                              "view": view,
                              "condition": condition,
                              "grade": grade,
                              "sqft_above": sqftAbove,
                              "sqft_basement": basement,
                              "lat": lat,
                              "long": long,
                              "sqft_living15": sqftLiving15,
                              "sqft_lot15": sqftLot15
                            }
                          ];
                          body=[
                    {"bedrooms": 3, "bathrooms": 1, "sqft_living": 1180, "sqft_lot": 5650, "floors": 1, "waterfront": 0, "view": 0, "condition": 3, "grade": 7, "sqft_above": 1180, "sqft_basement": 0, "lat": 47.5112, "long": -122.257, "sqft_living15": 1340, "sqft_lot15": 5650}
                  ];
                          print(body);
                          var resp = await predictPrice(body);
                          _onBasicAlertPressed(context, resp);
                        },
                        child: Text("Get price"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
  ]
      ),
    ),
    ),
    );
  }
}

//function from rflutter pkg to display alert
_onBasicAlertPressed(context, resp) {
  Alert(context: context, title: "Predicted price", desc: resp).show();
}

