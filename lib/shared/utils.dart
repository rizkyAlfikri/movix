part of 'shared.dart';

Size getScreenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

Future<File> getImage() async {
  var image = await ImagePicker().getImage(source: ImageSource.gallery);
  return File(image.path);
}

Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);

  Reference ref = FirebaseStorage.instance.ref().child(fileName);

  UploadTask task = ref.putFile(image);
  TaskSnapshot taskSnapshot = await task.whenComplete(() {});

  return await taskSnapshot.ref.getDownloadURL();
}
