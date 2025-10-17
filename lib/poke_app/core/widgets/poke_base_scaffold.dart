import 'package:flutter/material.dart';

class PokeBaseScaffold extends StatelessWidget {

  final Widget body;
  final AppBar? appBar;


  const PokeBaseScaffold({
    super.key,
    required this.body, 
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: Padding(
          padding: const EdgeInsets.all(16.0), 
          child: Center(
            child: body,
          ),
        ),
      ),
    );
  }
}