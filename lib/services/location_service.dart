import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService{


static Future<Placemark> getCurrentLocation()async{

LocationPermission permission =await Geolocator.checkPermission();

if (permission == LocationPermission.denied) {
  await Geolocator.requestPermission();
}

var position= await Geolocator.getCurrentPosition();

List<Placemark> placemark =await placemarkFromCoordinates(position.latitude, position.longitude);

return placemark[0];

}




}