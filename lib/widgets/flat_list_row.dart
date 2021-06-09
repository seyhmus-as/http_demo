import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_demo/models/flat.dart';

class FlatListRowWidget extends StatelessWidget{//less olması demek ekranda state gerek yok
  Flat flat;

  FlatListRowWidget(this.flat);

  @override
  Widget build(BuildContext context) {
    return buildFlatItemCard(context);
  }

  Widget buildFlatItemCard(BuildContext context) {//ekrana ait bilgiler lazımsa context
    return InkWell(
      child: Card(
        child : Column(
          children: <Widget>[
            Container(
              child: Image.network("https://media.istockphoto.com/photos/europe-modern-complex-of-residential-buildings-picture-id1165384568?k=6&m=1165384568&s=612x612&w=0&h=EFKcg8aMptUfpr5TCFTyYnHEdDmUL0tmsOT3TWeXl8I="),
            height: 130.0,
              width: MediaQuery.of(context).size.width/2,
            ),
            Text(flat.priceOfRent.toString(),style: TextStyle(fontSize: 25),),
          ],
        ),
      ),
    );
  }
}