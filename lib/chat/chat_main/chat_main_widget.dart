import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'chat_main_model.dart';
export 'chat_main_model.dart';

class ChatMainWidget extends StatefulWidget {
  const ChatMainWidget({super.key});

  @override
  State<ChatMainWidget> createState() => _ChatMainWidgetState();
}

class _ChatMainWidgetState extends State<ChatMainWidget> {
  late ChatMainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatMainModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'chatMain'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_MAIN_PAGE_chatMain_ON_INIT_STATE');
      logFirebaseEvent('chatMain_google_analytics_event');
      logFirebaseEvent('chatmain');
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
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('CHAT_MAIN_PAGE_Icon_khm73xik_ON_TAP');
            logFirebaseEvent('Icon_navigate_to');

            context.pushNamed('AddChatUsersPage');
          },
          child: const Icon(
            Icons.person_add,
            color: Colors.white,
            size: 30.0,
          ),
        ),
        actions: const [],
        flexibleSpace: FlexibleSpaceBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'qwxqxw11' /* Meet Other Travellers ! */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Playfair Display',
                      color: Colors.white,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              FaIcon(
                FontAwesomeIcons.angellist,
                color: FlutterFlowTheme.of(context).tertiary,
                size: 24.0,
              ),
            ],
          ),
          centerTitle: true,
          expandedTitleScale: 1.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: PagedListView<DocumentSnapshot<Object?>?,
                    ChatsRecord>.separated(
                  pagingController: _model.setListViewController(
                    ChatsRecord.collection
                        .where(
                          'users',
                          arrayContains: currentUserReference,
                        )
                        .orderBy('last_message_time', descending: true),
                  ),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  reverse: false,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                  builderDelegate: PagedChildBuilderDelegate<ChatsRecord>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 25.0,
                        height: 25.0,
                        child: SpinKitThreeBounce(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 25.0,
                        ),
                      ),
                    ),
                    // Customize what your widget looks like when it's loading another page.
                    newPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 25.0,
                        height: 25.0,
                        child: SpinKitThreeBounce(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 25.0,
                        ),
                      ),
                    ),
                    noItemsFoundIndicatorBuilder: (_) => Center(
                      child: Image.asset(
                        'assets/images/2vqf7_',
                        width: 300.0,
                      ),
                    ),
                    itemBuilder: (context, _, listViewIndex) {
                      final listViewChatsRecord = _model
                          .listViewPagingController!.itemList![listViewIndex];
                      return Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 90),
                          curve: Curves.linear,
                          width: 100.0,
                          height: 57.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).tertiary,
                            borderRadius: BorderRadius.circular(30.0),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).tertiary,
                            ),
                          ),
                          child: StreamBuilder<FFChatInfo>(
                            stream: FFChatManager.instance
                                .getChatInfo(chatRecord: listViewChatsRecord),
                            builder: (context, snapshot) {
                              final chatInfo = snapshot.data ??
                                  FFChatInfo(listViewChatsRecord);
                              return FFChatPreview(
                                onTap: () => context.pushNamed(
                                  'chatDetails',
                                  queryParameters: {
                                    'chatUser': serializeParam(
                                      chatInfo.otherUsers.length == 1
                                          ? chatInfo.otherUsersList.first
                                          : null,
                                      ParamType.Document,
                                    ),
                                    'chatRef': serializeParam(
                                      chatInfo.chatRecord.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'chatUser': chatInfo.otherUsers.length == 1
                                        ? chatInfo.otherUsersList.first
                                        : null,
                                  },
                                ),
                                lastChatText: chatInfo.chatPreviewMessage(),
                                lastChatTime:
                                    listViewChatsRecord.lastMessageTime,
                                seen: listViewChatsRecord.lastMessageSeenBy
                                    .contains(currentUserReference),
                                title: chatInfo.chatPreviewTitle(),
                                userProfilePic: chatInfo.chatPreviewPic(),
                                color: const Color(0x001E2429),
                                unreadColor:
                                    FlutterFlowTheme.of(context).primary,
                                titleTextStyle: GoogleFonts.getFont(
                                  'Urbanist',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                                dateTextStyle: GoogleFonts.getFont(
                                  'Urbanist',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.0,
                                ),
                                previewTextStyle: GoogleFonts.getFont(
                                  'Urbanist',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('CHAT_MAIN_GROUPCHAT_BUTTON_BTN_ON_TAP');
                logFirebaseEvent('Button_group_chat_action');
                _model.groupChatmain = await FFChatManager.instance.createChat(
                  [currentUserReference!],
                );
                context.pushNamed(
                  'chatDetails',
                  queryParameters: {
                    'chatRef': serializeParam(
                      _model.groupChatmain?.reference,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );

                setState(() {});
              },
              text: FFLocalizations.of(context).getText(
                '2nh503t2' /* groupchat button */,
              ),
              options: FFButtonOptions(
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Urbanist',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                elevation: 3.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
