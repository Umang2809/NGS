import 'package:flutter/material.dart';


class Rq extends StatefulWidget {
  const Rq({Key? key}) : super(key: key);

  @override
  State<Rq> createState() => _Rq();
}

class _Rq extends State<Rq> {
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
            child: const TextField(
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
              onPressed: (){},

              child: const Text('Submit',style: TextStyle(color: Colors.white),),
            ),
          ),

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
