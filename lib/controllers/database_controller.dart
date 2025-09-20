import 'dart:developer';

import 'package:db_with_provider_usin_mvvm/models/gallery_model.dart';
import 'package:db_with_provider_usin_mvvm/repository/database_repository.dart';
import 'package:flutter/material.dart';

class DatabaseController extends ChangeNotifier {
  
final DatabaseRepository databaseRepository;

DatabaseController({required this.databaseRepository});

List<GalleryModel> galleryModelList=[];
bool isLoading= false;
String showDialog='no';
bool isError= false;
String error= '';

Future<void> getImages()async{
try {
  isLoading=true;
showDialog='loading';
  notifyListeners();

  galleryModelList= await databaseRepository.getImages();
  showDialog='loaded';
  log(showDialog);
  isLoading=false;
notifyListeners();
} catch (e) {
  isLoading=false;
  isError=true;
  error= e.toString();
  notifyListeners();
}
}


// Future<bool> insertImage(GalleryModel galleryModel)async{
// try {
//   isLoading=true;
//   notifyListeners();
//   await databaseRepository.insertImage(galleryModel);
//   isLoading=false;
//   notifyListeners();
//   return true;
// } catch (e) {
//    isLoading=false;
//   error= e.toString();
//   notifyListeners();
//   return false;
// }
// }

Future<bool> deleteImage(GalleryModel galleryModel )async{
try {
  isLoading=true;
  notifyListeners();
 await databaseRepository.deleteImage(galleryModel);
 await getImages();
  isLoading=false;
  notifyListeners();
  return true;
} catch (e) {
   isLoading=false;
  error= e.toString();
  notifyListeners();
  return false;
}
}



Future<bool> updateImage(GalleryModel galleryModel )async{
try {
  isLoading=true;
  notifyListeners();
 await databaseRepository.updateImage(galleryModel);
  isLoading=false;
  notifyListeners();
  return true;
} catch (e) {
   isLoading=false;
  error= e.toString();
  notifyListeners();
  return false;
}
}



}