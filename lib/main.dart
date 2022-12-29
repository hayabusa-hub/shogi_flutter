import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:english_words/english_words.dart';
// import 'package:english_words/english_words.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // runApp(const MyApp());
  runApp(const MaterialApp(home: MyApp() ,));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => MyBoardPage();

  // @override
  // Widget build(BuildContext context) {
  //
  //   return MaterialApp(
  //     title: 'Flutter Material Design',
  //     theme: ThemeData(
  //       // primarySwatch: Colors.blue,
  //     ),
  //
  //     home: MyBoardPage(),
  //
  //   );
  //   }
}

class MyBoardPage extends State<MyApp> {
  // MyBoardPage(this.b);
  // String game_board =
  //     "234565432"
  //     "080000070"
  //     "111111111"
  //     "000000000"
  //     "000000000"
  //     "000000000"
  //     "111111111"
  //     "070000080"
  //     "234565432";
  // int _counter = 0;
  String gameBoardStr = '';
  int beforePos = -1;
  List<String> gameBoard = [];
  // String b = '';

  void _updateBoard(pos) {
    String piece = gameBoard[pos];
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      //gameBoard[beforePos] = "0";
      if(-1 == beforePos){
        if (gameBoard[pos] != '0'){
          beforePos = pos;
        }
      }
      else{
        gameBoard[pos] = gameBoard[beforePos];
        gameBoard[beforePos] = '0';
        beforePos = -1;
      }

    });
  }

  MyBoardPage(){
    beforePos = -1;
    gameBoardStr =
      "234565432"
      "080000070"
      "111111111"
      "000000000"
      "000000000"
      "000000000"
      "111111111"
      "070000080"
      "234565432";
    int length = gameBoardStr.length;
    for (int i = 0; i < length; i++){
      gameBoard.add(gameBoardStr[i]);
    }
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('越前の神'),
      ),
      body: Container(
        color: Colors.yellow,
        width: double.infinity,
        height: double.infinity,
        // decoration: BoxDecoration(
        //   border: Border.all(),
        // ),
        child: Column(
          children: [
            for (int col = 0; col < 9; col++)...{
              Row(
                children: [
                  for (int row = 0; row < 9; row++)...{
                    Container(
                      width: 50,
                      height: 50,
                      // color: Colors.red,
                      child: Center(
                          child: MaterialButton(
                              onPressed: () {
                                // ボタンを押したときに呼ばれるコードを書く
                                _updateBoard(col*9 + row);
                              },
                              // child: Text(kindOfPiece(gameBoard[col*9 + row]))
                            child: Image.asset(
                              getImagePath(gameBoard[col*9 + row], true),
                              errorBuilder: (c, o, s) {
                                return Container(
                                  // Icons.error,
                                  // color: Colors.red,
                                );
                              },
                            )
                          )
                      ),
                    )
                  },
                ],
              ),
            },
          ],
        ),
      ),
    );
  }
}

String getImagePath(String piece, bool selfTurnFlg){

  if ('0' == piece){
    return '';
  }

  String ret = 'images/';
  if (false == selfTurnFlg){
    ret += 'opp_';
  }
  ret += '$piece.png';

  return ret;
}

String kindOfPiece(String board){
  String ret = '';

  switch(board){
    case '0':
      ret = '';
      break;
    case '1':
      ret = '歩';
      break;
    case '2':
      ret = '香';
      break;
    case '3':
      ret = '桂';
      break;
    case '4':
      ret = '銀';
      break;
    case '5':
      ret = '金';
      break;
    case '6':
      ret = '玉';
      break;
    case '7':
      ret = '角';
      break;
    case '8':
      ret = '飛';
      break;
    default:
      debugPrint("【異常系】： 不正な文字が含まれています $board");
      break;
  }
  return ret;
}

String replaceStr(String str, int index, String rep){
  String ret = '';

  int length = str.length;
  for(int i = 0; i < length; i++){
    if(i != index){
      ret += str[i];
    }
    else{
      ret += rep;
    }
  }
  return ret;
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // final wordPair = WordPair.random();
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times(ボタンを押した回数):',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
