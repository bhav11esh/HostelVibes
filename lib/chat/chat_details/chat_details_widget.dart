import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_details_model.dart';
export 'chat_details_model.dart';

class ChatDetailsWidget extends StatefulWidget {
  const ChatDetailsWidget({
    super.key,
    this.chatUser,
    this.chatRef,
  });

  final UsersRecord? chatUser;
  final DocumentReference? chatRef;

  @override
  State<ChatDetailsWidget> createState() => _ChatDetailsWidgetState();
}

class _ChatDetailsWidgetState extends State<ChatDetailsWidget> {
  late ChatDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  FFChatInfo? _chatInfo;
  bool isGroupChat() {
    if (widget.chatUser == null) {
      return true;
    }
    if (widget.chatRef == null) {
      return false;
    }
    return _chatInfo?.isGroupChat ?? false;
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatDetailsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'chatDetails'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_DETAILS_chatDetails_ON_INIT_STATE');
      logFirebaseEvent('chatDetails_google_analytics_event');
      logFirebaseEvent('chatdetails');
    });

    FFChatManager.instance
        .getChatInfo(
      otherUserRecord: widget.chatUser,
      chatReference: widget.chatRef,
    )
        .listen((info) {
      if (mounted) {
        setState(() => _chatInfo = info);
      }
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF161D26),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          iconTheme: IconThemeData(color: FlutterFlowTheme.of(context).primary),
          automaticallyImplyLeading: true,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('CHAT_DETAILS_PAGE_Icon_liirvxxo_ON_TAP');
              logFirebaseEvent('Icon_navigate_to');

              context.pushNamed('chatMain');
            },
            child: const Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.black,
              size: 24.0,
            ),
          ),
          title: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('CHAT_DETAILS_PAGE_Row_r2ugqdeg_ON_TAP');
              logFirebaseEvent('Row_navigate_to');

              context.pushNamed(
                'FriendBio',
                queryParameters: {
                  'userProfile': serializeParam(
                    widget.chatUser,
                    ParamType.Document,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'userProfile': widget.chatUser,
                },
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      widget.chatUser?.photoUrl != null &&
                              widget.chatUser?.photoUrl != ''
                          ? widget.chatUser!.photoUrl
                          : 'https://ui-avatars.com/api/?rounded=true&name=${widget.chatUser?.displayName}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  widget.chatUser!.displayName,
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Urbanist',
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 5.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<FFChatInfo>(
            stream: FFChatManager.instance.getChatInfo(
              otherUserRecord: widget.chatUser,
              chatReference: widget.chatRef,
            ),
            builder: (context, snapshot) => snapshot.hasData
                ? FFChatPage(
                    chatInfo: snapshot.data!,
                    allowImages: true,
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    timeDisplaySetting: TimeDisplaySetting.alwaysVisible,
                    currentUserBoxDecoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    otherUsersBoxDecoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    currentUserTextStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                      color: const Color(0xFF1E2429),
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      fontStyle: FontStyle.normal,
                    ),
                    otherUsersTextStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                    inputHintTextStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                      color: const Color(0xFF95A1AC),
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                    ),
                    inputTextStyle: GoogleFonts.getFont(
                      'Lexend Deca',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                    ),
                    emptyChatWidget: Image.asset(
                      'assets/images/c1c023cd9012384a2b33fa398abc68bc_Background_Removed.png',
                      width: 300.0,
                      fit: BoxFit.contain,
                    ),
                  )
                : Center(
                    child: SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: SpinKitThreeBounce(
                        color: FlutterFlowTheme.of(context).primary,
                        size: 25.0,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
