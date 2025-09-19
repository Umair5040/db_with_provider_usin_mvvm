import 'dart:developer';

import 'package:db_with_provider_usin_mvvm/models/gallery_model.dart';
import 'package:db_with_provider_usin_mvvm/services/database_service.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseRepository {
  
final DatabaseService databaseService;

DatabaseRepository({required this.databaseService});


Future<List<GalleryModel>> getImages()async{
try {
  return await databaseService.getImages();
}on DatabaseException catch (e) {
  throw Exception(e);
}
}

Future<bool> insertImage(GalleryModel galleryModel)async{
try {
  log(galleryModel.id.toString());
  log(galleryModel.imgName.toString());
  log(galleryModel.imgPath.toString());
  log(galleryModel.dateTime.toString());
  return await databaseService.insertImage(galleryModel);
}on DatabaseException catch (e) {
  throw Exception(e);
}
}

Future<bool> updateImage(GalleryModel galleryModel)async{
try {
  return await databaseService.updateImage(galleryModel);
}on DatabaseException catch (e) {
  throw Exception(e);
}
}

Future<bool> deleteImage(GalleryModel galleryModel)async{
try {
  return await databaseService.deleteImage(galleryModel);
}on DatabaseException catch (e) {
  throw Exception(e);
}
}

}