// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:untitled/predict.dart';
import 'package:untitled/help.dart';
import 'package:untitled/count.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);


   @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Builder(
        builder: (context) =>
        Scaffold(
          backgroundColor: const Color(0xff9FE3DA),
      appBar: AppBar(
        elevation: 30,
        title: const Text('Radicalization Tracker',style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xff24536C),
        actions: const [
          Icon(Icons.search)
        ],
        actionsIconTheme: const IconThemeData(
          size: 30,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(2000), bottomRight: Radius.circular(1000)),

        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(160),
          child: SizedBox(),
        ),
      ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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

                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Rq())
                        );
                      },

                      child: const Text('Count RQ',style: TextStyle(color: Colors.white),),
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

                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  PredModel())
                      );
                    },

                    child: const Text('Help',style: TextStyle(color: Colors.white),),
                  ),
                ),


              ],
            ),

      ),
        ),
        ),
    );
}



}


