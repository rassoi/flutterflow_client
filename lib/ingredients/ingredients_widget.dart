import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Ingredients',
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
                              onPressed: () {
                                print('Button pressed ...');
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
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: FlutterFlowTheme.of(context).primaryColor,
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
                            Container(
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
                                          .where('meal_count', isGreaterThan: 0)
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
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.75,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.45,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            listViewMealIngredRecord
                                                                .img!,
                                                        width: double.infinity,
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
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  listViewMealIngredRecord
                                                      .english!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  listViewMealIngredRecord
                                                      .hindi!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
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
                                                      child: SpinKitThreeBounce(
                                                        color:
                                                            Color(0xFF8783B0),
                                                        size: 50,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<TimestampRecord>
                                                    rowTimestampRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the document does not exist.
                                                if (snapshot.data!.isEmpty) {
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
                                                      MainAxisAlignment.center,
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
                                                          buttonSize: 60,
                                                          icon: Icon(
                                                            Icons.close,
                                                            color: Color(
                                                                0xFFD92319),
                                                            size: 30,
                                                          ),
                                                          onPressed: () async {
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
                                                              lastAudit: functions
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
                                                    Container(
                                                      width: 100,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
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
                                                          onPressed: () async {
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
                                                              lastAudit: functions
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
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Used in : ${functions.recipeList(listViewMealIngredRecord.recipeNames!.toList())}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ],
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final recipeList =
                                                    listViewMealIngredRecord
                                                        .recipeNames!
                                                        .toList();
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: recipeList.length,
                                                  itemBuilder: (context,
                                                      recipeListIndex) {
                                                    final recipeListItem =
                                                        recipeList[
                                                            recipeListIndex];
                                                    return SelectionArea(
                                                        child: Text(
                                                      recipeListItem,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ));
                                                  },
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
                                                    child: SpinKitThreeBounce(
                                                      color: Color(0xFF8783B0),
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
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle2,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 30, 0),
                                                          child: InkWell(
                                                            onTap: () async {
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
                                                                lastAudit: functions
                                                                    .geCurrentTimeStamp(),
                                                              );
                                                              await expandableTimestampRecord!
                                                                  .reference
                                                                  .update(
                                                                      timestampUpdateData);
                                                            },
                                                            child: Icon(
                                                              Icons.clear,
                                                              color:
                                                                  Colors.black,
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
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Hindi Name: ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                            Text(
                                                              functions.recipeList(
                                                                  listViewMealIngredRecord
                                                                      .recipeNames!
                                                                      .toList()),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 0, 0),
                                                          child: Image.network(
                                                            listViewMealIngredRecord
                                                                .img!,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
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
                                    return StreamBuilder<List<TimestampRecord>>(
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

                                                        final timestampUpdateData =
                                                            createTimestampRecordData(
                                                          lastAudit: functions
                                                              .geCurrentTimeStamp(),
                                                        );
                                                        await expandableTimestampRecord!
                                                            .reference
                                                            .update(
                                                                timestampUpdateData);
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
