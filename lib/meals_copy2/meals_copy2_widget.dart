import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MealsCopy2Widget extends StatefulWidget {
  const MealsCopy2Widget({
    Key? key,
    this.category,
  }) : super(key: key);

  final String? category;

  @override
  _MealsCopy2WidgetState createState() => _MealsCopy2WidgetState();
}

class _MealsCopy2WidgetState extends State<MealsCopy2Widget> {
  String? choiceChipsValue;
  String? dropDownValue1;
  String? dropDownValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: TextFormField(
          controller: textController,
          onChanged: (_) => EasyDebounce.debounce(
            'textController',
            Duration(milliseconds: 500),
            () => setState(() {}),
          ),
          obscureText: false,
          decoration: InputDecoration(
            hintText: 'Searh Dish',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
          ),
          style: FlutterFlowTheme.of(context).subtitle1,
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: StreamBuilder<List<DaysRecord>>(
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
                    color: Color(0xFF8783B0),
                    size: 50,
                  ),
                ),
              );
            }
            List<DaysRecord> columnDaysRecordList = snapshot.data!;
            // Return an empty Container when the document does not exist.
            if (snapshot.data!.isEmpty) {
              return Container();
            }
            final columnDaysRecord = columnDaysRecordList.isNotEmpty
                ? columnDaysRecordList.first
                : null;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: StreamBuilder<List<MiscellaneousRecord>>(
                    stream: queryMiscellaneousRecord(),
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
                      List<MiscellaneousRecord>
                          listViewMiscellaneousRecordList = snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: listViewMiscellaneousRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewMiscellaneousRecord =
                              listViewMiscellaneousRecordList[listViewIndex];
                          return FlutterFlowChoiceChips(
                            initiallySelected: [FFAppState().category],
                            options: listViewMiscellaneousRecord.categoriesList!
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
                          );
                        },
                      );
                    },
                  ),
                ),
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
                    List<DaysRecord> rowDaysRecordList = snapshot.data!;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data!.isEmpty) {
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
                            initialOption: dropDownValue1 ??= 'Today',
                            options: rowDaysRecord!.day!.toList().toList(),
                            onChanged: (val) =>
                                setState(() => dropDownValue1 = val),
                            width: 180,
                            height: 50,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          ),
                        ),
                        Expanded(
                          child: FlutterFlowDropDown(
                            initialOption: dropDownValue2 ??= 'Brakefast',
                            options: ['Brakefast', 'Lunch', 'Snacks', 'Dinner'],
                            onChanged: (val) =>
                                setState(() => dropDownValue2 = val),
                            width: 180,
                            height: 50,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          ),
                        ),
                        ToggleIcon(
                          onPressed: () async {
                            setState(
                                () => FFAppState().Fav = !FFAppState().Fav);
                          },
                          value: FFAppState().Fav,
                          onIcon: Icon(
                            Icons.favorite_sharp,
                            color: Color(0xFFE82E2E),
                            size: 25,
                          ),
                          offIcon: Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                if (FFAppState().Fav)
                  StreamBuilder<List<TempRecord>>(
                    stream: queryTempRecord(
                      queryBuilder: (tempRecord) => tempRecord
                          .where('uid', isEqualTo: FFAppState().user)
                          .where('nameAsArray',
                              arrayContains: '${valueOrDefault<String>(
                                choiceChipsValue,
                                'All',
                              )}${textController!.text}')
                          .where('fav', isEqualTo: true),
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
                      List<TempRecord> containerTempRecordList = snapshot.data!;
                      return Container(
                        width: double.infinity,
                        height: 190,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: StreamBuilder<List<TempRecord>>(
                          stream: queryTempRecord(
                            queryBuilder: (tempRecord) => tempRecord
                                .where('uid', isEqualTo: FFAppState().user)
                                .where('nameAsArray',
                                    arrayContains: '${valueOrDefault<String>(
                                      choiceChipsValue,
                                      'All',
                                    )}${textController!.text}')
                                .where('fav', isEqualTo: true),
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
                            List<TempRecord> listViewTempRecordList =
                                snapshot.data!;
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2.5, 2.5, 2.5, 2.5),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  listViewTempRecord.image!,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          listViewTempRecord.name!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 60,
                                          icon: Icon(
                                            Icons.add,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                        ToggleIcon(
                                          onPressed: () async {
                                            final tempUpdateData = {
                                              'fav': !listViewTempRecord.fav!,
                                            };
                                            await listViewTempRecord.reference
                                                .update(tempUpdateData);
                                          },
                                          value: listViewTempRecord.fav!,
                                          onIcon: Icon(
                                            Icons.favorite,
                                            color: Colors.black,
                                            size: 25,
                                          ),
                                          offIcon: Icon(
                                            Icons.favorite_border,
                                            color: Colors.black,
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                Expanded(
                  child: StreamBuilder<List<TempRecord>>(
                    stream: queryTempRecord(
                      queryBuilder: (tempRecord) => tempRecord
                          .where('nameAsArray',
                              arrayContains: '${valueOrDefault<String>(
                                choiceChipsValue,
                                'All',
                              )}${textController!.text}')
                          .where('uid', isEqualTo: FFAppState().user)
                          .where('fav', isEqualTo: false),
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
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewTempRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewTempRecord =
                              listViewTempRecordList[listViewIndex];
                          return Container(
                            width: 100,
                            height: 140,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (listViewTempRecord
                                                    .longPreperation ==
                                                1)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.03, -1),
                                                child: Icon(
                                                  Icons.av_timer_rounded,
                                                  color: Color(0xFFD92319),
                                                  size: 36,
                                                ),
                                              ),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(1, 0),
                                                child: ToggleIcon(
                                                  onPressed: () async {
                                                    final tempUpdateData = {
                                                      'fav': !listViewTempRecord
                                                          .fav!,
                                                    };
                                                    await listViewTempRecord
                                                        .reference
                                                        .update(tempUpdateData);
                                                  },
                                                  value:
                                                      listViewTempRecord.fav!,
                                                  onIcon: Icon(
                                                    Icons.favorite,
                                                    color: Color(0xFFE82E2E),
                                                    size: 25,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.black,
                                                    size: 25,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 0, 0),
                                              child: Text(
                                                listViewTempRecord.name!
                                                    .maybeHandleOverflow(
                                                        maxChars: 20),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 1),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      final tempUpdateData = {
                                                        'meal_time': FieldValue
                                                            .arrayUnion([
                                                          '${dropDownValue1}${dropDownValue2}'
                                                        ]),
                                                      };
                                                      await listViewTempRecord
                                                          .reference
                                                          .update(
                                                              tempUpdateData);
                                                      await actions.addIngred(
                                                        listViewTempRecord
                                                            .ingredNames,
                                                        listViewTempRecord.name,
                                                        listViewTempRecord.uid,
                                                        dropDownValue1,
                                                        dropDownValue2,
                                                        listViewTempRecord
                                                            .recipeId,
                                                      );
                                                      await actions
                                                          .mealCountUpdate(
                                                        listViewTempRecord.uid,
                                                        listViewTempRecord
                                                            .ingredNames,
                                                        listViewTempRecord.name,
                                                      );
                                                    },
                                                    text: 'Add',
                                                    options: FFButtonOptions(
                                                      width: 100,
                                                      height: 25,
                                                      color: Color(0xFF736CAF),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
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
                                Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.18, -5.86),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child:
                                            StreamBuilder<List<RecipesRecord>>(
                                          stream: queryRecipesRecord(
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
                                            List<RecipesRecord>
                                                imageRecipesRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the document does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final imageRecipesRecord =
                                                imageRecipesRecordList
                                                        .isNotEmpty
                                                    ? imageRecipesRecordList
                                                        .first
                                                    : null;
                                            return InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                  'meal_info',
                                                  queryParams: {
                                                    'mealRef': serializeParam(
                                                      listViewTempRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    listViewTempRecord.image!,
                                                width: 160,
                                                height: 130,
                                                fit: BoxFit.fill,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
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
            );
          },
        ),
      ),
    );
  }
}
