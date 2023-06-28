import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Map',
      home:googleMapExample() ,
    );
  }
}
class googleMapExample extends StatefulWidget {
  const googleMapExample({Key? key}) : super(key: key);

  @override
  State<googleMapExample> createState() => _googleMapExampleState();
}

class _googleMapExampleState extends State<googleMapExample> {
  Set<Marker> markers = {};
  var mapMarker;
  GoogleMapController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setMarketIcon();
    getCurrentLocation();
  }
  Future<void> setMarketIcon() async {
      mapMarker = await BitmapDescriptor.defaultMarker;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GoogleMap(
         markers:markers,
        mapType: MapType.normal,
       initialCameraPosition:CameraPosition(
          target: LatLng(
              21.2119548,72.8846043
          ),
           zoom: 15,
        ),
     onMapCreated:(controller) {
     },
      ),
    );
  }

  Future<void> getCurrentLocation() async {
   var permission = await Geolocator.checkPermission();
    if(permission==LocationPermission.denied || permission==LocationPermission.deniedForever){
      print('location permission disable');
      permission = await Geolocator.requestPermission();
    }
    Position? position;
    if(permission==LocationPermission.always || permission==LocationPermission.whileInUse){
       position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best
      );
    }

      print('latitude : ${position!.latitude} longitude : ${position!.longitude}');

    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude,position.longitude);
    var address = '${placemarks[0].name},'
        '${placemarks[0].street },'
        '${placemarks[0].subLocality},'
        '${placemarks[0].locality},'
        '${placemarks[0].administrativeArea},'
        '${placemarks[0].country}';
    _controller?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(position.latitude,position.longitude),zoom: 15)
    ));

   setState(() {
     markers.add(Marker(markerId:MarkerId('1'),
       icon:mapMarker,
       position:LatLng(position!.latitude,position!.longitude),
       infoWindow: InfoWindow(title: address)
     ),);
   });
  }
}
