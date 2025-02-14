import 'package:intl/intl.dart' as intl;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lenus1/utils/app_theme.dart';
import 'package:lenus1/utils/const.dart';
import 'package:lenus1/utils/firebase_consts.dart';
import 'package:lenus1/views/chat/chat_screen.dart';
import 'package:lenus1/views/messaging/components/chat_card.dart';
import 'package:lenus1/services/firestore_services.dart';


class MessageList extends StatefulWidget {
  const MessageList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.pw16),
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45.sp),
            topRight: Radius.circular(46.sp),
          ),
          color: Colors.white,
        ),
        child: StreamBuilder(
          stream: FirestoreServices.getMessages(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text(
                  "No messages yet",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              );
            } else {
              var messages = snapshot.data!.docs;
              return ListView.builder(
                padding: EdgeInsets.only(top: AppConstants.ph16),
                physics: BouncingScrollPhysics(),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  var timestamp = messages[index]['created_on'];
                  DateTime orderDate = timestamp.toDate();
                  String time = intl.DateFormat("HH:mm").format(orderDate);
                  String date = intl.DateFormat("MMMM dd").format(orderDate);
                  return MessageCard(
                    avatar: "assetsimage1.jpg",
                    name: message['friend_name'],
                    message: message['message'],
                    time: time,
                  ).onTap(() {
                              Get.to(() => const ChatScreen(), arguments: [
                                message['friend_name'],
                                message['toId']
                              ]);
                            });
                          });
                        }
                      },
                    ),
                  ),
                );
              }
            }
