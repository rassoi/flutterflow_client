import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../meals_copy2_copy/meals_copy2_copy_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MealsCopy2Widget extends StatefulWidget {
  const MealsCopy2Widget({
    Key key,
    this.category,
  }) : super(key: key);

  final String category;

  @override
  _MealsCopy2WidgetState createState() => _MealsCopy2WidgetState();
}

class _MealsCopy2WidgetState extends State<MealsCopy2Widget> {
  ApiCallResponse setIngred;
  TempRecord mealCreation;
  String dropDownValue1;
  String dropDownValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 36,
          ),
        ),
        title: TextFormField(
          controller: textController,
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
          ),
          style: FlutterFlowTheme.of(context).subtitle1,
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
            child: Icon(
              Icons.search_sharp,
              color: Colors.black,
              size: 36,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: StreamBuilder<List<CategoriesRecord>>(
                stream: queryCategoriesRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  List<CategoriesRecord> listViewCategoriesRecordList =
                      snapshot.data;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: listViewCategoriesRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewCategoriesRecord =
                          listViewCategoriesRecordList[listViewIndex];
                      return StreamBuilder<List<CategoriesRecord>>(
                        stream: queryCategoriesRecord(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<CategoriesRecord> buttonCategoriesRecordList =
                              snapshot.data;
                          return FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: listViewCategoriesRecord.categoryName,
                            options: FFButtonOptions(
                              width: 130,
                              height: 30,
                              color: FlutterFlowTheme.of(context).primaryColor,
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
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: StreamBuilder<List<RecipesRecord>>(
                stream: queryRecipesRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  List<RecipesRecord> listViewRecipesRecordList = snapshot.data;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewRecipesRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewRecipesRecord =
                          listViewRecipesRecordList[listViewIndex];
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
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 20),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  40, 0, 0, 0),
                                          child: Text(
                                            listViewRecipesRecord.name,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40, 0, 0, 20),
                                        child: Text(
                                          FFAppState().user,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            final tempCreateData =
                                                createTempRecordData(
                                              image:
                                                  listViewRecipesRecord.image,
                                              name: listViewRecipesRecord.name,
                                              mealTime: dropDownValue1,
                                              day: dropDownValue2,
                                              youtubeLink: listViewRecipesRecord
                                                  .youtubeLink,
                                              ref: listViewRecipesRecord.ref,
                                              ingredNames: listViewRecipesRecord
                                                  .ingredNames,
                                              userUid: FFAppState().user,
                                              recipeId: listViewRecipesRecord
                                                  .recipeId,
                                            );
                                            var tempRecordReference =
                                                TempRecord.collection.doc();
                                            await tempRecordReference
                                                .set(tempCreateData);
                                            mealCreation =
                                                TempRecord.getDocumentFromData(
                                                    tempCreateData,
                                                    tempRecordReference);
                                            setIngred =
                                                await SetingredCall.call(
                                              recipeId: listViewRecipesRecord
                                                  .recipeId,
                                            );

                                            setState(() {});
                                          },
                                          text: 'Add',
                                          options: FFButtonOptions(
                                            width: 100,
                                            height: 25,
                                            color: Color(0xFF736CAF),
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
                                            borderRadius: 5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: StreamBuilder<List<RecipesRecord>>(
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
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<RecipesRecord>
                                            imageRecipesRecordList =
                                            snapshot.data;
                                        // Return an empty Container when the document does not exist.
                                        if (snapshot.data.isEmpty) {
                                          return Container();
                                        }
                                        final imageRecipesRecord =
                                            imageRecipesRecordList.isNotEmpty
                                                ? imageRecipesRecordList.first
                                                : null;
                                        return InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MealsCopy2CopyWidget(
                                                  mealDetail:
                                                      listViewRecipesRecord.ref,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Image.network(
                                            listViewRecipesRecord.image,
                                            width: 130,
                                            height: 130,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowDropDown(
                  initialOption: dropDownValue1 ??= '1',
                  options: ['1', '2', '3', '4', '5', '6'].toList(),
                  onChanged: (val) => setState(() => dropDownValue1 = val),
                  width: 180,
                  height: 50,
                  textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                  fillColor: Colors.white,
                  elevation: 2,
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                  borderRadius: 0,
                  margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                  hidesUnderline: true,
                ),
                FlutterFlowDropDown(
                  initialOption: dropDownValue2 ??= 'Brakefast',
                  options: ['Brakefast', 'Lunch', 'Snacks', 'Dinner'].toList(),
                  onChanged: (val) => setState(() => dropDownValue2 = val),
                  width: 180,
                  height: 50,
                  textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                  fillColor: Colors.white,
                  elevation: 2,
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                  borderRadius: 0,
                  margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                  hidesUnderline: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
