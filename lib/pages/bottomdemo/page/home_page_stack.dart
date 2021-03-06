import 'package:flutter/material.dart';
import 'package:flutter_material_demo/pages/bottomdemo/simpleTab/tab_stateful_page.dart';
///方案一Stack+Offstage实现状态保存
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final  titleStr="Stack+Offstage";
  final  photoStr="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554821553942&di=6be93e131cedb5036c92c065cc873d2d&imgtype=0&src=http%3A%2F%2Fpic.51yuansu.com%2Fpic3%2Fcover%2F00%2F61%2F50%2F586e242f0a3d8_610.jpg";
  int _tabIndex=0;
  final pages=<Widget>[
    new Tab1Page(key:Key("1"),centerText: "1",color: Colors.red),
    new Tab1Page(key:Key("2"),centerText: "2",color: Colors.amber),
    new Tab1Page(key:Key("3"),centerText: "3",color: Colors.deepPurpleAccent)
  ];
  void _pressLeft(){
    print("点击第一按钮");
  }

  @override
  void initState() {
    super.initState();
    _tabIndex=0;

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(titleStr),
        //左上角的得图标
        leading: Image(image: NetworkImage(photoStr,scale: 0.05)),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),onPressed:_pressLeft
          )
          ,
          IconButton(icon: Icon(Icons.account_balance_wallet),onPressed: (){
            print("点击第二按钮");

          }
          )
          ,
          IconButton(icon: Icon(Icons.ac_unit),onPressed: (){
            print("点击第三按钮");
          },)
        ],
      ),
      //方案一Stack+Offstage
      body: Stack(
        children: <Widget>[
          _callCurrentPage(0),
          _callCurrentPage(1),
          _callCurrentPage(2)

        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(items:<BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.adb),title: Text("tab1")),
        BottomNavigationBarItem(icon: Icon(Icons.add_a_photo),title: Text("tab2")),
        BottomNavigationBarItem(icon: Icon(Icons.description),title: Text("tab3"))

      ]
      ,
        //tab选中颜色
        fixedColor: Colors.red,
        onTap:_tapTab ,
        currentIndex: _tabIndex,
        selectedFontSize: 12.0,
      ),
    );
  }

  void _tapTab(int value) {
      setState(() {
        _tabIndex=value;
      });
  }

  Widget _callCurrentPage(int index){
    return Offstage(
        offstage: this._tabIndex != index,
        child: TickerMode(enabled: this._tabIndex == index, child: pages[index]));
  }
}