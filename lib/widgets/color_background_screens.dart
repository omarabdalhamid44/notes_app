
import 'package:flutter/material.dart';
import 'package:notes_ios/utils/app_color.dart';

class color_background_screens extends StatelessWidget {
  const color_background_screens({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              height:  double.infinity,
            width: double.infinity,
      color:App_Color.BACKGROUND_LANACH_SCREEN_COLOR,
    );
  }
}