import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() {
  runApp(const MainApp());
  firebase();
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

void firebase() async {
  //삽입할 데이터
  final user = <String, dynamic>{
    "first": "nomad",
    "last": "Lovelace",
    "born": 54654,
    "timeStamp": Timestamp.now(),
  };

  //firebase 초기화 코드
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //firestore 가져오는 코드
  final db = FirebaseFirestore.instance;

  //데이터 삽입 코드
  db.collection("flutter_test").add(user).then((DocumentReference doc) =>
      print('DocumentSnapshot added with ID: ${doc.id}'));

  //데이터 출력 코드
  await db.collection("flutter_test").get().then((event) {
    for (var doc in event.docs) {
      print("test ${doc.id} => ${doc.data()}");
    }
  });
}

//UI
class _MainAppState extends State<MainApp> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  void onClicked() {
    setState(() {});
  }

  //setState() 는 아래에 build()를 다시 호출
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLageTitle() : const Text('nothing'),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyLageTitle extends StatefulWidget {
  const MyLageTitle({
    super.key,
  });

  @override
  State<MyLageTitle> createState() => _MyLageTitleState();
}

//StatefulWidget 은 life cycle
class _MyLageTitleState extends State<MyLageTitle> {
  //initState 메서드는 오직 한번만 호출됨
  //build 메서드 보다 앞에 있어야함
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');
  }

  //dispose 메서드는 무언가를 취소하는 곳
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
