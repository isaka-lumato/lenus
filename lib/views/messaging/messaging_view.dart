import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:lenus1/models/messaging/messaging_model.dart';
// import controller
import 'package:lenus1/controllers/messaging/messaging_controller.dart';

class MessagingView extends StatelessWidget {
  const MessagingView({super.key});

  @override
  Widget build(BuildContext context) {
    MessagingController viewController = MessagingController();
    return ChangeNotifierProvider<MessagingModel>(
      create: (context) => MessagingModel.instance(),
      child: Consumer<MessagingModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(title: Text('MessagingView')),
            body: Container(
                //TODO Add layout or component here
                ),
          );
        },
      ),
    );
  }
}
