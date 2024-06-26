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
    return StreamBuilder<CardsRecord>(
      stream: CardsRecord.getDocument(widget.chatRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final cardChatCardsRecord = snapshot.data!;
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
                                  cardChatCardsRecord.cardcover,
                                  'https://hips.hearstapps.com/hmg-prod/images/spring-flowers-65de4a13478ee.jpg?crop=0.668xw:1.00xh;0.287xw,0&resize=640:*',
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
                      cardChatCardsRecord.name,
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
                      builder: (context) =>
                          StreamBuilder<List<CardMessagesRecord>>(
                        stream: queryCardMessagesRecord(
                          parent: widget.chatRef,
                          queryBuilder: (cardMessagesRecord) =>
                              cardMessagesRecord.orderBy('timestamp'),
                        )..listen((snapshot) {
                            List<CardMessagesRecord>
                                columnCardMessagesRecordList = snapshot;
                            if (_model.columnPreviousSnapshot != null &&
                                !const ListEquality(
                                        CardMessagesRecordDocumentEquality())
                                    .equals(columnCardMessagesRecordList,
                                        _model.columnPreviousSnapshot)) {
                              () async {
                                await _model.columnController?.animateTo(
                                  _model.columnController!.position
                                      .maxScrollExtent,
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.ease,
                                );

                                setState(() {});
                              }();
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
                          List<CardMessagesRecord>
                              columnCardMessagesRecordList = snapshot.data!;
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
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 12.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 8.0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                        'd/M h:mm a',
                                                        columnCardMessagesRecord
                                                            .timestamp!),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 3.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          1.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        const BorderRadius.only(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
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
                                                                letterSpacing:
                                                                    0.0,
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
                                                                  imageUrl:
                                                                      path,
                                                                  width: 300.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              videoPlayerBuilder:
                                                                  (path) =>
                                                                      FlutterFlowVideoPlayer(
                                                                path: path,
                                                                width: 300.0,
                                                                autoPlay: false,
                                                                looping: true,
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
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 1.0),
                                        child: StreamBuilder<UsersRecord>(
                                          stream: UsersRecord.getDocument(
                                              columnCardMessagesRecord
                                                  .senderRef!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 12.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  8.0,
                                                                  16.0),
                                                      child: Container(
                                                        width: 36.0,
                                                        height: 36.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  2.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
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
                                                                  MainAxisSize
                                                                      .max,
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
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
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
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                )),
                                                                SelectionArea(
                                                                    child:
                                                                        AutoSizeText(
                                                                  ' ',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                )),
                                                                Text(
                                                                  dateTimeFormat(
                                                                      'd/M h:mm a',
                                                                      columnCardMessagesRecord
                                                                          .timestamp!),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  blurRadius:
                                                                      3.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    1.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        12.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
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
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                                              BorderRadius.circular(8.0),
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
                                                                            fit:
                                                                                BoxFit.cover,
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
                                                  currentUserDocument
                                                      ?.uploadedPic,
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
                                                imageBuilder: (path) =>
                                                    ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: const Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: const Duration(
                                                        milliseconds: 500),
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                  borderRadius: 20.0,
                                                  borderWidth: 2.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  icon: Icon(
                                                    Icons
                                                        .delete_outline_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'uploaded_pic':
                                                              FieldValue
                                                                  .delete(),
                                                        },
                                                      ),
                                                    });
                                                  },
                                                ),
                                              ),
                                            ]
                                                .divide(const SizedBox(width: 8.0))
                                                .addToStart(
                                                    const SizedBox(width: 16.0))
                                                .addToEnd(
                                                    const SizedBox(width: 16.0)),
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
                                          setState(() =>
                                              _model.isDataUploading = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
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
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller:
                                                    _model.textController,
                                                focusNode:
                                                    _model.textFieldFocusNode,
                                                autofocus: true,
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                                textInputAction:
                                                    TextInputAction.send,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText:
                                                      'Start typing here...',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  errorStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(16.0, 16.0,
                                                              56.0, 16.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 6.0, 4.0),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                        !_model.formKey
                                                            .currentState!
                                                            .validate()) {
                                                      return;
                                                    }
                                                    // newChatMessage

                                                    var cardMessagesRecordReference =
                                                        CardMessagesRecord
                                                            .createDoc(widget
                                                                .chatRef!);
                                                    firestoreBatch.set(
                                                        cardMessagesRecordReference,
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
                                                        ));
                                                    _model.newMessage =
                                                        CardMessagesRecord
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
                                                              FieldValue
                                                                  .delete(),
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
                                                    if (_model.newMessage
                                                                ?.image !=
                                                            null &&
                                                        _model.newMessage
                                                                ?.image !=
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
                                                    await firestoreBatch
                                                        .commit();
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
      },
    );
  }
}
