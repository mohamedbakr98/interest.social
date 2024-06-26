import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat_groupw_bubbles/empty_state_simple/empty_state_simple_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'chat2_invite_users_model.dart';
export 'chat2_invite_users_model.dart';

class Chat2InviteUsersWidget extends StatefulWidget {
  const Chat2InviteUsersWidget({super.key});

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
                'Invite Friends',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  'Select users from below to start a chat.',
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'Readex Pro',
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
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 0.0, 0.0),
                          child: Text(
                            'Invite Friends',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 0.0, 0.0),
                        child: Text(
                          _model.checkboxListTileCheckedItems.length.toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(2.0, 12.0, 0.0, 0.0),
                        child: Text(
                          'Selected',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Builder(
                        builder: (context) {
                          final listOfFriends =
                              (currentUserDocument?.friends.toList() ?? [])
                                  .toList();
                          if (listOfFriends.isEmpty) {
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
                            scrollDirection: Axis.vertical,
                            itemCount: listOfFriends.length,
                            itemBuilder: (context, listOfFriendsIndex) {
                              final listOfFriendsItem =
                                  listOfFriends[listOfFriendsIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 8.0),
                                child: StreamBuilder<UsersRecord>(
                                  stream: UsersRecord.getDocument(
                                      listOfFriendsItem),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final containerUsersRecord = snapshot.data!;
                                    return Container(
                                      width: 100.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: _model
                                                .checkboxListTileCheckedItems
                                                .contains(listOfFriendsItem)
                                            ? FlutterFlowTheme.of(context)
                                                .accent1
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: _model
                                                  .checkboxListTileCheckedItems
                                                  .contains(listOfFriendsItem)
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
                                                        containerUsersRecord
                                                            .photoUrl,
                                                    width: 44.0,
                                                    height: 44.0,
                                                    fit: BoxFit.cover,
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
                                                        .checkboxListTileValueMap[
                                                    listOfFriendsItem] ??= false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.checkboxListTileValueMap[
                                                              listOfFriendsItem] =
                                                          newValue!);
                                                },
                                                title: Text(
                                                  (String firstName,
                                                          String lastName) {
                                                    return "$firstName $lastName";
                                                  }(
                                                      containerUsersRecord
                                                          .firstname,
                                                      containerUsersRecord
                                                          .lastname),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                        lineHeight: 2.0,
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
                ),
              ],
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
                      var shouldSetState = false;
                      if (_model.checkboxListTileCheckedItems.length > 2) {
                        context.pushNamed('CreateRoom');
                      } else {
                        if ((currentUserDocument?.chats.toList() ?? [])
                            .isNotEmpty) {
                          _model.chatcounter = 0;
                          setState(() {});
                          while (_model.chatcounter! <
                              (currentUserDocument?.chats.toList() ?? [])
                                  .length) {
                            _model.chat = await ChatsRecord.getDocumentOnce(
                                (currentUserDocument?.chats.toList() ??
                                    [])[_model.chatcounter!]);
                            shouldSetState = true;
                            if (_model.chat!.users.contains(
                                _model.checkboxListTileCheckedItems.first)) {
                              context.goNamed(
                                'chat_2_Details',
                                queryParameters: {
                                  'chatRef': serializeParam(
                                    _model.chat?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );

                              if (shouldSetState) setState(() {});
                              return;
                            }
                            _model.chatcounter = _model.chatcounter! + 1;
                            setState(() {});
                          }
                        }

                        var chatsRecordReference2 =
                            ChatsRecord.collection.doc();
                        await chatsRecordReference2.set({
                          ...mapToFirestore(
                            {
                              'users': [currentUserReference],
                            },
                          ),
                        });
                        _model.newChat = ChatsRecord.getDocumentFromData({
                          ...mapToFirestore(
                            {
                              'users': [currentUserReference],
                            },
                          ),
                        }, chatsRecordReference2);
                        shouldSetState = true;

                        await _model.newChat!.reference.update({
                          ...mapToFirestore(
                            {
                              'users': FieldValue.arrayUnion(
                                  [_model.checkboxListTileCheckedItems.first]),
                            },
                          ),
                        });

                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'chats': FieldValue.arrayUnion(
                                  [_model.newChat?.reference]),
                            },
                          ),
                        });

                        await _model.checkboxListTileCheckedItems.first.update({
                          ...mapToFirestore(
                            {
                              'chats': FieldValue.arrayUnion(
                                  [_model.newChat?.reference]),
                            },
                          ),
                        });

                        context.goNamed(
                          'chat_2_Details',
                          queryParameters: {
                            'chatRef': serializeParam(
                              _model.newChat?.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      }

                      if (shouldSetState) setState(() {});
                    },
                    text: 'Send Invites',
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
                                fontFamily: 'Readex Pro',
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
