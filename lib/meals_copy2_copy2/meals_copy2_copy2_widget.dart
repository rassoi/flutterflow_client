import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MealsCopy2Copy2Widget extends StatefulWidget {
  const MealsCopy2Copy2Widget({
    Key? key,
    this.category,
  }) : super(key: key);

  final String? category;

  @override
  _MealsCopy2Copy2WidgetState createState() => _MealsCopy2Copy2WidgetState();
}

class _MealsCopy2Copy2WidgetState extends State<MealsCopy2Copy2Widget> {
  String? choiceChipsValue;
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
                    List<MiscellaneousRecord> containerMiscellaneousRecordList =
                        snapshot.data!;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerMiscellaneousRecord =
                        containerMiscellaneousRecordList.isNotEmpty
                            ? containerMiscellaneousRecordList.first
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
                            options: containerMiscellaneousRecord!
                                .categoriesList!
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
                Expanded(
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
                                            return CachedNetworkImage(
                                              imageUrl:
                                                  listViewTempRecord.image!,
                                              width: 160,
                                              height: 130,
                                              fit: BoxFit.fill,
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
