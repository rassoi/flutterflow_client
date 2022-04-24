import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../meal_info/meal_info_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MealsWidget extends StatefulWidget {
  const MealsWidget({
    Key key,
    this.hg,
  }) : super(key: key);

  final String hg;

  @override
  _MealsWidgetState createState() => _MealsWidgetState();
}

class _MealsWidgetState extends State<MealsWidget> {
  String choiceChipsValue;
  String dropDownValue;
  int countControllerValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 50,
                          ),
                        ),
                      );
                    }
                    List<DaysRecord> rowDaysRecordList = snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }
                    final rowDaysRecord = rowDaysRecordList.isNotEmpty
                        ? rowDaysRecordList.first
                        : null;
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FlutterFlowChoiceChips(
                            initiallySelected: [choiceChipsValue],
                            options: (rowDaysRecord.day.toList() ?? [])
                                .map((label) => ChipData(label))
                                .toList(),
                            onChanged: (val) =>
                                setState(() => choiceChipsValue = val.first),
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
                            alignment: WrapAlignment.start,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                StreamBuilder<List<DaysRecord>>(
                  stream: queryDaysRecord(
                    queryBuilder: (daysRecord) =>
                        daysRecord.where('type', isEqualTo: 'list'),
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
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 50,
                          ),
                        ),
                      );
                    }
                    List<DaysRecord> rowDaysRecordList = snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }
                    final rowDaysRecord = rowDaysRecordList.isNotEmpty
                        ? rowDaysRecordList.first
                        : null;
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FlutterFlowDropDown(
                            initialOption: dropDownValue ??= 'Today',
                            options: rowDaysRecord.day.toList().toList(),
                            onChanged: (val) =>
                                setState(() => dropDownValue = val),
                            width: 180,
                            height: 30,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                            fillColor: Color(0xFFC4A2A2),
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 5,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 160,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color(0xFFDABEBE),
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Color(0xFF9E9E9E),
                                width: 0,
                              ),
                            ),
                            child: FlutterFlowCountController(
                              decrementIconBuilder: (enabled) => FaIcon(
                                FontAwesomeIcons.minus,
                                color: enabled
                                    ? Color(0xDD000000)
                                    : Color(0xFFEEEEEE),
                                size: 20,
                              ),
                              incrementIconBuilder: (enabled) => FaIcon(
                                FontAwesomeIcons.plus,
                                color:
                                    enabled ? Colors.blue : Color(0xFFEEEEEE),
                                size: 20,
                              ),
                              countBuilder: (count) => Text(
                                count.toString(),
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              count: countControllerValue ??= 0,
                              updateCount: (count) =>
                                  setState(() => countControllerValue = count),
                              stepSize: 1,
                            ),
                          ),
                        ),
                        ToggleIcon(
                          onPressed: () async {
                            setState(() =>
                                FFAppState().eddiMeal = !FFAppState().eddiMeal);
                          },
                          value: FFAppState().eddiMeal,
                          onIcon: Icon(
                            Icons.edit,
                            color: Colors.black,
                            size: 25,
                          ),
                          offIcon: Icon(
                            Icons.edit_off,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ],
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
                              arrayContains: '${dropDownValue}Brakefast')
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
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<TempRecord> listViewTempRecordList = snapshot.data;
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
                                          listViewTempRecord.image,
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
                                    listViewTempRecord.name
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
                                          listViewTempRecord.counter,
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
                                              ['${dropDownValue}Brakefast']),
                                        };
                                        await listViewTempRecord.reference
                                            .update(tempUpdateData);
                                        await SetingredCall.call(
                                          recipeId: listViewTempRecord.recipeId,
                                          uid: listViewTempRecord.uid,
                                          day: dropDownValue,
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
                              arrayContains: '${dropDownValue}Lunch')
                          .where('uid', isEqualTo: FFAppState().user)
                          .where('status', isEqualTo: 'live'),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitThreeBounce(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<TempRecord> listViewTempRecordList = snapshot.data;
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
                                          listViewTempRecord.image,
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
                                    listViewTempRecord.name
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
                                          listViewTempRecord.counter,
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
                                              ['${dropDownValue}Lunch']),
                                        };
                                        await listViewTempRecord.reference
                                            .update(tempUpdateData);
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
                              arrayContains: '${dropDownValue}Snacks')
                          .where('uid', isEqualTo: FFAppState().user)
                          .where('status', isEqualTo: 'live'),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitThreeBounce(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<TempRecord> listViewTempRecordList = snapshot.data;
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
                                          listViewTempRecord.image,
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
                                    listViewTempRecord.name
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
                                          listViewTempRecord.counter,
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
                                              ['${dropDownValue}Snacks']),
                                        };
                                        await listViewTempRecord.reference
                                            .update(tempUpdateData);
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
                              arrayContains: '${dropDownValue}Dinner')
                          .where('uid', isEqualTo: FFAppState().user)
                          .where('status', isEqualTo: 'live'),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitThreeBounce(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<TempRecord> listViewTempRecordList = snapshot.data;
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
                                          listViewTempRecord.image,
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
                                    listViewTempRecord.name
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
                                          listViewTempRecord.counter,
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
                                              ['${dropDownValue}Dinner']),
                                        };
                                        await listViewTempRecord.reference
                                            .update(tempUpdateData);
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
