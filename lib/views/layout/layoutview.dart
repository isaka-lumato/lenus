import 'package:flutter/material.dart';

class Layoutview extends StatelessWidget {
  const Layoutview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomBar(
        currentIcon: viewModel.currentIndex,
        onTap: (int index) => viewModel.updateIndex(index),
        icons: viewModel.icons,
      ),
      body: viewModel.pages[viewModel.currentIndex],
    );
  }
}
