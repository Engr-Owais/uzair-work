import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String mediaUrl;
  String caption;
  int likes;
  String postId;
  // DateTime createdAt;

  Post({
    required this.mediaUrl,
    required this.caption,
    required this.postId,
    required this.likes,
    // required this.createdAt,
  });

  factory Post.fromDocument(DocumentSnapshot document) {
    return Post(
      postId: document.id,
      caption: document['caption'],
      mediaUrl: document['mediaUrl'],
      likes: document['likes'],
      // createdAt: document['createdAt']
    );
  }
}
