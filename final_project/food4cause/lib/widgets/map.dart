// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:food4cause/widgets/drawerWidget.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class Map1 extends StatelessWidget {
  Map1({Key? key}) : super(key: key);
  final List<Location> locations = [
    Location(
        name: "Christian Life Centre",
        address: "1030 Ravenscroft Road, Ajax",
        latlng: LatLng(43.8743443, -79.0561893),
        phone: "905-686-1411"),
    Location(
        name: "1 Hope International Foundation",
        address: "13 Atkinson Court, Ajax",
        latlng: LatLng(43.8604696, -79.017658),
        phone: "647-786-9998"),
    Location(
        name: "Salvation Army",
        address: "122 Hunt St, Ajax",
        latlng: LatLng(43.8466021, -79.0266891),
        phone: "905-427-7123"),
    Location(
        name: "Southside Worship Centre",
        address: "55 Emperor Street, Ajax",
        latlng: LatLng(43.8389008, -79.0137087),
        phone: "905-428-1985"),
    Location(
        name: "Abundant Life Gospel Centre",
        address: "17 Erie Street, Oshawa",
        latlng: LatLng(43.8779172, -78.8559237),
        phone: "905-433-1438"),
  ];
  final List<Location> locations2 = [
    Location(
        name: "Jeremy Community",
        address: "1030 Ravenscroft Road, Ajax",
        latlng: LatLng(43.8743443, -79.0561893),
        phone: "905-686-1411"),
    Location(
        name: "Brandon Community",
        address: "13 Atkinson Court, Ajax",
        latlng: LatLng(43.8604696, -79.017658),
        phone: "647-786-9998"),
    Location(
        name: "Fahad Community",
        address: "122 Hunt St, Ajax",
        latlng: LatLng(43.8466021, -79.0266891),
        phone: "905-427-7123"),
    Location(
        name: "Wabz Community",
        address: "55 Emperor Street, Ajax",
        latlng: LatLng(43.8389008, -79.0137087),
        phone: "905-428-1985"),
  ];
  final LatLng positionCoords = LatLng(43.8743443, -79.0561893);
  final MapController _mapController = MapController();
  final List<Marker> markerList = [];
  makeMarker(latlocation, Location location, MapController mapController) {
    return Marker(
        point: latlocation,
        builder: (ctx) => IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: ctx,
                  builder: (BuildContext context) {
                    mapController.move(location.latlng, 16);
                    return bottomSheet(location);
                  });
            },
            icon: const Icon(Icons.location_on),
            iconSize: 30.0,
            color: Colors.blueAccent));
  }

  @override
  Widget build(BuildContext context) {
    MapController _mapController = MapController();
    Widget myMap = map(context, _mapController, positionCoords, markerList);
    for (int i = 0; i < locations.length; i++) {
      markerList
          .add(makeMarker(locations[i].latlng, locations[i], _mapController));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Communities Near You"),
      ),
      body: myMap,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mapController.move(positionCoords, 10);
        },
        child: Icon(Icons.zoom_out_map),
      ),
    );
  }
}

Future<Position> _checkPermissions() async {
  LocationPermission permission;

  permission = await Geolocator.checkPermission();

  Geolocator.requestPermission();

  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);
}

Widget map(context, _mapController, positionCoords, markerList) {
  return FlutterMap(
    key: ValueKey(MediaQuery.of(context).orientation),
    mapController: _mapController,
    options: MapOptions(
        zoom: 10,
        center: positionCoords,
        onMapCreated: (c) {
          _mapController = c;
        }),
    layers: [
      TileLayerOptions(
          urlTemplate:
              "https://api.mapbox.com/styles/v1/wabzter/ckwook4mv06pl14rrdk4w9o9m/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoid2FienRlciIsImEiOiJja3dvb2RwcGYwNHR5Mm9xa2JicW9qdDk3In0.F0O1-F30D8xI8FYiEL-VkA",
          additionalOptions: {
            'accessToken':
                'pk.eyJ1Ijoid2FienRlciIsImEiOiJja3dvb2RwcGYwNHR5Mm9xa2JicW9qdDk3In0.F0O1-F30D8xI8FYiEL-VkA',
            'id': 'mapbox.mapbox-streets-v8'
          }),
      MarkerLayerOptions(markers: markerList),
    ],
  );
}

class Location {
  String name = "";
  String address = "";
  LatLng latlng;
  String phone = "";
  Location(
      {required this.name,
      required this.address,
      required this.latlng,
      required this.phone});
}

Widget bottomSheet(Location location) {
  return Column(
    children: [
      Container(
        height: 60,
        color: Colors.blueAccent,
        child: ListTile(
          title: Text(
            location.name,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              launch("tel://${location.phone}");
            },
            icon: Icon(Icons.call),
            color: Colors.blueAccent,
            iconSize: 35.0,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
            color: Colors.blueAccent,
            iconSize: 35.0,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.save),
            color: Colors.blueAccent,
            iconSize: 35.0,
          ),
        ],
      ),
      Divider(
        thickness: 1.5,
      ),
      Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text(location.address),
              leading: Icon(
                Icons.location_on,
                color: Colors.blueAccent,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
