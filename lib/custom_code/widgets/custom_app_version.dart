// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:package_info_plus/package_info_plus.dart';

class CurrentAppVersion extends StatefulWidget {
  const CurrentAppVersion({
    Key? key,
    this.width,
    this.height,
    required this.myTitle,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String myTitle;

  @override
  _CurrentAppVersionState createState() => _CurrentAppVersionState();
}

class _CurrentAppVersionState extends State<CurrentAppVersion> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      subtitle: Text(
        subtitle.isEmpty ? 'Not set' : subtitle,
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _infoTile(widget.myTitle,
              _packageInfo.version + ' (' + _packageInfo.buildNumber + ')'),
        ],
      ),
    );
  }
}
