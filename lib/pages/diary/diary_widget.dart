import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'diary_model.dart';
export 'diary_model.dart';

class DiaryWidget extends StatefulWidget {
  const DiaryWidget({super.key});

  @override
  State<DiaryWidget> createState() => _DiaryWidgetState();
}

class _DiaryWidgetState extends State<DiaryWidget> {
  late DiaryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiaryModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Diary'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DIARY_PAGE_Diary_ON_INIT_STATE');
      logFirebaseEvent('Diary_google_analytics_event');
      logFirebaseEvent('diary');
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
        automaticallyImplyLeading: true,
        actions: const [],
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SafeArea(
        top: true,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 80.0,
                              height: 80.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                currentUserPhoto != ''
                                    ? currentUserPhoto
                                    : 'https://ui-avatars.com/api/?rounded=true&name=$currentUserDisplayName',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              currentUserDisplayName,
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Rubik',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        if (valueOrDefault(
                                    currentUserDocument?.socialUrl, '') !=
                                '')
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DIARY_PAGE_Icon_2ri5p78j_ON_TAP');
                                  logFirebaseEvent('Icon_launch_u_r_l');
                                  await launchURL(valueOrDefault(
                                      currentUserDocument?.socialUrl, ''));
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: valueOrDefault(
                                                  currentUserDocument
                                                      ?.socialUrl,
                                                  '') !=
                                              ''
                                      ? FlutterFlowTheme.of(context).info
                                      : FlutterFlowTheme.of(context).accent1,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'yd810j3t' /* Inbox */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Urbanist',
                          letterSpacing: 0.0,
                        ),
                  ),
                  StreamBuilder<List<UsersMemoirRecord>>(
                    stream: queryUsersMemoirRecord(
                      queryBuilder: (usersMemoirRecord) => usersMemoirRecord
                          .where(
                            'userName',
                            isEqualTo: currentUserReference,
                          )
                          .orderBy('Datecreated', descending: true),
                    ),
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
                      List<UsersMemoirRecord> listViewUsersMemoirRecordList =
                          snapshot.data!;
                      if (listViewUsersMemoirRecordList.isEmpty) {
                        return Image.asset(
                          'assets/images/stock-vector-cartoon-vector-travel-diary-with-handwritten-notes-on-the-isolated-background-378323191.png',
                        );
                      }
                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewUsersMemoirRecordList.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewUsersMemoirRecord =
                              listViewUsersMemoirRecordList[listViewIndex];
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  child: Text(
                                    listViewUsersMemoirRecord.memior,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1.0, 1.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      dateTimeFormat(
                                        'yMMMd',
                                        listViewUsersMemoirRecord.datecreated,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      'Date: ?',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1.0, 1.0),
                                  child: Text(
                                    listViewUsersMemoirRecord.userDisplayName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ].divide(const SizedBox(height: 5.0)),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ].divide(const SizedBox(height: 10.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
