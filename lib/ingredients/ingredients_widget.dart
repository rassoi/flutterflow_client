import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/popup_ingred_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class IngredientsWidget extends StatefulWidget {
  const IngredientsWidget({Key? key}) : super(key: key);

  @override
  _IngredientsWidgetState createState() => _IngredientsWidgetState();
}

class _IngredientsWidgetState extends State<IngredientsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFF72E6C1),
        automaticallyImplyLeading: false,
        title: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Text(
            'Ingredients',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22,
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.45, 0),
                                child: Text(
                                  'Last Audit',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .black600,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0.25),
                            child: StreamBuilder<List<TimestampRecord>>(
                              stream: queryTimestampRecord(
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitThreeBounce(
                                        color: Color(0xFF8783B0),
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<TimestampRecord> rowTimestampRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the document does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final rowTimestampRecord =
                                    rowTimestampRecordList.isNotEmpty
                                        ? rowTimestampRecordList.first
                                        : null;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      dateTimeFormat('M/d h:mm a',
                                          rowTimestampRecord!.lastAudit!),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .black600,
                                          ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0, 0.2),
                        child: StreamBuilder<List<TimestampRecord>>(
                          stream: queryTimestampRecord(
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SpinKitThreeBounce(
                                    color: Color(0xFF8783B0),
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                            List<TimestampRecord> columnTimestampRecordList =
                                snapshot.data!;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final columnTimestampRecord =
                                columnTimestampRecordList.isNotEmpty
                                    ? columnTimestampRecordList.first
                                    : null;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.85, -0.2),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: 'Buy',
                                    options: FFButtonOptions(
                                      width: 90,
                                      height: 40,
                                      color: Color(0xFF72E6C1),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: FlutterFlowTheme.of(context).black600,
                        labelStyle: FlutterFlowTheme.of(context).bodyText1,
                        indicatorColor: Color(0xFF101213),
                        tabs: [
                          StreamBuilder<List<MealIngredRecord>>(
                            stream: queryMealIngredRecord(
                              queryBuilder: (mealIngredRecord) =>
                                  mealIngredRecord
                                      .where('user_uid',
                                          isEqualTo: FFAppState().user)
                                      .where('meal_count', isGreaterThan: 0)
                                      .where('status', isEqualTo: 'unavailable')
                                      .where('audit', isEqualTo: 0),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitThreeBounce(
                                      color: Color(0xFF8783B0),
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              List<MealIngredRecord> tabMealIngredRecordList =
                                  snapshot.data!;
                              return Tab(
                                text:
                                    'Audit(${tabMealIngredRecordList.length.toString()})',
                              );
                            },
                          ),
                          StreamBuilder<List<MealIngredRecord>>(
                            stream: queryMealIngredRecord(
                              queryBuilder: (mealIngredRecord) =>
                                  mealIngredRecord
                                      .where('user_uid',
                                          isEqualTo: FFAppState().user)
                                      .where('meal_count', isGreaterThan: 0)
                                      .where('status', isEqualTo: 'unavailable')
                                      .where('audit', isEqualTo: 1),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitThreeBounce(
                                      color: Color(0xFF8783B0),
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              List<MealIngredRecord> tabMealIngredRecordList =
                                  snapshot.data!;
                              return Tab(
                                text:
                                    'UnAvail (${tabMealIngredRecordList.length.toString()})',
                              );
                            },
                          ),
                          StreamBuilder<List<MealIngredRecord>>(
                            stream: queryMealIngredRecord(
                              queryBuilder: (mealIngredRecord) =>
                                  mealIngredRecord
                                      .where('user_uid',
                                          isEqualTo: FFAppState().user)
                                      .where('meal_count', isGreaterThan: 0)
                                      .where('status', isEqualTo: 'available')
                                      .where('audit', isEqualTo: 1),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitThreeBounce(
                                      color: Color(0xFF8783B0),
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              List<MealIngredRecord> tabMealIngredRecordList =
                                  snapshot.data!;
                              return Tab(
                                text:
                                    'Availa (${tabMealIngredRecordList.length.toString()})',
                              );
                            },
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            StreamBuilder<List<MealIngredRecord>>(
                              stream: queryMealIngredRecord(
                                queryBuilder: (mealIngredRecord) =>
                                    mealIngredRecord.where('user_uid',
                                        isEqualTo: FFAppState().user),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitThreeBounce(
                                        color: Color(0xFF8783B0),
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<MealIngredRecord>
                                    containerMealIngredRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: StreamBuilder<List<MealIngredRecord>>(
                                    stream: queryMealIngredRecord(
                                      queryBuilder: (mealIngredRecord) =>
                                          mealIngredRecord
                                              .where('user_uid',
                                                  isEqualTo: FFAppState().user)
                                              .where('meal_count',
                                                  isGreaterThan: 0)
                                              .where('status',
                                                  isEqualTo: 'unavailable')
                                              .where('audit', isEqualTo: 0),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: SpinKitThreeBounce(
                                              color: Color(0xFF8783B0),
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      List<MealIngredRecord>
                                          listViewMealIngredRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewMealIngredRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewMealIngredRecord =
                                              listViewMealIngredRecordList[
                                                  listViewIndex];
                                          return Container(
                                            width: 100,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.75,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.45,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                listViewMealIngredRecord
                                                                    .img!,
                                                            width:
                                                                double.infinity,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.4,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0.35),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30,
                                                            borderWidth: 1,
                                                            buttonSize: 60,
                                                            icon: Icon(
                                                              Icons
                                                                  .info_outlined,
                                                              color: Color(
                                                                  0xFF72E6C1),
                                                              size: 30,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery.of(
                                                                            context)
                                                                        .viewInsets,
                                                                    child:
                                                                        PopupIngredWidget(
                                                                      ingreInfo:
                                                                          listViewMealIngredRecord
                                                                              .reference,
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.35, 0),
                                                          child: Text(
                                                            listViewMealIngredRecord
                                                                .english!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayIcon,
                                                                  fontSize: 20,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          listViewMealIngredRecord
                                                              .hindi!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .grayIcon,
                                                                fontSize: 20,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                StreamBuilder<
                                                    List<TimestampRecord>>(
                                                  stream: queryTimestampRecord(
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              SpinKitThreeBounce(
                                                            color: Color(
                                                                0xFF8783B0),
                                                            size: 50,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<TimestampRecord>
                                                        rowTimestampRecordList =
                                                        snapshot.data!;
                                                    // Return an empty Container when the document does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final rowTimestampRecord =
                                                        rowTimestampRecordList
                                                                .isNotEmpty
                                                            ? rowTimestampRecordList
                                                                .first
                                                            : null;
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 30,
                                                              borderWidth: 1,
                                                              buttonSize: 90,
                                                              icon: Icon(
                                                                Icons.close,
                                                                color: Color(
                                                                    0xFFD92319),
                                                                size: 30,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                final mealIngredUpdateData =
                                                                    createMealIngredRecordData(
                                                                  audit: 1,
                                                                  status:
                                                                      'available',
                                                                );
                                                                await listViewMealIngredRecord
                                                                    .reference
                                                                    .update(
                                                                        mealIngredUpdateData);

                                                                final timestampUpdateData =
                                                                    createTimestampRecordData(
                                                                  lastAudit:
                                                                      functions
                                                                          .geCurrentTimeStamp(),
                                                                );
                                                                await rowTimestampRecord!
                                                                    .reference
                                                                    .update(
                                                                        timestampUpdateData);
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 30,
                                                              borderWidth: 1,
                                                              buttonSize: 60,
                                                              icon: Icon(
                                                                Icons.done,
                                                                color: Color(
                                                                    0xFF39D256),
                                                                size: 30,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                final mealIngredUpdateData =
                                                                    createMealIngredRecordData(
                                                                  status:
                                                                      'unavailable',
                                                                  audit: 1,
                                                                );
                                                                await listViewMealIngredRecord
                                                                    .reference
                                                                    .update(
                                                                        mealIngredUpdateData);

                                                                final timestampUpdateData =
                                                                    createTimestampRecordData(
                                                                  lastAudit:
                                                                      functions
                                                                          .geCurrentTimeStamp(),
                                                                );
                                                                await rowTimestampRecord!
                                                                    .reference
                                                                    .update(
                                                                        timestampUpdateData);
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: StreamBuilder<List<MealIngredRecord>>(
                                    stream: queryMealIngredRecord(
                                      queryBuilder: (mealIngredRecord) =>
                                          mealIngredRecord
                                              .where('status',
                                                  isEqualTo: 'unavailable')
                                              .where('user_uid',
                                                  isEqualTo: FFAppState().user)
                                              .where('meal_count',
                                                  isGreaterThan: 0)
                                              .where('audit', isEqualTo: 1),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: SpinKitThreeBounce(
                                              color: Color(0xFF8783B0),
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      List<MealIngredRecord>
                                          listViewMealIngredRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewMealIngredRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewMealIngredRecord =
                                              listViewMealIngredRecordList[
                                                  listViewIndex];
                                          return Container(
                                            width: 100,
                                            height: 130,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                listViewMealIngredRecord
                                                                    .english!,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          5),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  final mealIngredUpdateData =
                                                                      createMealIngredRecordData(
                                                                    status:
                                                                        'available',
                                                                  );
                                                                  await listViewMealIngredRecord
                                                                      .reference
                                                                      .update(
                                                                          mealIngredUpdateData);
                                                                },
                                                                text:
                                                                    'Move  to Avalable',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 160,
                                                                  height: 40,
                                                                  color: Color(
                                                                      0xFF807F8B),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return Padding(
                                                                        padding:
                                                                            MediaQuery.of(context).viewInsets,
                                                                        child:
                                                                            PopupIngredWidget(
                                                                          ingreInfo:
                                                                              listViewMealIngredRecord.reference,
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));
                                                                },
                                                                child: Icon(
                                                                  Icons.info,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 24,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 5, 5, 0),
                                                        child: Image.network(
                                                          listViewMealIngredRecord
                                                              .img!,
                                                          width:
                                                              double.infinity,
                                                          height: 120,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            StreamBuilder<List<MealIngredRecord>>(
                              stream: queryMealIngredRecord(
                                queryBuilder: (mealIngredRecord) =>
                                    mealIngredRecord
                                        .where('status', isEqualTo: 'available')
                                        .where('user_uid',
                                            isEqualTo: FFAppState().user)
                                        .where('meal_count', isGreaterThan: 0)
                                        .where('audit', isEqualTo: 1),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitThreeBounce(
                                        color: Color(0xFF8783B0),
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<MealIngredRecord>
                                    listViewMealIngredRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewMealIngredRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewMealIngredRecord =
                                        listViewMealIngredRecordList[
                                            listViewIndex];
                                    return Container(
                                      width: 100,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          listViewMealIngredRecord
                                                              .english!,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5, 0, 0, 5),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            final mealIngredUpdateData =
                                                                createMealIngredRecordData(
                                                              status:
                                                                  'unavailable',
                                                            );
                                                            await listViewMealIngredRecord
                                                                .reference
                                                                .update(
                                                                    mealIngredUpdateData);
                                                          },
                                                          text:
                                                              'Move  to Unavalable',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 170,
                                                            height: 40,
                                                            color: Color(
                                                                0xFF807F8B),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: InkWell(
                                                          onTap: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      PopupIngredWidget(
                                                                    ingreInfo:
                                                                        listViewMealIngredRecord
                                                                            .reference,
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          child: Icon(
                                                            Icons.info,
                                                            color: Colors.black,
                                                            size: 24,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 5, 0),
                                                  child: Image.network(
                                                    listViewMealIngredRecord
                                                        .img!,
                                                    width: double.infinity,
                                                    height: 120,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
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
    );
  }
}
