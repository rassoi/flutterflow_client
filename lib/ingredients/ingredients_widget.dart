import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_swipeable_stack.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
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
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Ingredients'});
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
                                logFirebaseEvent(
                                    'INGREDIENTS_PAGE_BUY_BTN_ON_TAP');
                                logFirebaseEvent('Button_Backend-Call');

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
                        style: FlutterFlowTheme.of(context).subtitle2,
                      ),
                      Text(
                        ' (',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      Text(
                        rowMiscellaneousRecord!.unavaialable!.toString(),
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      Text(
                        ')',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ],
                  );
                },
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
                            text: 'Avaialble',
                          ),
                          Tab(
                            text: 'Unavailable',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Stack(
                              children: [
                                Text(
                                  'Tab View 1',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 32,
                                      ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: FlutterFlowSwipeableStack(
                                    topCardHeightFraction: 0.82,
                                    middleCardHeightFraction: 0.68,
                                    botttomCardHeightFraction: 0.75,
                                    topCardWidthFraction: 0.9,
                                    middleCardWidthFraction: 0.85,
                                    botttomCardWidthFraction: 0.8,
                                    onSwipeFn: (index) {},
                                    onLeftSwipe: (index) {},
                                    onRightSwipe: (index) {},
                                    onUpSwipe: (index) {},
                                    onDownSwipe: (index) {},
                                    itemBuilder: (context, index) {
                                      return [
                                        () => Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 30),
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0xFFF5F5F5),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 3),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Image.network(
                                                        'https://picsum.photos/seed/832/600',
                                                        width: double.infinity,
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
                                                                .fromSTEB(0, 10,
                                                                    0, 0),
                                                        child: Text(
                                                          'Meal Name',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Hindi Name',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                      Text(
                                                        'Used in :  ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                      Text(
                                                        'Prefered Qty :',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                      ][index]();
                                    },
                                    itemCount: 1,
                                    controller: swipeableStackController,
                                    enableSwipeUp: false,
                                    enableSwipeDown: false,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Tab View 2',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 32,
                                  ),
                            ),
                            Text(
                              'Tab View 3',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 32,
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
    );
  }
}
