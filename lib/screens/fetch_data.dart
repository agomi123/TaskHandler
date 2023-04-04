import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebaseconcept/screens/update_record.dart';
import 'package:flutter/material.dart';

import 'insert_data.dart';
 
class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);
 
  @override
  State<FetchData> createState() => _FetchDataState();
}
 
class _FetchDataState extends State<FetchData> {
  
  Query dbRef = FirebaseDatabase.instance.ref().child('Students');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Students');
  void f() {
      print('f');
      Navigator.push(context, MaterialPageRoute(builder: (_) => InsertData()));
    }
  Widget listItem({required Map student}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
         color: Color.fromARGB(255, 248, 246, 246),
          boxShadow:[
            BoxShadow(
              color: Color.fromARGB(31, 134, 134, 134),
              spreadRadius: 1.5,
              blurRadius: 1.4,
            )
          ] 
      ),
     
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            student['name'],
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            student['age'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            student['salary'],
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateRecord(studentKey: student['key'])));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  reference.child(student['key']).remove();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[700],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
          title: const Text("Task Handler"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout_outlined),
              tooltip: 'LogOut',
              onPressed: () {},
            ), //IconButton
          ], //<Widg
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          elevation: 0.00,
          backgroundColor: Color.fromARGB(255, 230, 142, 0),
        ), //AppBar
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
 
            Map student = snapshot.value as Map;
            student['key'] = snapshot.key;
 
            return listItem(student: student);
 
          },
        ),
      )
      ,
      floatingActionButton: new FloatingActionButton(
          onPressed: f,
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ),
    );
  }
}