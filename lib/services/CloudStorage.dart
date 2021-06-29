import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class CloudStorageService {
  Future<CloudStorageResult?> uploadImage({
    required File imageToUpload,
    required String title,
  }) async {
    var imageFileName =
        title + DateTime.now().millisecondsSinceEpoch.toString();

    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(imageFileName);

    UploadTask uploadTask = firebaseStorageRef.putFile(imageToUpload);

    var downloadUrl = await uploadTask.then((res) => res.ref.getDownloadURL());

    // ignore: unnecessary_null_comparison
    if (downloadUrl != null) {
      var url = downloadUrl.toString();
      return CloudStorageResult(
        imageUrl: url,
        imageFileName: imageFileName,
      );
    }

    return null;
  }

  Future deleteImage(String imageFileName) async {
    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(imageFileName);

    try {
      await firebaseStorageRef.delete();
      return true;
    } catch (e) {
      return e.toString();
    }
  }
}

class CloudStorageResult {
  final String imageUrl;
  final String imageFileName;

  CloudStorageResult({required this.imageUrl, required this.imageFileName});
}
