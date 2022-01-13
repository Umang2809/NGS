// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class PredModel extends StatefulWidget {
  @override
  _PredModelState createState() => _PredModelState();
}

class _PredModelState extends State<PredModel> {
   double bed = 0,
      bath =0,
      sqftLiving = 0,
      sqftLot = 0,
      floors = 0;

  var predValue = "";

  @override
  void initState() {
    super.initState();
    predValue = "click predict button";
  }

  Future<void> predData() async {
    final interpreter = await Interpreter.fromAsset('predmodel.tflite');
    // var input= [
    //   [9533.0, 105.0, 1695.0, 3736.0, 53404.0]
    // ];
    var input= [
      [bed, bath, sqftLiving, sqftLot, floors]
    ];
    var output = List.filled(1, 0).reshape([1, 1]);
    interpreter.run(input, output);
    print(output[0][0]);

    this.setState(() {
      predValue = output[0][0].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "change the input values in code to get the prediction",
                style: TextStyle(fontSize: 16),
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter bedrooms',
              ),
              onChanged: (val) {
                bed = double.parse(val) ;
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter bathrooms',
              ),
              onChanged: (val) {
                bath = double.parse(val) ;
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter sqft of house',
              ),
              onChanged: (val) {
                sqftLiving = double.parse(val);
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter sqft (parking)',
              ),
              onChanged: (val) {
                sqftLot = double.parse(val);
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter floors',
              ),
              onChanged: (val) {
                floors = double.parse(val);
              },
            ),

            const SizedBox(height: 12),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                "predict",
                style: TextStyle(fontSize: 25),
              ),
              onPressed: predData,

            ),

            SizedBox(height: 12),
            Text(
              "Predicted value :  $predValue ",
              style: TextStyle(color: Colors.red, fontSize: 23),
            ),
          ],
        ),
      ),
    );
  }
}