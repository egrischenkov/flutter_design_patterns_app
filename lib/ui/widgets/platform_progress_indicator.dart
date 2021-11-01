import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';

class PlatformProgressIndicator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return isAndroid() ? CircularProgressIndicator() : CupertinoActivityIndicator(radius:  16,);
  }
}
