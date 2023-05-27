import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
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
