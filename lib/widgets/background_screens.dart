
import 'package:flutter/material.dart';

class background_Screens extends StatelessWidget {
  const background_Screens({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage('images/background.png'),
             height:  double.infinity,
            width: double.infinity,
             fit: BoxFit.cover,
            );
  }
}