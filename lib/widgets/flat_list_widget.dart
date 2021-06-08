import 'package:flutter/cupertino.dart';
import 'package:http_demo/models/flat.dart';
import 'package:http_demo/widgets/flat_list_row.dart';

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
    return Column(
      children: [
        SizedBox(height: 10,),
        SizedBox(
          height: 500,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(widget.flats.length, (index){
                  return FlatListRowWidget(widget.flats[index]);
            }),
          ),
        ),
      ],
    );
  }

}