import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http_demo/data/api/apartment_api.dart';
import 'package:http_demo/data/api/flat_api.dart';
import 'package:http_demo/models/apartment.dart';
import 'package:http_demo/models/flat.dart';
import 'package:http_demo/widgets/flat_list_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<StatefulWidget>  {
  List<Apartment> apartments = List<Apartment>();
  List<Widget> apartmentWidgets = List<Widget>();
  List<Flat> flats = List<Flat>();

  @override
  void initState() {
    getApartmentsFromApi();
    getFlats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Building Management",
          style: TextStyle(color: Colors.lightBlueAccent),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: apartmentWidgets,),
            ),
            FlatListWidget(flats),
          ],
        ),
      ),
    );
  }

  void getApartmentsFromApi() {
    ApartmentApi.getApartments().then((response) {
      setState(() {
        Iterable list = json.decode(utf8.decode(response.bodyBytes))["data"];
        this.apartments =
            list.map((apartment) => Apartment.fromJson(apartment)).toList();
        getApartmentWidgets();
      });
    });
  }

  List<Widget> getApartmentWidgets() {
    for (int i = 0; i < apartments.length; i++) {
      apartmentWidgets.add(getApartmentWidget(apartments[i]));
    }
    return apartmentWidgets;
  }

  Widget getApartmentWidget(Apartment apartment) {
    return ElevatedButton(
      child: Text(
        apartment.apartmentName,
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black)))),
      onPressed: () {
        getFlatsByApartmentId(apartment);
        },
    );
  }

  void getFlatsByApartmentId(Apartment apartment) {
    ApartmentApi.getApartmentsByFlatId(apartment.apartmentId).then((response) {
      setState(() {
        Iterable list = json.decode(utf8.decode(response.bodyBytes))["data"];
        this.flats = list.map((flat) => Flat.fromJson(flat)).toList();
      });
    });
  }
  void getFlats() {
    FlatApi.getFlats().then((response) {
      setState(() {
        Iterable list = json.decode(utf8.decode(response.bodyBytes))["data"];
        this.flats = list.map((flat) => Flat.fromJson(flat)).toList();
      });
    });
  }
}
