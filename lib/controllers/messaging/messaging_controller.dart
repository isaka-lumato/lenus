import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:lenus1/models/messaging/messaging_model.dart';

class MessagingController {
  MessagingController();
  
  void getter(BuildContext context) {
    MessagingModel viewModel = Provider.of<MessagingModel>(context, listen: false);
    //TODO Add code here for getter
    viewModel.getter();
  }

  void setter(BuildContext context) {
    MessagingModel viewModel = Provider.of<MessagingModel>(context, listen: false);
    //TODO Add code here for setter
    viewModel.setter();
  }

  void update(BuildContext context) {
    MessagingModel viewModel = Provider.of<MessagingModel>(context, listen: false);
    //TODO Add code here for update
    viewModel.update();
  }

  void remove(BuildContext context) {
    MessagingModel viewModel = Provider.of<MessagingModel>(context, listen: false);
    //TODO Add code here for remove
    viewModel.remove();
  }
}