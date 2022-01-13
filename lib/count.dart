// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';

class Rq extends StatefulWidget {
  const Rq({Key? key}) : super(key: key);

  @override
  State<Rq> createState() => _Rq();
}

class _Rq extends State<Rq> {
  String uname ="";
  // var predValue = "";

  // @override
  // void initState() {
  //   super.initState();
  //   predValue = "click predict button";
  // }
  Future<String?> predictPrice(var body) async {
    var client = http.Client();
    var uri = Uri.parse("http://192.168.121.202:8080/predict");
    Map<String, String> headers = {"Content-type": "application/json"};
    String jsonString = json.encode(body);
    try {
      var resp = await client.post(uri, headers: headers, body: jsonString);
      //var resp=await http.get(Uri.parse("http://192.168.1.101:5000"));
      if (resp.statusCode == 200) {
        print("DATA FETCHED SUCCESSFULLY");
        var result = json.decode(resp.body);
        print(resp.body);
        return result["Radicalization Quotient"];
      }
    } catch (e) {
      print("EXCEPTION OCCURRED: $e");
      return null;
    }

  }
  // Future<void> predData() async {
  //   final interpreter = await Interpreter.fromAsset('model.tflite');
  //   // var input= [
  //   //   [9533.0, 105.0, 1695.0, 3736.0, 53404.0]
  //   // ];
  //   var input= "@narendramodi";
  //   var output = List.filled(1,0).reshape([1,1]);
  //   interpreter.run(input, output);
  //   print(output[0][0]);
  //
  //   this.setState(() {
  //     predValue = output[0][0].toString();
  //   });
  // }
  final items = ['Twitter','Reddit'];
  String? value;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Builder(
    builder: (context) =>
    Scaffold(
      appBar: AppBar(
          elevation: 30,
          title: const Text('Count Rq', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xff24536C),

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(2300), bottomRight: Radius.circular(800)),

        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(160),
          child: SizedBox(),
        ),
      ),
      backgroundColor: const Color(0xff9FE3DA),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 80,
            width: 400,
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(90))
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(130))
                ) ,
                prefixIcon: Icon(Icons.attribution_outlined),
                hintText: "Enter Username of a person",
                filled: true,
                fillColor: Colors.transparent,
                contentPadding: EdgeInsets.symmetric(vertical: 13.0)
              ),
                onChanged: (val) async => uname
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.only(left: 20,right: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(30)
              ),

              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: const Color(0xff9FE3DA),
                  hint: const Text('Choose Platforms'),
                  style: const TextStyle(
                    backgroundColor: Colors.transparent,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  alignment: AlignmentDirectional.topStart,
                  isExpanded: true,
                  value: value,
                  items: items.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(()=>this.value = value!),



                ),
              )

            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 30,
                  primary: const Color(0xff24536C),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)
                  )
              ),
              onPressed:  () async {
                var body = uname ;
                /*body=[
                    {"bedrooms": 3, "bathrooms": 1, "sqft_living": 1180, "sqft_lot": 5650, "floors": 1, "waterfront": 0, "view": 0, "condition": 3, "grade": 7, "sqft_above": 1180, "sqft_basement": 0, "lat": 47.5112, "long": -122.257, "sqft_living15": 1340, "sqft_lot15": 5650}
                  ];*/
                print(body);
                var resp = await predictPrice(body);
                _onBasicAlertPressed(context, resp);
              },
              child: const Text('Submit',style: TextStyle(color: Colors.white),),
            ),
          ),
          // SizedBox(height: 12),
          // Text(
          //   "Predicted value :  $predValue ",
          //   style: TextStyle(color: Colors.lightBlueAccent , fontSize: 23),
          // ),

        ],

      ),
    ),


),

    );


  }


}
DropdownMenuItem<String> buildMenuItem (String item) =>
    DropdownMenuItem(value : item,
      child: Text(
        item,
        style: const TextStyle(fontSize: 16),
      ),
    );
_onBasicAlertPressed(context, resp) {
  Alert(context: context, title: "Predicted RQ", desc: resp.show());
}
