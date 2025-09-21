import 'package:db_with_provider_usin_mvvm/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class LocationController extends ChangeNotifier {
  
Placemark? placemark;

bool isError=false;
String error='';


Future<bool> getLocation()async{
try {
 var placemarkData= await LocationService.getCurrentLocation();
 placemark=placemarkData;
 notifyListeners();
 return true;
} catch (e) {
  isError=true;
  error=e.toString();
  notifyListeners();
  return false;
}

}



}