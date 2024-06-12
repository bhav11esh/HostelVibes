import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'details08_facility_model.dart';
export 'details08_facility_model.dart';

class Details08FacilityWidget extends StatefulWidget {
  const Details08FacilityWidget({super.key});

  @override
  State<Details08FacilityWidget> createState() =>
      _Details08FacilityWidgetState();
}

class _Details08FacilityWidgetState extends State<Details08FacilityWidget> {
  late Details08FacilityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Details08FacilityModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Details08Facility'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('DETAILS08_FACILITY_Icon_okf5glak_ON_TAP');
            logFirebaseEvent('Icon_navigate_back');
            context.pop();
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 32.0,
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Html(
          data:
              '<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Cafe and Hotel Information</title>\n    <!-- Add your preferred icon link here -->\n    <link rel=\"icon\" href=\"favicon.ico\" type=\"image/x-icon\">\n\n    <!-- Add your preferred styles and background image here -->\n    <style>\n        body {\n            background-image: url(\'background.jpg\'); /* Replace \'background.jpg\' with your actual image path */\n            background-size: cover;\n            color: #ffffff;\n            font-family: \'Arial\', sans-serif;\n            margin: 0;\n            padding: 0;\n        }\n\n        header {\n            background-color: #333;\n            padding: 20px;\n            text-align: center;\n        }\n\n        h1 {\n            color: #ffcc00; /* Your preferred theme color */\n        }\n\n        section {\n            margin: 20px;\n            padding: 20px;\n            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */\n            border-radius: 10px;\n        }\n\n        ul {\n            list-style: none;\n            padding: 0;\n        }\n\n        li {\n            margin-bottom: 10px;\n        }\n\n        /* Add more styling if needed */\n    </style>\n</head>\n\n<body>\n    <header>\n        <h1>Cafe and Hotel Information</h1>\n    </header>\n\n    <section>\n        <ul>\n            <li><strong>CAFE TIMINGS:</strong> 10AM-2PM, 5PM-10PM</li>\n            <li><strong>Wifi Password:</strong> zostel@1</li>\n            <li><strong>Pool Timings:</strong> 8AM-6PM</li>\n            <li><strong>Checkin Time:</strong> 12PM</li>\n            <li><strong>Checkout Time:</strong> 10AM</li>\n            <li><strong>Rental Scooty & Cars & CABS:</strong> 9923273366, 7499591904, 9545479594</li>\n            <li><strong>Reception Contact:</strong> 7972622492</li>\n            <li><strong>Laundry Service:</strong> 9881283680</li>\n        </ul>\n    </section>\n</body>\n\n</html>\n',
          onLinkTap: (url, _, __, ___) => launchURL(url!),
        ),
      ),
    );
  }
}
