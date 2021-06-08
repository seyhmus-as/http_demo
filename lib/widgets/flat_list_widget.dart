import 'package:flutter/cupertino.dart';
import 'package:http_demo/models/flat.dart';

// ignore: must_be_immutable
class FlatListWidget extends StatefulWidget{
  List<Flat> flats = new List<Flat>();

  FlatListWidget(List<Flat> flats){
    this.flats = flats;
  }

  @override
  State<StatefulWidget> createState() {
    return FlatListWidgetState();
  }
}

class FlatListWidgetState extends State<FlatListWidget> {

  @override
  Widget build(BuildContext context) {
    return buildFlatList(context);
  }

  Widget buildFlatList(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(widget.flats.length, (index){
              return Text(widget.flats[index].apartmentId.toString(), style: TextStyle(fontSize: 45),);
        }),
      ),
    );
  }

}