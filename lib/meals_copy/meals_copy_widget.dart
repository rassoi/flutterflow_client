import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MealsCopyWidget extends StatefulWidget {
  const MealsCopyWidget({
    Key key,
    this.hg,
  }) : super(key: key);

  final String hg;

  @override
  _MealsCopyWidgetState createState() => _MealsCopyWidgetState();
}

class _MealsCopyWidgetState extends State<MealsCopyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MealsCopy'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Text(
          'Ingredients',
          style: FlutterFlowTheme.of(context).title2,
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                                snapshot.data;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data.isEmpty) {
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
                                      rowTimestampRecord.lastAudit),
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
                                snapshot.data;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data.isEmpty) {
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
                                  dateTimeFormat(
                                      'M/d h:mm a', rowTimestampRecord.lastBuy),
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
                            snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
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
                                logFirebaseEvent(
                                    'MEALS_COPY_PAGE_BUY_BTN_ON_TAP');
                                logFirebaseEvent('Button_Backend-Call');

                                final timestampUpdateData =
                                    createTimestampRecordData(
                                  lastBuy: functions.geCurrentTimeStamp(),
                                );
                                await columnTimestampRecord.reference
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
                                borderRadius: 12,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              Text(
                'Unavaialble',
                style: FlutterFlowTheme.of(context).subtitle2,
              ),
              Expanded(
                child: StreamBuilder<List<MealIngredRecord>>(
                  stream: queryMealIngredRecord(
                    queryBuilder: (mealIngredRecord) => mealIngredRecord
                        .where('status', isEqualTo: 'unavailable')
                        .where('user_uid', isEqualTo: FFAppState().user)
                        .where('meal_count', isGreaterThan: 0),
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
                    List<MealIngredRecord> listViewMealIngredRecordList =
                        snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewMealIngredRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewMealIngredRecord =
                            listViewMealIngredRecordList[listViewIndex];
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
                                expandableTimestampRecordList = snapshot.data;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data.isEmpty) {
                              return Container();
                            }
                            final expandableTimestampRecord =
                                expandableTimestampRecordList.isNotEmpty
                                    ? expandableTimestampRecordList.first
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
                                          listViewMealIngredRecord.english,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 30, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'MEALS_COPY_PAGE_Icon_3361evjo_ON_TAP');
                                            logFirebaseEvent(
                                                'Icon_Backend-Call');

                                            final mealIngredUpdateData =
                                                createMealIngredRecordData(
                                              status: 'available',
                                            );
                                            await listViewMealIngredRecord
                                                .reference
                                                .update(mealIngredUpdateData);
                                            logFirebaseEvent(
                                                'Icon_Backend-Call');

                                            final timestampUpdateData =
                                                createTimestampRecordData(
                                              lastAudit: functions
                                                  .geCurrentTimeStamp(),
                                            );
                                            await expandableTimestampRecord
                                                .reference
                                                .update(timestampUpdateData);
                                          },
                                          child: Icon(
                                            Icons.clear,
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
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Hindi Name: ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0x8A000000),
                                                ),
                                          ),
                                          Text(
                                            listViewMealIngredRecord.hindi,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Used in : ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          Text(
                                            functions.recipeList(
                                                listViewMealIngredRecord
                                                    .recipeNames
                                                    .toList()),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Image.network(
                                          'https://picsum.photos/seed/829/600',
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                        ExpandablePanelHeaderAlignment.center,
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
              Text(
                'Available',
                style: FlutterFlowTheme.of(context).subtitle2,
              ),
              Expanded(
                child: StreamBuilder<List<MealIngredRecord>>(
                  stream: queryMealIngredRecord(
                    queryBuilder: (mealIngredRecord) => mealIngredRecord
                        .where('status', isEqualTo: 'available')
                        .where('user_uid', isEqualTo: FFAppState().user)
                        .where('meal_count', isGreaterThan: 0),
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
                    List<MealIngredRecord> listViewMealIngredRecordList =
                        snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewMealIngredRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewMealIngredRecord =
                            listViewMealIngredRecordList[listViewIndex];
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
                                      listViewMealIngredRecord.english,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 30, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'MEALS_COPY_PAGE_Icon_qggpj43x_ON_TAP');
                                        logFirebaseEvent('Icon_Backend-Call');

                                        final mealIngredUpdateData =
                                            createMealIngredRecordData(
                                          status: 'unavailable',
                                        );
                                        await listViewMealIngredRecord.reference
                                            .update(mealIngredUpdateData);
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
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Hindi Name: ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0x8A000000),
                                            ),
                                      ),
                                      Text(
                                        listViewMealIngredRecord.hindi,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Used in : ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Text(
                                        functions.recipeList(
                                            listViewMealIngredRecord.recipeNames
                                                .toList()),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Image.network(
                                      'https://picsum.photos/seed/829/600',
                                      width: MediaQuery.of(context).size.width,
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
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: true,
                              ),
                            ),
                          ),
                        );
                      },
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
