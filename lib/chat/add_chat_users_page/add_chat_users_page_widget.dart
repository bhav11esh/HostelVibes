import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:text_search/text_search.dart';
import 'add_chat_users_page_model.dart';
export 'add_chat_users_page_model.dart';

class AddChatUsersPageWidget extends StatefulWidget {
  const AddChatUsersPageWidget({
    super.key,
    this.chat,
  });

  final ChatsRecord? chat;

  @override
  State<AddChatUsersPageWidget> createState() => _AddChatUsersPageWidgetState();
}

class _AddChatUsersPageWidgetState extends State<AddChatUsersPageWidget> {
  late AddChatUsersPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddChatUsersPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AddChatUsersPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ADD_CHAT_USERS_AddChatUsersPage_ON_INIT_');
      logFirebaseEvent('AddChatUsersPage_google_analytics_event');
      logFirebaseEvent('addchatuserpage');
    });

    _model.textController ??= TextEditingController();

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
          buttonSize: 24.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).tertiary,
            size: 25.0,
          ),
          onPressed: () async {
            logFirebaseEvent('ADD_CHAT_USERS_arrow_back_rounded_ICN_ON');
            logFirebaseEvent('IconButton_navigate_back');
            context.safePop();
          },
        ),
        title: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'ahr7037a' /* Add Friends to chat */,
              ),
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              FFLocalizations.of(context).getText(
                'rjqajwg2' /* Select the friends to add to c... */,
              ),
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ],
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
              child: Autocomplete<String>(
                initialValue: const TextEditingValue(),
                optionsBuilder: (textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return [
                    FFLocalizations.of(context).getText(
                      '7xu8hsot' /* Option 1 */,
                    )
                  ].where((option) {
                    final lowercaseOption = option.toLowerCase();
                    return lowercaseOption
                        .contains(textEditingValue.text.toLowerCase());
                  });
                },
                optionsViewBuilder: (context, onSelected, options) {
                  return AutocompleteOptionsList(
                    textFieldKey: _model.textFieldKey,
                    textController: _model.textController!,
                    options: options.toList(),
                    onSelected: onSelected,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Urbanist',
                          letterSpacing: 0.0,
                        ),
                    textHighlightStyle:
                        FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lexend Deca',
                              color: const Color(0xFF95A1AC),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                    elevation: 4.0,
                    optionBackgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    optionHighlightColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    maxHeight: 200.0,
                  );
                },
                onSelected: (String selection) {
                  setState(() => _model.textFieldSelectedOption = selection);
                  FocusScope.of(context).unfocus();
                },
                fieldViewBuilder: (
                  context,
                  textEditingController,
                  focusNode,
                  onEditingComplete,
                ) {
                  _model.textFieldFocusNode = focusNode;

                  _model.textController = textEditingController;
                  return TextFormField(
                    key: _model.textFieldKey,
                    controller: textEditingController,
                    focusNode: focusNode,
                    onEditingComplete: onEditingComplete,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController',
                      const Duration(milliseconds: 2000),
                      () async {
                        logFirebaseEvent(
                            'ADD_CHAT_USERS_TextField_a5b7ldpb_ON_TEX');
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
                                      .toList(),
                            )
                            .onError((_, __) => _model.simpleSearchResults = [])
                            .whenComplete(() => setState(() {}));
                      },
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'vjyrhte2' /* Search the Person by name... */,
                      ),
                      labelStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
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
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 14.0, 0.0, 0.0),
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
                                    'ADD_CHAT_USERS_TextField_a5b7ldpb_ON_TEX');
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
                  );
                },
              ),
            ),
            if (_model.simpleSearchResults.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Builder(
                  builder: (context) {
                    final searchResults = _model.simpleSearchResults.toList();
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: searchResults.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                      itemBuilder: (context, searchResultsIndex) {
                        final searchResultsItem =
                            searchResults[searchResultsIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 2.0),
                          child: Container(
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
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          searchResultsItem.photoUrl !=
                                                      ''
                                              ? searchResultsItem.photoUrl
                                              : 'https://ui-avatars.com/api/?rounded=true&name=${searchResultsItem.displayName}',
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
                                            'ADD_CHAT_USERS_Column_zxgnegzi_ON_TAP');
                                        logFirebaseEvent('Column_navigate_to');

                                        context.pushNamed(
                                          'chatDetails',
                                          queryParameters: {
                                            'chatUser': serializeParam(
                                              searchResultsItem,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'chatUser': searchResultsItem,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  searchResultsItem.displayName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            searchResultsItem.bio,
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
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            if (_model.simpleSearchResults.isEmpty)
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: PagedListView<DocumentSnapshot<Object?>?,
                    UsersRecord>.separated(
                  pagingController: _model.setListViewController(
                    UsersRecord.collection,
                  ),
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  reverse: false,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                  builderDelegate: PagedChildBuilderDelegate<UsersRecord>(
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

                    itemBuilder: (context, _, listViewIndex) {
                      final listViewUsersRecord = _model
                          .listViewPagingController!.itemList![listViewIndex];
                      return Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                        child: Container(
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
                                            'ADD_CHAT_USERS_CircleImage_arc9tmup_ON_T');
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
                                          listViewUsersRecord
                                                          .photoUrl !=
                                                      ''
                                              ? listViewUsersRecord.photoUrl
                                              : 'https://ui-avatars.com/api/?rounded=true&name=${listViewUsersRecord.displayName}',
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
                                          'ADD_CHAT_USERS_Column_rwdqhrmn_ON_TAP');
                                      logFirebaseEvent('Column_navigate_to');

                                      context.pushNamed(
                                        'chatDetails',
                                        queryParameters: {
                                          'chatUser': serializeParam(
                                            listViewUsersRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'chatUser': listViewUsersRecord,
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
                                                listViewUsersRecord.displayName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          listViewUsersRecord.bio,
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
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
