import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_swipeable_stack.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class IngredientsWidget extends StatefulWidget {
  const IngredientsWidget({Key? key}) : super(key: key);

  @override
  _IngredientsWidgetState createState() => _IngredientsWidgetState();
}

class _IngredientsWidgetState extends State<IngredientsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late SwipeableCardSectionController swipeableStackController;

  @override
  void initState() {
    super.initState();
    swipeableStackController = SwipeableCardSectionController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
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
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Last Audit',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                        StreamBuilder<List<TimestampRecord>>(
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
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Last buy',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                        StreamBuilder<List<TimestampRecord>>(
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
                                      rowTimestampRecord!.lastBuy!),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
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
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                final timestampUpdateData =
                                    createTimestampRecordData(
                                  lastBuy: functions.geCurrentTimeStamp(),
                                );
                                await columnTimestampRecord!.reference
                                    .update(timestampUpdateData);
                              },
                              text: 'Buy',
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
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
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: StreamBuilder<List<MealIngredRecord>>(
                  stream: queryMealIngredRecord(
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
                    List<MealIngredRecord> tabBarMealIngredRecordList =
                        snapshot.data!;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final tabBarMealIngredRecord =
                        tabBarMealIngredRecordList.isNotEmpty
                            ? tabBarMealIngredRecordList.first
                            : null;
                    return DefaultTabController(
                      length: 3,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            labelColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            labelStyle: FlutterFlowTheme.of(context).bodyText1,
                            indicatorColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            tabs: [
                              Tab(
                                text: 'Audit',
                              ),
                              Tab(
                                text: 'Unavaialble',
                              ),
                              Tab(
                                text: 'Available',
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                StreamBuilder<List<TimestampRecord>>(
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
                                    List<TimestampRecord>
                                        stackTimestampRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the document does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final stackTimestampRecord =
                                        stackTimestampRecordList.isNotEmpty
                                            ? stackTimestampRecordList.first
                                            : null;
                                    return Stack(
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: StreamBuilder<
                                              List<MealIngredRecord>>(
                                            stream: queryMealIngredRecord(
                                              queryBuilder:
                                                  (mealIngredRecord) =>
                                                      mealIngredRecord
                                                          .where('user_uid',
                                                              isEqualTo:
                                                                  FFAppState()
                                                                      .user)
                                                          .where('status',
                                                              isEqualTo:
                                                                  'unavailable')
                                                          .where('meal_count',
                                                              isGreaterThan: 0)
                                                          .where('audit',
                                                              isEqualTo: 0),
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
                                                  swipeableStackMealIngredRecordList =
                                                  snapshot.data!;
                                              return FlutterFlowSwipeableStack(
                                                topCardHeightFraction: 0.82,
                                                middleCardHeightFraction: 0.68,
                                                botttomCardHeightFraction: 0.75,
                                                topCardWidthFraction: 0.9,
                                                middleCardWidthFraction: 0.85,
                                                botttomCardWidthFraction: 0.8,
                                                onSwipeFn: (index) {},
                                                onLeftSwipe: (index) async {
                                                  final mealIngredUpdateData =
                                                      createMealIngredRecordData(
                                                    audit: 1,
                                                    status: 'unavailable',
                                                  );
                                                  await tabBarMealIngredRecord!
                                                      .reference
                                                      .update(
                                                          mealIngredUpdateData);

                                                  final timestampUpdateData =
                                                      createTimestampRecordData(
                                                    lastAudit: functions
                                                        .geCurrentTimeStamp(),
                                                  );
                                                  await stackTimestampRecord!
                                                      .reference
                                                      .update(
                                                          timestampUpdateData);
                                                },
                                                onRightSwipe: (index) async {
                                                  final mealIngredUpdateData =
                                                      createMealIngredRecordData(
                                                    audit: 1,
                                                    status: 'available',
                                                  );
                                                  await tabBarMealIngredRecord!
                                                      .reference
                                                      .update(
                                                          mealIngredUpdateData);

                                                  final timestampUpdateData =
                                                      createTimestampRecordData(
                                                    lastAudit: functions
                                                        .geCurrentTimeStamp(),
                                                  );
                                                  await stackTimestampRecord!
                                                      .reference
                                                      .update(
                                                          timestampUpdateData);
                                                },
                                                onUpSwipe: (index) {},
                                                onDownSwipe: (index) {},
                                                itemBuilder: (context,
                                                    swipeableStackIndex) {
                                                  final swipeableStackMealIngredRecord =
                                                      swipeableStackMealIngredRecordList[
                                                          swipeableStackIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 30),
                                                    child: Card(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      color: Color(0xFFF5F5F5),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 3),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Image.network(
                                                              swipeableStackMealIngredRecord
                                                                  .img!,
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.4,
                                                              fit: BoxFit.cover,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                swipeableStackMealIngredRecord
                                                                    .english!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                            Text(
                                                              swipeableStackMealIngredRecord
                                                                  .hindi!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                            Text(
                                                              'Used In : ${functions.recipeList(swipeableStackMealIngredRecord.recipeNames!.toList())}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .cancel_sharp,
                                                                  color: Color(
                                                                      0xFFD92319),
                                                                  size: 36,
                                                                ),
                                                                Container(
                                                                  width: 100,
                                                                  height: 20,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .thumb_up,
                                                                  color: Color(
                                                                      0xFF39D256),
                                                                  size: 36,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                itemCount:
                                                    swipeableStackMealIngredRecordList
                                                        .length,
                                                controller:
                                                    swipeableStackController,
                                                enableSwipeUp: false,
                                                enableSwipeDown: false,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child:
                                          StreamBuilder<List<MealIngredRecord>>(
                                        stream: queryMealIngredRecord(
                                          queryBuilder: (mealIngredRecord) =>
                                              mealIngredRecord
                                                  .where('status',
                                                      isEqualTo: 'unavailable')
                                                  .where('user_uid',
                                                      isEqualTo:
                                                          FFAppState().user)
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
                                                listViewMealIngredRecordList
                                                    .length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewMealIngredRecord =
                                                  listViewMealIngredRecordList[
                                                      listViewIndex];
                                              return StreamBuilder<
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
                                                          color:
                                                              Color(0xFF8783B0),
                                                          size: 50,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<TimestampRecord>
                                                      expandableTimestampRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the document does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final expandableTimestampRecord =
                                                      expandableTimestampRecordList
                                                              .isNotEmpty
                                                          ? expandableTimestampRecordList
                                                              .first
                                                          : null;
                                                  return Container(
                                                    width: double.infinity,
                                                    color: Colors.white,
                                                    child: ExpandableNotifier(
                                                      initialExpanded: false,
                                                      child: ExpandablePanel(
                                                        header: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              flex: 4,
                                                              child: Text(
                                                                listViewMealIngredRecord
                                                                    .english!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          30,
                                                                          0),
                                                              child: InkWell(
                                                                onTap:
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

                                                                  final timestampUpdateData =
                                                                      createTimestampRecordData(
                                                                    lastAudit:
                                                                        functions
                                                                            .geCurrentTimeStamp(),
                                                                  );
                                                                  await expandableTimestampRecord!
                                                                      .reference
                                                                      .update(
                                                                          timestampUpdateData);
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 24,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        collapsed: Container(),
                                                        expanded: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Hindi Name: ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Color(
                                                                            0x8A000000),
                                                                      ),
                                                                ),
                                                                Text(
                                                                  listViewMealIngredRecord
                                                                      .hindi!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Used in : ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                                Text(
                                                                  functions.recipeList(
                                                                      listViewMealIngredRecord
                                                                          .recipeNames!
                                                                          .toList()),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                              child:
                                                                  Image.network(
                                                                listViewMealIngredRecord
                                                                    .img!,
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                height: 100,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        theme:
                                                            ExpandableThemeData(
                                                          tapHeaderToExpand:
                                                              true,
                                                          tapBodyToExpand:
                                                              false,
                                                          tapBodyToCollapse:
                                                              false,
                                                          headerAlignment:
                                                              ExpandablePanelHeaderAlignment
                                                                  .center,
                                                          hasIcon: true,
                                                        ),
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
                                  ],
                                ),
                                StreamBuilder<List<MealIngredRecord>>(
                                  stream: queryMealIngredRecord(
                                    queryBuilder: (mealIngredRecord) =>
                                        mealIngredRecord
                                            .where('status',
                                                isEqualTo: 'available')
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
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewMealIngredRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewMealIngredRecord =
                                            listViewMealIngredRecordList[
                                                listViewIndex];
                                        return Container(
                                          width: double.infinity,
                                          color: Colors.white,
                                          child: ExpandableNotifier(
                                            initialExpanded: false,
                                            child: ExpandablePanel(
                                              header: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: Text(
                                                      listViewMealIngredRecord
                                                          .english!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 30, 0),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        final mealIngredUpdateData =
                                                            createMealIngredRecordData(
                                                          status: 'unavailable',
                                                        );
                                                        await listViewMealIngredRecord
                                                            .reference
                                                            .update(
                                                                mealIngredUpdateData);
                                                      },
                                                      child: Icon(
                                                        Icons.done,
                                                        color: Colors.black,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              collapsed: Container(),
                                              expanded: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Hindi Name: ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0x8A000000),
                                                                ),
                                                      ),
                                                      Text(
                                                        listViewMealIngredRecord
                                                            .hindi!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Used in : ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                      Text(
                                                        functions.recipeList(
                                                            listViewMealIngredRecord
                                                                .recipeNames!
                                                                .toList()),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Image.network(
                                                      listViewMealIngredRecord
                                                          .img!,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              theme: ExpandableThemeData(
                                                tapHeaderToExpand: true,
                                                tapBodyToExpand: false,
                                                tapBodyToCollapse: false,
                                                headerAlignment:
                                                    ExpandablePanelHeaderAlignment
                                                        .center,
                                                hasIcon: true,
                                              ),
                                            ),
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
