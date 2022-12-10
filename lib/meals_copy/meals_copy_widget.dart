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
import 'package:provider/provider.dart';

class MealsCopyWidget extends StatefulWidget {
  const MealsCopyWidget({
    Key? key,
    this.hg,
  }) : super(key: key);

  final String? hg;

  @override
  _MealsCopyWidgetState createState() => _MealsCopyWidgetState();
}

class _MealsCopyWidgetState extends State<MealsCopyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFF72E6C1),
        automaticallyImplyLeading: true,
        title: Text(
          'Ingredients',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: Row(
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    160, 0, 0, 0),
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
                            alignment: AlignmentDirectional(0.1, 0.3),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
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
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.15, -0.3),
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: 'Copy',
                                          options: FFButtonOptions(
                                            width: 90,
                                            height: 40,
                                            color: Color(0xFF72E6C1),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0.3, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  45, 0, 0, 0),
                                          child: Text(
                                            dateTimeFormat('M/d h:mm a',
                                                rowTimestampRecord!.lastAudit!),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .black600,
                                                ),
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
                              Align(
                                alignment: AlignmentDirectional(0.8, 0.2),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 21, 0, 0),
                                  child: FFButtonWidget(
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
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<List<MiscellaneousRecord>>(
                stream: queryMiscellaneousRecord(
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
                  List<MiscellaneousRecord> rowMiscellaneousRecordList =
                      snapshot.data!;
                  // Return an empty Container when the document does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final rowMiscellaneousRecord =
                      rowMiscellaneousRecordList.isNotEmpty
                          ? rowMiscellaneousRecordList.first
                          : null;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Unavaialble',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).black600,
                              fontSize: 17,
                            ),
                      ),
                      Text(
                        ' (',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).black600,
                              fontSize: 18,
                            ),
                      ),
                      Text(
                        ')',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).black600,
                              fontSize: 18,
                            ),
                      ),
                    ],
                  );
                },
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
                        snapshot.data!;
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
                                expandableTimestampRecordList = snapshot.data!;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data!.isEmpty) {
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
                                          listViewMealIngredRecord.english!,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .black600,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 30, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            final mealIngredUpdateData =
                                                createMealIngredRecordData(
                                              status: 'available',
                                            );
                                            await listViewMealIngredRecord
                                                .reference
                                                .update(mealIngredUpdateData);

                                            final timestampUpdateData =
                                                createTimestampRecordData(
                                              lastAudit: functions
                                                  .geCurrentTimeStamp(),
                                            );
                                            await expandableTimestampRecord!
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
                                            listViewMealIngredRecord.hindi!,
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
                                                    .recipeNames!
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
                                          listViewMealIngredRecord.img!,
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
              StreamBuilder<List<MiscellaneousRecord>>(
                stream: queryMiscellaneousRecord(
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
                  List<MiscellaneousRecord> rowMiscellaneousRecordList =
                      snapshot.data!;
                  // Return an empty Container when the document does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final rowMiscellaneousRecord =
                      rowMiscellaneousRecordList.isNotEmpty
                          ? rowMiscellaneousRecordList.first
                          : null;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Available',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).black600,
                              fontSize: 18,
                            ),
                      ),
                      Text(
                        ' (',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).black600,
                              fontSize: 18,
                            ),
                      ),
                      Text(
                        ')',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).black600,
                              fontSize: 18,
                            ),
                      ),
                    ],
                  );
                },
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
                        snapshot.data!;
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
                                      listViewMealIngredRecord.english!,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .black600,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 30, 0),
                                    child: InkWell(
                                      onTap: () async {
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
                                        listViewMealIngredRecord.hindi!,
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
                                                .recipeNames!
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
                                      listViewMealIngredRecord.img!,
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
