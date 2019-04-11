
import 'package:flutter/material.dart';

class TopTabBarDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TopTabBarDemoState();
  }
}

class _TopTabBarDemoState extends State<TopTabBarDemo>{
  @override
  Widget build(BuildContext context) {
    return  getContainerWidget();
  }
  Widget getContainerWidget(){
      return Material(
        color:  Colors.deepPurpleAccent,
        child: Column(
            children: <Widget>[
              SafeArea(child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                height: 56.0,
                decoration: BoxDecoration(
                    color: Colors.green
                ),
              ),
                bottom: false,
              )
              ,Expanded(
                child: Container(
                  color: Colors.white,

                ),
              )
            ]
        ),
      );
  }
}
