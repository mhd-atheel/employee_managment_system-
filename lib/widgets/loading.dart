import 'package:flutter/material.dart';

class Loading {
  static loading(){
    return Transform.scale(
      scale: 0.8,
      child: CircularProgressIndicator(
        color: Colors.white,
        backgroundColor:  Colors.black,
      ),
    );
  }
}
