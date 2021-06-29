// import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:instagram/model/post.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addPost(
      {required String mediaUrl,
      required String caption,
      required int likes,
      // required DateTime createdAt,
      String? postId}) async {
    try {
      await _firestore.collection("Post").add({
        'mediaUrl': mediaUrl,
        'caption': caption,
        'likes': likes,
        'postId': _firestore.collection("Post").id,
        // 'createdAt': createdAt,
      });
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Stream<List<Post>> postStream() {
    return _firestore.collection("Post").snapshots().map((QuerySnapshot query) {
      List<Post> retVal = [];
      query.docs.forEach((element) {
        retVal.add(Post.fromDocument(element));
      });
      print(retVal);
      return retVal;
    });
  }

  

  
}
