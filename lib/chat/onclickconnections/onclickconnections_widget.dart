import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'onclickconnections_model.dart';
export 'onclickconnections_model.dart';

class OnclickconnectionsWidget extends StatefulWidget {
  const OnclickconnectionsWidget({
    super.key,
    required this.userHostelTripRef,
  });

  final List<DocumentReference>? userHostelTripRef;

  @override
  State<OnclickconnectionsWidget> createState() =>
      _OnclickconnectionsWidgetState();
}

class _OnclickconnectionsWidgetState extends State<OnclickconnectionsWidget> {
  late OnclickconnectionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnclickconnectionsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'onclickconnections'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ONCLICKCONNECTIONS_onclickconnections_ON');
      logFirebaseEvent('onclickconnections_google_analytics_even');
      logFirebaseEvent('addchatuserpage');
    });

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
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30.0,
          ),
          onPressed: () async {
            logFirebaseEvent('ONCLICKCONNECTIONS_arrow_back_rounded_IC');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'bovuj594' /* meet your <crazy> hostel-mates */,
              ),
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            FaIcon(
              FontAwesomeIcons.angellist,
              color: FlutterFlowTheme.of(context).tertiary,
              size: 30.0,
            ),
          ],
        ),
        actions: const [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          image: DecorationImage(
            fit: BoxFit.contain,
            alignment: const AlignmentDirectional(0.0, 0.7),
            image: Image.asset(
              'assets/images/hero.chats.png',
            ).image,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Builder(
            builder: (context) {
              final hosteluserslist = functions
                      .uniquedocrefence(widget.userHostelTripRef?.toList())
                      ?.where((e) => e != currentUserReference)
                      .toList()
                      .toList() ??
                  [];
              if (hosteluserslist.isEmpty) {
                return Center(
                  child: Image.asset(
                    'assets/images/hero.chats.png',
                    fit: BoxFit.fill,
                  ),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: hosteluserslist.length,
                itemBuilder: (context, hosteluserslistIndex) {
                  final hosteluserslistItem =
                      hosteluserslist[hosteluserslistIndex];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FutureBuilder<UsersRecord>(
                      future: UsersRecord.getDocumentOnce(hosteluserslistItem),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 25.0,
                              height: 25.0,
                              child: SpinKitThreeBounce(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 25.0,
                              ),
                            ),
                          );
                        }
                        final userEntryUsersRecord = snapshot.data!;
                        return Container(
                          width: MediaQuery.sizeOf(context).width * 0.98,
                          height: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 0.0,
                                color: Color(0xFFDBE2E7),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: const Color(0xFF4E39F9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ONCLICKCONNECTIONS_CircleImage_yef6vrfe_');
                                        logFirebaseEvent(
                                            'CircleImage_navigate_to');

                                        context.pushNamed('Diary');
                                      },
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          userEntryUsersRecord
                                                          .photoUrl !=
                                                      ''
                                              ? userEntryUsersRecord.photoUrl
                                              : 'https://ui-avatars.com/api/?rounded=true&name=${userEntryUsersRecord.displayName}',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'ONCLICKCONNECTIONS_Column_hvwlystr_ON_TA');
                                      logFirebaseEvent('Column_navigate_to');

                                      context.pushNamed(
                                        'chatDetails',
                                        queryParameters: {
                                          'chatUser': serializeParam(
                                            userEntryUsersRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'chatUser': userEntryUsersRecord,
                                        },
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 9.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                userEntryUsersRecord
                                                    .displayName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                userEntryUsersRecord.userCity,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Urbanist',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          userEntryUsersRecord.bio,
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Urbanist',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
