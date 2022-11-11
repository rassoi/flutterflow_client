import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../meal_info/meal_info_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MealsWidget extends StatefulWidget {
  const MealsWidget({
    Key? key,
    this.hg,
  }) : super(key: key);

  final String? hg;

  @override
  _MealsWidgetState createState() => _MealsWidgetState();
}

class _MealsWidgetState extends State<MealsWidget> {
  String? choiceChipsValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Text(
          'My Meals',
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Poppins',
                fontSize: 36,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                StreamBuilder<List<DaysRecord>>(
                  stream: queryDaysRecord(
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
                    List<DaysRecord> containerDaysRecordList = snapshot.data!;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerDaysRecord =
                        containerDaysRecordList.isNotEmpty
                            ? containerDaysRecordList.first
                            : null;
                    return Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          FlutterFlowChoiceChips(
                            initiallySelected: [FFAppState().day],
                            options: containerDaysRecord!.day!
                                .toList()
                                .map((label) => ChipData(label))
                                .toList(),
                            onChanged: (val) =>
                                setState(() => choiceChipsValue = val?.first),
                            selectedChipStyle: ChipStyle(
                              backgroundColor: Color(0xFF323B45),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              iconColor: Colors.white,
                              iconSize: 18,
                              elevation: 4,
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: Colors.white,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF323B45),
                                  ),
                              iconColor: Color(0xFF323B45),
                              iconSize: 18,
                              elevation: 4,
                            ),
                            chipSpacing: 20,
                            multiselect: false,
                            initialized: choiceChipsValue != null,
                            alignment: WrapAlignment.start,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Text(
                  'Brakefast',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).subtitle2,
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: StreamBuilder<List<TempRecord>>(
                    stream: queryTempRecord(
                      queryBuilder: (tempRecord) => tempRecord
                          .where('meal_time',
                              arrayContains: '${choiceChipsValue}Brakefast')
                          .where('uid', isEqualTo: FFAppState().user),
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
                      List<TempRecord> listViewTempRecordList = snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: listViewTempRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewTempRecord =
                              listViewTempRecordList[listViewIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MealInfoWidget(
                                              mealRef:
                                                  listViewTempRecord.reference,
                                            ),
                                          ),
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: CachedNetworkImage(
                                          imageUrl: listViewTempRecord.image!,
                                          width: 130,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    listViewTempRecord.name!
                                        .maybeHandleOverflow(maxChars: 15),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        formatNumber(
                                          listViewTempRecord.counter!,
                                          formatType: FormatType.custom,
                                          format: '0',
                                          locale: '',
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        final tempUpdateData = {
                                          'meal_time': FieldValue.arrayRemove(
                                              ['${choiceChipsValue}Brakefast']),
                                        };
                                        await listViewTempRecord.reference
                                            .update(tempUpdateData);
                                        await actions.deleteIngred(
                                          listViewTempRecord.uid,
                                          listViewTempRecord.name,
                                          listViewTempRecord.ingredNames,
                                          choiceChipsValue,
                                          'Brakefast',
                                        );
                                        await actions.mealCountUpdate(
                                          listViewTempRecord.uid,
                                          listViewTempRecord.ingredNames,
                                          listViewTempRecord.name,
                                        );
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                Text(
                  'Lunch',
                  style: FlutterFlowTheme.of(context).subtitle2,
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: StreamBuilder<List<TempRecord>>(
                    stream: queryTempRecord(
                      queryBuilder: (tempRecord) => tempRecord
                          .where('meal_time',
                              arrayContains: '${choiceChipsValue}Lunch')
                          .where('uid', isEqualTo: FFAppState().user),
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
                      List<TempRecord> listViewTempRecordList = snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: listViewTempRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewTempRecord =
                              listViewTempRecordList[listViewIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MealInfoWidget(
                                              mealRef:
                                                  listViewTempRecord.reference,
                                            ),
                                          ),
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          listViewTempRecord.image!,
                                          width: 130,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    listViewTempRecord.name!
                                        .maybeHandleOverflow(maxChars: 15),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        formatNumber(
                                          listViewTempRecord.counter!,
                                          formatType: FormatType.custom,
                                          format: '0',
                                          locale: '',
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        final tempUpdateData = {
                                          'meal_time': FieldValue.arrayRemove(
                                              ['${choiceChipsValue}Lunch']),
                                        };
                                        await listViewTempRecord.reference
                                            .update(tempUpdateData);
                                        await actions.deleteIngred(
                                          listViewTempRecord.uid,
                                          listViewTempRecord.name,
                                          listViewTempRecord.ingredNames,
                                          choiceChipsValue,
                                          'Lunch',
                                        );
                                        await actions.mealCountUpdate(
                                          listViewTempRecord.uid,
                                          listViewTempRecord.ingredNames,
                                          listViewTempRecord.name,
                                        );
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                Text(
                  'Snacks',
                  style: FlutterFlowTheme.of(context).subtitle2,
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: StreamBuilder<List<TempRecord>>(
                    stream: queryTempRecord(
                      queryBuilder: (tempRecord) => tempRecord
                          .where('meal_time',
                              arrayContains: '${choiceChipsValue}Snacks')
                          .where('uid', isEqualTo: FFAppState().user),
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
                      List<TempRecord> listViewTempRecordList = snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: listViewTempRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewTempRecord =
                              listViewTempRecordList[listViewIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MealInfoWidget(
                                              mealRef:
                                                  listViewTempRecord.reference,
                                            ),
                                          ),
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          listViewTempRecord.image!,
                                          width: 130,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    listViewTempRecord.name!
                                        .maybeHandleOverflow(maxChars: 15),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        formatNumber(
                                          listViewTempRecord.counter!,
                                          formatType: FormatType.custom,
                                          format: '0',
                                          locale: '',
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        final tempUpdateData = {
                                          'meal_time': FieldValue.arrayRemove(
                                              ['${choiceChipsValue}Snacks']),
                                        };
                                        await listViewTempRecord.reference
                                            .update(tempUpdateData);
                                        await actions.deleteIngred(
                                          listViewTempRecord.uid,
                                          listViewTempRecord.name,
                                          listViewTempRecord.ingredNames,
                                          choiceChipsValue,
                                          'Snacks',
                                        );
                                        await actions.mealCountUpdate(
                                          listViewTempRecord.uid,
                                          listViewTempRecord.ingredNames,
                                          listViewTempRecord.name,
                                        );
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                Text(
                  'Dinner',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: StreamBuilder<List<TempRecord>>(
                    stream: queryTempRecord(
                      queryBuilder: (tempRecord) => tempRecord
                          .where('meal_time',
                              arrayContains: '${choiceChipsValue}Dinner')
                          .where('uid', isEqualTo: FFAppState().user),
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
                      List<TempRecord> listViewTempRecordList = snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: listViewTempRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewTempRecord =
                              listViewTempRecordList[listViewIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MealInfoWidget(
                                              mealRef:
                                                  listViewTempRecord.reference,
                                            ),
                                          ),
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          listViewTempRecord.image!,
                                          width: 130,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    listViewTempRecord.name!
                                        .maybeHandleOverflow(maxChars: 15),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        formatNumber(
                                          listViewTempRecord.counter!,
                                          formatType: FormatType.custom,
                                          format: '0',
                                          locale: '',
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        final tempUpdateData = {
                                          'meal_time': FieldValue.arrayRemove(
                                              ['${choiceChipsValue}Dinner']),
                                        };
                                        await listViewTempRecord.reference
                                            .update(tempUpdateData);
                                        await actions.deleteIngred(
                                          listViewTempRecord.uid,
                                          listViewTempRecord.name,
                                          listViewTempRecord.ingredNames,
                                          choiceChipsValue,
                                          'Dinner',
                                        );
                                        await actions.mealCountUpdate(
                                          listViewTempRecord.uid,
                                          listViewTempRecord.ingredNames,
                                          listViewTempRecord.name,
                                        );
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
