import 'dart:async';

import 'package:bokshaulforwarder/Model/order_detail_json.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({Key? key, required this.order}) : super(key: key);
  final OrderDetail order;

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<GoogleMapController> mapController = Completer();
  final Set<Marker> markers = new Set();
  late var gudang;
  late var port;
  late LatLng latLngPort, latLngGudang, center;
  late LatLngBounds bound;
  @override
  void initState() {
    // TODO: implement initState
    gudang = widget.order.coordinateGudang.split(',');
    port = widget.order.coordinatePort.split(',');
    latLngPort = LatLng(double.parse(port[0]), double.parse(port[1]));
    latLngGudang = LatLng(double.parse(gudang[0]), double.parse(gudang[1]));
    center = LatLng(
      (latLngPort.latitude + latLngGudang.latitude) / 2,
      (latLngPort.longitude + latLngGudang.longitude) / 2,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true, //enable Zoom in, out on map
        initialCameraPosition: CameraPosition(
          //innital position in map
          target: center, //initial position
          zoom: 10,
          //initial zoom level
        ),
        markers: getmarkers(), //markers to show on map
        mapType: MapType.normal, //map type
        onMapCreated: (GoogleMapController controller) {
          mapController.complete(controller);
        },
      ),
    );
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(
      () {
        markers.add(Marker(
          //add first marker
          markerId: MarkerId("Gudang/Consignee"),
          position: LatLng(
            double.parse(gudang[0]),
            double.parse(gudang[1]),
          ), //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: widget.order.namaGudang,
            snippet: widget.order.addressGudang,
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueAzure), //Icon for Marker
        ));

        markers.add(
          Marker(
            //add second marker
            markerId: MarkerId("Port"),
            position: LatLng(
              double.parse(port[0]),
              double.parse(port[1]),
            ), //position of marker
            infoWindow: InfoWindow(
              //popup info
              title: widget.order.namaPort,
              snippet: widget.order.addressPort,
            ),
            icon: BitmapDescriptor.defaultMarker, //Icon for Marker
          ),
        );
      },
    );

    return markers;
  }
}
