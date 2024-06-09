import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/upload_data.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'card_chat_model.dart';
export 'card_chat_model.dart';

class CardChatWidget extends StatefulWidget {
  const CardChatWidget({
    super.key,
    this.chatRef,
  });

  final DocumentReference? chatRef;

  @override
  State<CardChatWidget> createState() => _CardChatWidgetState();
}

class _CardChatWidgetState extends State<CardChatWidget> {
  late CardChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardChatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.card = await CardsRecord.getDocumentOnce(widget.chatRef!);
      await _model.columnController?.animateTo(
        _model.columnController!.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
      );
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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
              context.goNamed(
                'chat_2_main',
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.leftToRight,
                    duration: Duration(milliseconds: 230),
                  ),
                },
              );
            },
          ),
          title: Container(
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                    child: Container(
                      width: 44.0,
                      height: 44.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent1,
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 200),
                            fadeOutDuration: const Duration(milliseconds: 200),
                            imageUrl: valueOrDefault<String>(
                              _model.card?.cardcover,
                              'data:image/jpeg;base64,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',
                            ),
                            width: 44.0,
                            height: 44.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    _model.card?.name,
                    'N/A',
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 16.0, 8.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderRadius: 12.0,
                borderWidth: 2.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.more_vert,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed('CardInfo');
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Stack(
              children: [
                AuthUserStreamWidget(
                  builder: (context) => StreamBuilder<List<CardMessagesRecord>>(
                    stream: queryCardMessagesRecord(
                      parent: widget.chatRef,
                      queryBuilder: (cardMessagesRecord) =>
                          cardMessagesRecord.orderBy('timestamp'),
                    )..listen((snapshot) async {
                        List<CardMessagesRecord> columnCardMessagesRecordList =
                            snapshot;
                        if (_model.columnPreviousSnapshot != null &&
                            !const ListEquality(
                                    CardMessagesRecordDocumentEquality())
                                .equals(columnCardMessagesRecordList,
                                    _model.columnPreviousSnapshot)) {
                          await _model.columnController?.animateTo(
                            _model.columnController!.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.ease,
                          );

                          setState(() {});
                        }
                        _model.columnPreviousSnapshot = snapshot;
                      }),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<CardMessagesRecord> columnCardMessagesRecordList =
                          snapshot.data!;
                      return SingleChildScrollView(
                        controller: _model.columnController,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: List.generate(
                              columnCardMessagesRecordList.length,
                              (columnIndex) {
                            final columnCardMessagesRecord =
                                columnCardMessagesRecordList[columnIndex];
                            return Builder(
                              builder: (context) {
                                if (columnCardMessagesRecord.senderRef ==
                                    currentUserReference) {
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 1.0),
                                    child: Container(
                                      width: double.infinity,
                                      constraints: const BoxConstraints(
                                        maxWidth: double.infinity,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 12.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 8.0),
                                              child: Text(
                                                dateTimeFormat(
                                                    'd/M h:mm a',
                                                    columnCardMessagesRecord
                                                        .timestamp!),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                boxShadow: const [
                                                  BoxShadow(
                                                    blurRadius: 3.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      1.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(12.0),
                                                  topRight:
                                                      Radius.circular(12.0),
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    SelectionArea(
                                                        child: Text(
                                                      columnCardMessagesRecord
                                                          .text,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    )),
                                                    if (columnCardMessagesRecord
                                                                .image !=
                                                            '')
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    4.0),
                                                        child:
                                                            FlutterFlowMediaDisplay(
                                                          path:
                                                              columnCardMessagesRecord
                                                                  .image,
                                                          imageBuilder:
                                                              (path) =>
                                                                  ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                CachedNetworkImage(
                                                              fadeInDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          500),
                                                              fadeOutDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          500),
                                                              imageUrl: path,
                                                              width: 300.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          videoPlayerBuilder:
                                                              (path) =>
                                                                  FlutterFlowVideoPlayer(
                                                            path: path,
                                                            width: 300.0,
                                                            autoPlay: false,
                                                            looping: true,
                                                            showControls: true,
                                                            allowFullScreen:
                                                                true,
                                                            allowPlaybackSpeedMenu:
                                                                false,
                                                          ),
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
                                } else {
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 1.0),
                                    child: StreamBuilder<UsersRecord>(
                                      stream: UsersRecord.getDocument(
                                          columnCardMessagesRecord.senderRef!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final otherUserUsersRecord =
                                            snapshot.data!;
                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 8.0, 16.0),
                                                  child: Container(
                                                    width: 36.0,
                                                    height: 36.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      shape: BoxShape.rectangle,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(2.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      200),
                                                          fadeOutDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      200),
                                                          imageUrl:
                                                              valueOrDefault<
                                                                  String>(
                                                            otherUserUsersRecord
                                                                .photoUrl,
                                                            'data:image/jpeg;base64,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',
                                                          ),
                                                          width: 44.0,
                                                          height: 44.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              otherUserUsersRecord
                                                                  .firstname,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            )),
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              otherUserUsersRecord
                                                                  .lastname,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            )),
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              ' ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            )),
                                                            Text(
                                                              dateTimeFormat(
                                                                  'd/M h:mm a',
                                                                  columnCardMessagesRecord
                                                                      .timestamp!),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 4.0)),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              blurRadius: 3.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                1.0,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    12.0),
                                                          ),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  8.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                columnCardMessagesRecord
                                                                    .text,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                              )),
                                                              if (columnCardMessagesRecord
                                                                          .image !=
                                                                      '')
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child:
                                                                      FlutterFlowMediaDisplay(
                                                                    path: columnCardMessagesRecord
                                                                        .image,
                                                                    imageBuilder:
                                                                        (path) =>
                                                                            ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            const Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                            const Duration(milliseconds: 500),
                                                                        imageUrl:
                                                                            path,
                                                                        width:
                                                                            300.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    videoPlayerBuilder:
                                                                        (path) =>
                                                                            FlutterFlowVideoPlayer(
                                                                      path:
                                                                          path,
                                                                      width:
                                                                          300.0,
                                                                      autoPlay:
                                                                          false,
                                                                      looping:
                                                                          true,
                                                                      showControls:
                                                                          true,
                                                                      allowFullScreen:
                                                                          true,
                                                                      allowPlaybackSpeedMenu:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }
                              },
                            );
                          }).addToEnd(SizedBox(
                              height: valueOrDefault(
                                              currentUserDocument?.uploadedPic,
                                              '') !=
                                          ''
                                  ? 220.0
                                  : 120.0)),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (valueOrDefault(
                                    currentUserDocument?.uploadedPic, '') !=
                                '')
                          AuthUserStreamWidget(
                            builder: (context) => Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      controller: _model.images,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FlutterFlowMediaDisplay(
                                            path: valueOrDefault(
                                                currentUserDocument
                                                    ?.uploadedPic,
                                                ''),
                                            imageBuilder: (path) => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    const Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    const Duration(milliseconds: 500),
                                                imageUrl: path,
                                                width: 120.0,
                                                height: 100.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            videoPlayerBuilder: (path) =>
                                                FlutterFlowVideoPlayer(
                                              path: path,
                                              width: 300.0,
                                              autoPlay: false,
                                              looping: true,
                                              showControls: true,
                                              allowFullScreen: true,
                                              allowPlaybackSpeedMenu: false,
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: FlutterFlowIconButton(
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              borderRadius: 20.0,
                                              borderWidth: 2.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              icon: Icon(
                                                Icons.delete_outline_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'uploaded_pic':
                                                          FieldValue.delete(),
                                                    },
                                                  ),
                                                });
                                              },
                                            ),
                                          ),
                                        ]
                                            .divide(const SizedBox(width: 8.0))
                                            .addToStart(const SizedBox(width: 16.0))
                                            .addToEnd(const SizedBox(width: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primary,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  icon: Icon(
                                    Icons.add,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isDataUploading = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        _model.isDataUploading = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl =
                                              downloadUrls.first;
                                        });
                                      } else {
                                        setState(() {});
                                        return;
                                      }
                                    }

                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      uploadedPic: _model.uploadedFileUrl,
                                    ));
                                  },
                                ),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: _model.textController,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            autofocus: true,
                                            textCapitalization:
                                                TextCapitalization.sentences,
                                            textInputAction:
                                                TextInputAction.send,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'Start typing here...',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              errorStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          56.0, 16.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                            maxLines: 3,
                                            minLines: 1,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 6.0, 4.0),
                                          child: FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            icon: Icon(
                                              Icons.send_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              final firestoreBatch =
                                                  FirebaseFirestore.instance
                                                      .batch();
                                              try {
                                                if (_model.formKey
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                                // newChatMessage

                                                var cardMessagesRecordReference =
                                                    CardMessagesRecord
                                                        .createDoc(
                                                            widget.chatRef!);
                                                firestoreBatch.set(
                                                    cardMessagesRecordReference,
                                                    createCardMessagesRecordData(
                                                      text: _model
                                                          .textController.text,
                                                      timestamp:
                                                          getCurrentTimestamp,
                                                      senderRef:
                                                          currentUserReference,
                                                      image: valueOrDefault(
                                                          currentUserDocument
                                                              ?.uploadedPic,
                                                          ''),
                                                    ));
                                                _model.newMessage = CardMessagesRecord
                                                    .getDocumentFromData(
                                                        createCardMessagesRecordData(
                                                          text: _model
                                                              .textController
                                                              .text,
                                                          timestamp:
                                                              getCurrentTimestamp,
                                                          senderRef:
                                                              currentUserReference,
                                                          image: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.uploadedPic,
                                                              ''),
                                                        ),
                                                        cardMessagesRecordReference);

                                                firestoreBatch.update(
                                                    currentUserReference!, {
                                                  ...mapToFirestore(
                                                    {
                                                      'uploaded_pic':
                                                          FieldValue.delete(),
                                                    },
                                                  ),
                                                });

                                                firestoreBatch.update(
                                                    widget.chatRef!,
                                                    createCardsRecordData(
                                                      lastMessage: _model
                                                          .newMessage?.text,
                                                    ));

                                                firestoreBatch.update(
                                                    widget.chatRef!,
                                                    createCardsRecordData(
                                                      lastMessageTime:
                                                          getCurrentTimestamp,
                                                    ));
                                                if (_model.newMessage?.image !=
                                                        null &&
                                                    _model.newMessage?.image !=
                                                        '') {
                                                  firestoreBatch.update(
                                                      widget.chatRef!,
                                                      createCardsRecordData(
                                                        hasImage: true,
                                                      ));
                                                } else {
                                                  firestoreBatch.update(
                                                      widget.chatRef!,
                                                      createCardsRecordData(
                                                        hasImage: false,
                                                      ));
                                                }

                                                setState(() {
                                                  _model.textController
                                                      ?.clear();
                                                });
                                              } finally {
                                                await firestoreBatch.commit();
                                              }

                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
