import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat_1/delete_dialog/delete_dialog_widget.dart';
import '/chat_1/user_list_small/user_list_small_widget.dart';
import '/components/group_name/group_name_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'chat_details_overlay_model.dart';
export 'chat_details_overlay_model.dart';

class ChatDetailsOverlayWidget extends StatefulWidget {
  const ChatDetailsOverlayWidget({
    super.key,
    required this.chatRef,
  });

  final ChatsRecord? chatRef;

  @override
  State<ChatDetailsOverlayWidget> createState() =>
      _ChatDetailsOverlayWidgetState();
}

class _ChatDetailsOverlayWidgetState extends State<ChatDetailsOverlayWidget> {
  late ChatDetailsOverlayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatDetailsOverlayModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: const AlignmentDirectional(1.0, 0.0),
          child: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primary,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).tertiary,
                icon: FaIcon(
                  FontAwesomeIcons.share,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('CHAT_DETAILS_OVERLAY_share_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_share');
                  await Share.share(
                    'https://travelpanda.flutterflow.app/chat2Details?${widget.chatRef?.reference.id}',
                    sharePositionOrigin: getWidgetBoundingBox(context),
                  );
                },
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'CHAT_DETAILS_OVERLAY_Row_2xhe9xf0_ON_TAP');
                    if (currentUserReference == widget.chatRef?.userA) {
                      logFirebaseEvent('Row_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.5,
                              child: const GroupNameWidget(),
                            ),
                          );
                        },
                      ).then((value) =>
                          safeSetState(() => _model.groupName2Copy = value));

                      logFirebaseEvent('Row_backend_call');

                      await widget.chatRef!.reference
                          .update(createChatsRecordData(
                        groupName: _model.groupName2Copy,
                      ));
                      logFirebaseEvent('Row_update_app_state');

                      setState(() {});
                    }

                    setState(() {});
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 4.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'zrxw19zs' /* Group Name : */,
                                ),
                                style: const TextStyle(),
                              ),
                              TextSpan(
                                text: valueOrDefault<String>(
                                  widget.chatRef?.groupName,
                                  '--',
                                ),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Rubik',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: FaIcon(
                            FontAwesomeIcons.solidEdit,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'vff28fkd' /* In this chat */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Urbanist',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final chatUsers = widget.chatRef?.users.toList() ?? [];
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: chatUsers.length,
                        itemBuilder: (context, chatUsersIndex) {
                          final chatUsersItem = chatUsers[chatUsersIndex];
                          return FutureBuilder<UsersRecord>(
                            future: UsersRecord.getDocumentOnce(chatUsersItem),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 25.0,
                                    height: 25.0,
                                    child: SpinKitThreeBounce(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 25.0,
                                    ),
                                  ),
                                );
                              }
                              final userListSmallUsersRecord = snapshot.data!;
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'CHAT_DETAILS_OVERLAY_Container_leatuwft_');
                                  logFirebaseEvent(
                                      'user_ListSmall_navigate_to');

                                  context.pushNamed(
                                    'FriendBio',
                                    queryParameters: {
                                      'userProfile': serializeParam(
                                        userListSmallUsersRecord,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'userProfile': userListSmallUsersRecord,
                                    },
                                  );
                                },
                                child: wrapWithModel(
                                  model: _model.userListSmallModels.getModel(
                                    chatUsersItem.id,
                                    chatUsersIndex,
                                  ),
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: UserListSmallWidget(
                                    key: Key(
                                      'Keylea_${chatUsersItem.id}',
                                    ),
                                    userRef: userListSmallUsersRecord,
                                    action: () async {
                                      logFirebaseEvent(
                                          'CHAT_DETAILS_OVERLAY_Container_leatuwft_');
                                      logFirebaseEvent(
                                          'user_ListSmall_navigate_to');

                                      context.pushNamed(
                                        'FriendBio',
                                        queryParameters: {
                                          'userProfile': serializeParam(
                                            userListSmallUsersRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'userProfile':
                                              userListSmallUsersRecord,
                                        },
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (widget.chatRef?.userA == currentUserReference)
                      Expanded(
                        child: wrapWithModel(
                          model: _model.deleteDialogModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: DeleteDialogWidget(
                            chatList: widget.chatRef,
                            action: () async {
                              logFirebaseEvent(
                                  'CHAT_DETAILS_OVERLAY_Container_a3eudma4_');
                              logFirebaseEvent(
                                  'deleteDialog_close_dialog,_drawer,_etc');
                              Navigator.pop(context);
                              logFirebaseEvent('deleteDialog_navigate_to');

                              context.pushNamed(
                                'chat_2_InviteUsers',
                                queryParameters: {
                                  'chatRef': serializeParam(
                                    widget.chatRef,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'chatRef': widget.chatRef,
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.bottomToTop,
                                    duration: Duration(milliseconds: 250),
                                  ),
                                },
                              );
                            },
                            deleteAction: () async {
                              logFirebaseEvent(
                                  'CHAT_DETAILS_OVERLAY_Container_a3eudma4_');
                              logFirebaseEvent('deleteDialog_backend_call');
                              await widget.chatRef!.reference.delete();
                              logFirebaseEvent('deleteDialog_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'You have successfully deleted a chat!',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  duration: const Duration(milliseconds: 3000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                              logFirebaseEvent('deleteDialog_navigate_to');

                              context.pushNamed(
                                'chat_2_main',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.leftToRight,
                                    duration: Duration(milliseconds: 220),
                                  ),
                                },
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: FlutterFlowTheme.of(context).error,
                        size: 20.0,
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 0.0, 10.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'CHAT_DETAILS_OVERLAY_Text_l0b2uf1x_ON_TA');
                              logFirebaseEvent('Text_backend_call');

                              await widget.chatRef!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'users': FieldValue.arrayRemove(
                                        [currentUserReference]),
                                  },
                                ),
                              });
                              logFirebaseEvent('Text_navigate_to');

                              context.pushNamed('chat_2_main');
                            },
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'znf30na5' /* Leave the Chat permanently */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: FlutterFlowTheme.of(context).error,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 44.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('CHAT_DETAILS_OVERLAY_CLOSE_BTN_ON_TAP');
                      logFirebaseEvent('Button_bottom_sheet');
                      Navigator.pop(context);
                    },
                    text: FFLocalizations.of(context).getText(
                      'zzc96usv' /* Close */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(44.0, 0.0, 44.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleLarge.override(
                                fontFamily: 'Rubik',
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                      hoverColor: FlutterFlowTheme.of(context).alternate,
                      hoverBorderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      hoverTextColor: FlutterFlowTheme.of(context).primaryText,
                      hoverElevation: 3.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
