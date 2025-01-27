import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lenus1/utils/firebase_consts.dart';

//Store Information
class StoreServices {
//get all users
    static getUser(uid) {
    return firestore.collection(usersCollection).where('id', isEqualTo: uid).snapshots();
  }

  //get all Messages
  static getStoreMessages(uid) {
    return firestore
        .collection(chatsCollection)
        .where('toId', isEqualTo: uid)
        .snapshots();
  }

  //get all chats
  static getStoreChatMessages(docId) {
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy('created_on', descending: false)
        .snapshots();
  }

  //get Store Orders
  static Stream<QuerySnapshot> getStoreOrders(storeId) {
    return firestore
        .collection(ordersCollection)
        .where('stores', arrayContains: storeId)
        .snapshots();
  }

  //get Store Products
  static getStoreProducts(uid) {
    return firestore
        .collection(productsCollection)
        .where('vendor_id', isEqualTo: uid)
        .snapshots();
  }
}
