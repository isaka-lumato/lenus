import 'package:lenus1/controllers/messaging/chats_controller.dart';
import 'package:lenus1/utils/firebase_consts.dart';

//Store Information
class FirestoreServices {
//get all users
    static getUser(uid) {
    return firestore.collection(usersCollection).where('id', isEqualTo: uid).snapshots();
  }



  //get all Messages
  static getMessages(uid) {
    return firestore
        .collection(chatsCollection)
        .where('toId', isEqualTo: uid)
        .snapshots();
  }

  //get all chats
  static getChats(docId) {
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy('created_on', descending: false)
        .snapshots();
  }

  // Check if chat exists
 Future<bool> checkChatExists(String uid1, String  uid2) async {
  String chatID = generateChatId(uid1: uid1, uid2: uid2);
  var chatDoc = await firestore.collection(chatsCollection).doc(chatID).get();
  if(chatDoc != null) {
    return chatDoc.exists;
  }
  return false;
}

}




