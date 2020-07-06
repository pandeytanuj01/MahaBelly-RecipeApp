import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeModel extends Model {
  File _imageURI;
  ImagePicker _imagePicker;

  get imageURI => _imageURI;

  setImageURI(var image) {
    _imageURI = image;
    notifyListeners();
  }

  Future getImageFromCamera() async {
    _imagePicker = ImagePicker();
    var image = await _imagePicker.getImage(source: ImageSource.camera);
    setImageURI(image);
  }

  Future getImageFromGallery() async {
    _imagePicker = ImagePicker();
    var image = await _imagePicker.getImage(source: ImageSource.gallery);
    setImageURI(image);
  }
}
