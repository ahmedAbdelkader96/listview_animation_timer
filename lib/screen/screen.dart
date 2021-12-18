import 'package:flutter/material.dart';
import 'package:listview_animation_timer/bloc/ListBloc.dart';
import 'package:listview_animation_timer/componets/ItemEffect.dart';


class Home extends StatefulWidget {
  _Home createState() => new _Home();
}

class _Home extends State<Home> {

  List<String> _list = ["Hey","that's", "the", "effect"].toList();
  Duration _duration = Duration(milliseconds: 300);

  Widget build(BuildContext context) {

    return new Scaffold(body: new Container(child:
    new Container(padding: EdgeInsets.all(10), height: MediaQuery.of(context).size.height, child:
    new ListViewEffect(duration: _duration, children: _list.map((s) => _buildWidgetExample(s)).toList())
    )
    ));
  }

  Widget _buildWidgetExample(String text){
    return new Container(
        decoration: BoxDecoration(color: Colors.deepPurpleAccent, borderRadius: BorderRadius.all(Radius.circular(20))), height: 100, width: double.infinity, margin: EdgeInsets.all(10),
        child: new Center(child: new Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)))
    );
  }

}






class ListViewEffect extends StatefulWidget {
  final Duration duration;
  final List<Widget> children;

  ListViewEffect({Key key, this.duration, this.children});
  _ListViewEffect createState() => new _ListViewEffect();
}

class _ListViewEffect extends State<ListViewEffect> {

  ListBloc _listBloc;

  initState(){
    _listBloc = new ListBloc();
    super.initState();
  }

  Widget build(BuildContext context) {

    _listBloc.startAnimation(widget.children.length, widget.duration);

    return new Scaffold(body: new Container(child:
    new Container(height: MediaQuery.of(context).size.height, child:
    new ListView.builder(scrollDirection: Axis.vertical, itemCount: widget.children.length, itemBuilder: (context, position){
      return new ItemEffect(child: widget.children[position], duration: widget.duration, position: position);
    })
    )
    ));
  }

  @override
  void dispose() {
    _listBloc.dispose();
    super.dispose();
  }
}