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
        backgroundColor: Color(0xFF72E6C1),
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
            hintText: 'Search Dish',
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
          style: FlutterFlowTheme.of(context).subtitle1.override(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
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
                StreamBuilder<List<CategoryTempRecord>>(
                  stream: queryCategoryTempRecord(
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
                    List<CategoryTempRecord> containerCategoryTempRecordList =
                        snapshot.data!;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerCategoryTempRecord =
                        containerCategoryTempRecordList.isNotEmpty
                            ? containerCategoryTempRecordList.first
                            : null;
                    return Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        children: [
                          FlutterFlowChoiceChips(
                            initiallySelected: [widget.category!],
                            options: containerCategoryTempRecord!.categoriName!
                                .toList()
                                .map((label) => ChipData(label))
                                .toList(),
                            onChanged: (val) =>
                                setState(() => choiceChipsValue = val?.first),
                            selectedChipStyle: ChipStyle(
                              backgroundColor: Colors.white,
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
                              iconColor: Colors.white,
                              iconSize: 18,
                              elevation: 3,
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
                          child: FlutterFlowDropDown<String>(
                            initialOption: dropDownValue1 ??= 'Today',
                            options: rowDaysRecord!.day!.toList().toList(),
                            onChanged: (val) =>
                                setState(() => dropDownValue1 = val),
                            width: 180,
                            height: 50,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).black600,
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
                          child: FlutterFlowDropDown<String>(
                            initialOption: dropDownValue2 ??= 'Breakfast',
                            options: ['Breakfast', 'Lunch', 'Snacks', 'Dinner'],
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
                              arrayContains:
                                  '${choiceChipsValue}${textController!.text}')
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
                      return Material(
                        color: Colors.transparent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 190,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: StreamBuilder<List<TempRecord>>(
                            stream: queryTempRecord(
                              queryBuilder: (tempRecord) => tempRecord
                                  .where('uid', isEqualTo: FFAppState().user)
                                  .where('nameAsArray',
                                      arrayContains:
                                          '${choiceChipsValue}${textController!.text}')
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                        ),
                      );
                    },
                  ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: StreamBuilder<List<TempRecord>>(
                    stream: queryTempRecord(
                      queryBuilder: (tempRecord) => tempRecord
                          .where('nameAsArray',
                              arrayContains:
                                  '${choiceChipsValue}${textController!.text}')
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
                              color: Colors.white,
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
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Adding${listViewTempRecord.name} from ${dropDownValue1} ${dropDownValue2}',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              Color(0x00000000),
                                                        ),
                                                      );
                                                    },
                                                    text: 'Add',
                                                    options: FFButtonOptions(
                                                      width: 100,
                                                      height: 25,
                                                      color: Color(0xFF72E6C1),
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
