// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketos/core/components/constance.dart';
import 'package:marketos/features/registration/data/model/user_model.dart';

class AppFireBaseHelper {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final String _userCollection = "Users";
  final String _userImageField = "images";
  final String _userFavoritesField = "favorites";
  final String _userCartField = "cart";

  Future<UserCredential> createUser(
      {required String email, required String password}) async {
    final auth = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    addNewUser(
      UserModel(
        id: auth.user!.uid,
        email: email,
        name: '',
        imageUrl: AppConstance.baseImageUrl,
        cart: [],
        favourites: [],
        address: '',
      ),
    );
    return auth;
  }

  Future<UserCredential> logIn(
      {required String email, required String password}) async {
    final auth = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return auth;
  }

  CollectionReference<UserModel> getUserCollection() {
    var reference =
        FirebaseFirestore.instance.collection(_userCollection).withConverter(
      fromFirestore: (snapshot, options) {
        Map<String, dynamic>? doc = snapshot.data();
        return UserModel.fromMap(doc!);
      },
      toFirestore: (user, options) {
        return user.toMap();
      },
    );
    return reference;
  }

  Future<void> addNewUser(UserModel user) async {
    var userCollection = getUserCollection();
    var docReference = userCollection.doc(user.id);
    await docReference.set(user);
  }

  Future<UserModel?> getUser(String userId) async {
    var userCollection = getUserCollection();
    var docReference = userCollection.doc(userId);
    var snapshot = await docReference.get();
    var user = snapshot.data();
    return user;
  }

  updateUserImage(String userId, String image) async {
    var userCollection = getUserCollection();
    var docReference = userCollection.doc(userId);
    await docReference.update({_userImageField: image});
  }

  Future<String?> uploadImage({required XFile file}) async {
    String uniqueFileName =
        '${DateTime.now().microsecondsSinceEpoch.toString()}${file.path.split('/').last}';
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child(_userImageField);
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    try {
      await referenceImageToUpload.putFile(File(file.path));
      String image = await referenceImageToUpload.getDownloadURL();
      print(image);
      return image;
    } catch (error) {
      print('$error');
      return null;
    }
  }

  Future<List<dynamic>> getFavorites({required String userId}) async {
    var user = await getUser(userId);
    if (user != null) {
      return user.favourites;
    }
    return [];
  }

  Future<String> addToFavorite(
      {required String userId, required String animeId}) async {
    var userCollection = getUserCollection();
    var docReference = userCollection.doc(userId);
    var user = await getUser(userId);
    if (user != null) {
      var favorites = user.favourites;
      if (favorites.contains(animeId)) {
        return "Already in favorites";
      }
      favorites.add(animeId);
      await docReference.update({_userFavoritesField: favorites});
      return "Added to favorites";
    }
    return "User not found";
  }

  Future<void> removeFromFavorite(
      {required String userId, required String animeId}) async {
    var userCollection = getUserCollection();
    var docReference = userCollection.doc(userId);
    var user = await getUser(userId);
    if (user != null) {
      var favorites = user.favourites;
      favorites.remove(animeId);
      await docReference.update({_userFavoritesField: favorites});
    }
  }

  Future<String> addToCart(
      {required String userId, required String animeId}) async {
    var userCollection = getUserCollection();
    var docReference = userCollection.doc(userId);
    var user = await getUser(userId);
    if (user != null) {
      var watchList = user.cart;
      if (watchList.contains(animeId)) {
        return "Already in watch list";
      }
      watchList.add(animeId);
      await docReference.update({_userCartField: watchList});
      return "Added to watch list";
    }
    return "User not found";
  }

  Future<void> removeFromCart(
      {required String userId, required String animeId}) async {
    var userCollection = getUserCollection();
    var docReference = userCollection.doc(userId);
    var user = await getUser(userId);
    if (user != null) {
      var watchList = user.cart;
      watchList.remove(animeId);
      await docReference.update({_userCartField: watchList});
    }
  }

  Future<List<dynamic>> getCart({required String userId}) async {
    var user = await getUser(userId);
    if (user != null) {
      return user.cart;
    }
    return [];
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
