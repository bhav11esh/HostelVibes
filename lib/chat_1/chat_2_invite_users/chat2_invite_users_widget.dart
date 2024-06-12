import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat_1/empty_state_simple/empty_state_simple_widget.dart';
import '/components/group_name/group_name_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:text_search/text_search.dart';
import 'chat2_invite_users_model.dart';
export 'chat2_invite_users_model.dart';

class Chat2InviteUsersWidget extends StatefulWidget {
  const Chat2InviteUsersWidget({
    super.key,
    this.chatRef,
  });

  final ChatsRecord? chatRef;

  @override
  State<Chat2InviteUsersWidget> createState() => _Chat2InviteUsersWidgetState();
}

class _Chat2InviteUsersWidgetState extends State<Chat2InviteUsersWidget> {
  late Chat2InviteUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Chat2InviteUsersModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'chat_2_InviteUsers'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_2_INVITE_USERS_chat_2_InviteUsers_O');
      if (widget.chatRef != null) {
        // addChatUsers_ToList
        logFirebaseEvent('chat_2_InviteUsers_addChatUsers_ToList');
        _model.friendsList =
            widget.chatRef!.users.toList().cast<DocumentReference>();
        setState(() {});
      } else {
        // addUser_ToList
        logFirebaseEvent('chat_2_InviteUsers_addUser_ToList');
        _model.addToFriendsList(currentUserReference!);
        setState(() {});
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'mab6hsks' /* Invite Friends */,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Urbanist',
                      letterSpacing: 0.0,
                    ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'jwq40bjf' /* Select users from below to sta... */,
                  ),
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'Rubik',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 4.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderRadius: 12.0,
                borderWidth: 1.0,
                buttonSize: 44.0,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('CHAT_2_INVITE_USERS_close_rounded_ICN_ON');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.safePop();
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.95,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 3.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        const Duration(milliseconds: 2000),
                        () async {
                          logFirebaseEvent(
                              'CHAT_2_INVITE_USERS_TextField_kqdqxuiq_O');
                          logFirebaseEvent('TextField_simple_search');
                          await queryUsersRecordOnce()
                              .then(
                                (records) => _model.simpleSearchResults =
                                    TextSearch(
                                  records
                                      .map(
                                        (record) => TextSearchItem.fromTerms(
                                            record, [record.displayName]),
                                      )
                                      .toList(),
                                )
                                        .search(_model.textController.text)
                                        .map((r) => r.object)
                                        .take(5)
                                        .toList(),
                              )
                              .onError(
                                  (_, __) => _model.simpleSearchResults = [])
                              .whenComplete(() => setState(() {}));
                        },
                      ),
                      textInputAction: TextInputAction.search,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'wzvv7twy' /* _ Search the Person by name... */,
                        ),
                        labelStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 10.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 14.0, 0.0, 0.0),
                        prefixIcon: const Icon(
                          Icons.search_outlined,
                          color: Color(0xFF95A1AC),
                          size: 24.0,
                        ),
                        suffixIcon: _model.textController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.textController?.clear();
                                  logFirebaseEvent(
                                      'CHAT_2_INVITE_USERS_TextField_kqdqxuiq_O');
                                  logFirebaseEvent('TextField_simple_search');
                                  await queryUsersRecordOnce()
                                      .then(
                                        (records) => _model
                                            .simpleSearchResults = TextSearch(
                                          records
                                              .map(
                                                (record) =>
                                                    TextSearchItem.fromTerms(
                                                        record,
                                                        [record.displayName]),
                                              )
                                              .toList(),
                                        )
                                            .search(_model.textController.text)
                                            .map((r) => r.object)
                                            .take(5)
                                            .toList(),
                                      )
                                      .onError((_, __) =>
                                          _model.simpleSearchResults = [])
                                      .whenComplete(() => setState(() {}));

                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.clear,
                                  color: Color(0xFF757575),
                                  size: 22.0,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'uau5t5b6' /* Invite Friends */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 0.0, 0.0),
                          child: Text(
                            ((valueOrDefault<int>(
                                      _model.friendsList.length,
                                      0,
                                    ) -
                                    1))
                                .toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Urbanist',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              2.0, 12.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '6yjbfnnd' /* Selected */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Urbanist',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.textController.text != '') {
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final friends =
                                  _model.simpleSearchResults.toList();
                              if (friends.isEmpty) {
                                return EmptyStateSimpleWidget(
                                  icon: Icon(
                                    Icons.groups_outlined,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 90.0,
                                  ),
                                  title: 'No Friends',
                                  body: 'No users exist to create a chat with.',
                                );
                              }
                              return ListView.builder(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  160.0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: friends.length,
                                itemBuilder: (context, friendsIndex) {
                                  final friendsItem = friends[friendsIndex];
                                  return Visibility(
                                    visible: friendsItem.reference !=
                                        currentUserReference,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 8.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                          color: _model.friendsList.contains(
                                                  friendsItem.reference)
                                              ? FlutterFlowTheme.of(context)
                                                  .accent1
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: _model.friendsList.contains(
                                                    friendsItem.reference)
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width: 44.0,
                                                height: 44.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(2.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'CHAT_2_INVITE_USERS_Image_6p5h5qk8_ON_TA');
                                                      logFirebaseEvent(
                                                          'Image_navigate_to');

                                                      context.pushNamed(
                                                        'FriendBio',
                                                        queryParameters: {
                                                          'userProfile':
                                                              serializeParam(
                                                            friendsItem,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'userProfile':
                                                              friendsItem,
                                                        },
                                                      );
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    200),
                                                        fadeOutDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    200),
                                                        imageUrl: friendsItem
                                                            .photoUrl,
                                                        width: 44.0,
                                                        height: 44.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Theme(
                                                data: ThemeData(
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                                child: CheckboxListTile(
                                                  value: _model
                                                          .checkboxListTileValueMap1[
                                                      friendsItem] ??= _model
                                                          .friendsList
                                                          .contains(friendsItem
                                                              .reference) ==
                                                      true,
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                            .checkboxListTileValueMap1[
                                                        friendsItem] = newValue!);
                                                    if (newValue!) {
                                                      logFirebaseEvent(
                                                          'CHAT_2_INVITE_USERS_CheckboxListTile_1pl');
                                                      // addUser
                                                      logFirebaseEvent(
                                                          'CheckboxListTile_addUser');
                                                      _model.addToFriendsList(
                                                          friendsItem
                                                              .reference);
                                                    } else {
                                                      logFirebaseEvent(
                                                          'CHAT_2_INVITE_USERS_CheckboxListTile_1pl');
                                                      // removeUsser
                                                      logFirebaseEvent(
                                                          'CheckboxListTile_removeUsser');
                                                      _model
                                                          .removeFromFriendsList(
                                                              friendsItem
                                                                  .reference);
                                                    }
                                                  },
                                                  title: Text(
                                                    valueOrDefault<String>(
                                                      friendsItem.displayName,
                                                      'mm',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                          lineHeight: 2.0,
                                                        ),
                                                  ),
                                                  subtitle: Text(
                                                    friendsItem.bio
                                                        .maybeHandleOverflow(
                                                      maxChars: 75,
                                                      replacement: '…',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  tileColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  checkColor: Colors.white,
                                                  dense: false,
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .trailing,
                                                  contentPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(12.0, 0.0,
                                                              8.0, 0.0),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: PagedListView<DocumentSnapshot<Object?>?,
                              UsersRecord>(
                            pagingController: _model.setListViewController2(
                              UsersRecord.collection,
                            ),
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              160.0,
                            ),
                            shrinkWrap: true,
                            reverse: false,
                            scrollDirection: Axis.vertical,
                            builderDelegate:
                                PagedChildBuilderDelegate<UsersRecord>(
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
                              noItemsFoundIndicatorBuilder: (_) =>
                                  EmptyStateSimpleWidget(
                                icon: Icon(
                                  Icons.groups_outlined,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 90.0,
                                ),
                                title: 'No Friends',
                                body: 'No users exist to create a chat with.',
                              ),
                              itemBuilder: (context, _, listViewIndex) {
                                final listViewUsersRecord = _model
                                    .listViewPagingController2!
                                    .itemList![listViewIndex];
                                return Visibility(
                                  visible: listViewUsersRecord.reference !=
                                      currentUserReference,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 8.0),
                                    child: Container(
                                      width: 100.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: _model.friendsList.contains(
                                                listViewUsersRecord.reference)
                                            ? FlutterFlowTheme.of(context)
                                                .accent1
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: _model.friendsList.contains(
                                                  listViewUsersRecord.reference)
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 44.0,
                                              height: 44.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(2.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'CHAT_2_INVITE_USERS_Image_0918ik53_ON_TA');
                                                    logFirebaseEvent(
                                                        'Image_navigate_to');

                                                    context.pushNamed(
                                                      'FriendBio',
                                                      queryParameters: {
                                                        'userProfile':
                                                            serializeParam(
                                                          listViewUsersRecord,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'userProfile':
                                                            listViewUsersRecord,
                                                      },
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: const Duration(
                                                          milliseconds: 200),
                                                      fadeOutDuration: const Duration(
                                                          milliseconds: 200),
                                                      imageUrl:
                                                          listViewUsersRecord
                                                              .photoUrl,
                                                      width: 44.0,
                                                      height: 44.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Theme(
                                              data: ThemeData(
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              child: CheckboxListTile(
                                                value: _model
                                                        .checkboxListTileValueMap2[
                                                    listViewUsersRecord] ??= _model
                                                        .friendsList
                                                        .contains(
                                                            listViewUsersRecord
                                                                .reference) ==
                                                    true,
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                              .checkboxListTileValueMap2[
                                                          listViewUsersRecord] =
                                                      newValue!);
                                                  if (newValue!) {
                                                    logFirebaseEvent(
                                                        'CHAT_2_INVITE_USERS_CheckboxListTile_5xz');
                                                    // addUser
                                                    logFirebaseEvent(
                                                        'CheckboxListTile_addUser');
                                                    _model.addToFriendsList(
                                                        listViewUsersRecord
                                                            .reference);
                                                  } else {
                                                    logFirebaseEvent(
                                                        'CHAT_2_INVITE_USERS_CheckboxListTile_5xz');
                                                    // removeUsser
                                                    logFirebaseEvent(
                                                        'CheckboxListTile_removeUsser');
                                                    _model
                                                        .removeFromFriendsList(
                                                            listViewUsersRecord
                                                                .reference);
                                                  }
                                                },
                                                title: Text(
                                                  listViewUsersRecord
                                                      .displayName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                        lineHeight: 2.0,
                                                      ),
                                                ),
                                                subtitle: Text(
                                                  listViewUsersRecord.bio
                                                      .maybeHandleOverflow(
                                                          maxChars: 75),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                checkColor: Colors.white,
                                                dense: false,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(12.0, 0.0,
                                                            8.0, 0.0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: 140.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).accent4,
                      FlutterFlowTheme.of(context).secondaryBackground
                    ],
                    stops: const [0.0, 1.0],
                    begin: const AlignmentDirectional(0.0, -1.0),
                    end: const AlignmentDirectional(0, 1.0),
                  ),
                ),
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'CHAT_2_INVITE_USERS_SEND_INVITES_BTN_ON_');
                      if (_model.friendsList.length >= 2) {
                        if (widget.chatRef != null) {
                          // updateChat
                          logFirebaseEvent('Button_updateChat');

                          await widget.chatRef!.reference.update({
                            ...mapToFirestore(
                              {
                                'users': _model.friendsList,
                              },
                            ),
                          });
                          // updateChat
                          logFirebaseEvent('Button_updateChat');
                          _model.updatedChatThread = await queryChatsRecordOnce(
                            queryBuilder: (chatsRecord) => chatsRecord.where(
                              'group_chat_id',
                              isEqualTo: widget.chatRef?.groupChatId,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          logFirebaseEvent('Button_navigate_to');
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'chat_2_Details',
                            queryParameters: {
                              'chatRef': serializeParam(
                                _model.updatedChatThread,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'chatRef': _model.updatedChatThread,
                            },
                          );
                        } else {
                          logFirebaseEvent('Button_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: const GroupNameWidget(),
                                ),
                              );
                            },
                          ).then((value) =>
                              safeSetState(() => _model.groupName = value));

                          // newChat
                          logFirebaseEvent('Button_newChat');

                          var chatsRecordReference =
                              ChatsRecord.collection.doc();
                          await chatsRecordReference.set({
                            ...createChatsRecordData(
                              userA: currentUserReference,
                              userB: _model.friendsList[1],
                              lastMessage: '',
                              lastMessageTime: getCurrentTimestamp,
                              lastMessageSentBy: currentUserReference,
                              groupChatId:
                                  random_data.randomInteger(99999, 9999999),
                              groupName: _model.groupName,
                            ),
                            ...mapToFirestore(
                              {
                                'users': _model.friendsList,
                              },
                            ),
                          });
                          _model.newChatThread =
                              ChatsRecord.getDocumentFromData({
                            ...createChatsRecordData(
                              userA: currentUserReference,
                              userB: _model.friendsList[1],
                              lastMessage: '',
                              lastMessageTime: getCurrentTimestamp,
                              lastMessageSentBy: currentUserReference,
                              groupChatId:
                                  random_data.randomInteger(99999, 9999999),
                              groupName: _model.groupName,
                            ),
                            ...mapToFirestore(
                              {
                                'users': _model.friendsList,
                              },
                            ),
                          }, chatsRecordReference);
                          logFirebaseEvent('Button_navigate_to');
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'chat_2_Details',
                            queryParameters: {
                              'chatRef': serializeParam(
                                _model.newChatThread,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'chatRef': _model.newChatThread,
                            },
                          );
                        }
                      } else {
                        logFirebaseEvent('Button_show_snack_bar');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'You must select at least one other user to start a chat.',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            duration: const Duration(milliseconds: 3000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primary,
                          ),
                        );
                      }

                      setState(() {});
                    },
                    text:
                        widget.chatRef != null ? 'Add to Chat' : 'Send Invites',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Urbanist',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 2.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
