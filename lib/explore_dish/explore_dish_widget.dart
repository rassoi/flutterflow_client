import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreDishWidget extends StatefulWidget {
  const ExploreDishWidget({Key? key}) : super(key: key);

  @override
  _ExploreDishWidgetState createState() => _ExploreDishWidgetState();
}

class _ExploreDishWidgetState extends State<ExploreDishWidget> {
  String? dropDownValue1;
  String? dropDownValue2;
  String? dropDownValue3;
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.search,
          color: Colors.black,
          size: 24,
        ),
        title: TextFormField(
          controller: textController,
          autofocus: true,
          obscureText: false,
          decoration: InputDecoration(
            hintText: 'Type \"Sabji\", \"Rice\" etc..\n',
            hintStyle: FlutterFlowTheme.of(context).bodyText2,
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
          style: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
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
                    child: FlutterFlowDropDown<String>(
                      initialOption: dropDownValue1 ??= 'All',
                      options: containerMiscellaneousRecord!.categoriesList!
                          .toList()
                          .toList(),
                      onChanged: (val) => setState(() => dropDownValue1 = val),
                      width: 180,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                      hintText: 'Please select...',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
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
                      FlutterFlowDropDown<String>(
                        initialOption: dropDownValue2 ??= 'Today',
                        options: rowDaysRecord!.day!.toList().toList(),
                        onChanged: (val) =>
                            setState(() => dropDownValue2 = val),
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 50,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                        hintText: 'Please select...',
                        fillColor: Colors.white,
                        elevation: 2,
                        borderColor: Colors.transparent,
                        borderWidth: 0,
                        borderRadius: 0,
                        margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                      FlutterFlowDropDown<String>(
                        initialOption: dropDownValue3 ??= 'Brakefast',
                        options: ['Brakefast', 'Lunch', 'Snacks', 'Sinner'],
                        onChanged: (val) =>
                            setState(() => dropDownValue3 = val),
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: 50,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                        hintText: 'Please select...',
                        fillColor: Colors.white,
                        elevation: 2,
                        borderColor: Colors.transparent,
                        borderWidth: 0,
                        borderRadius: 0,
                        margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                    ],
                  );
                },
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: StreamBuilder<List<RecipesTempRecord>>(
                  stream: queryRecipesTempRecord(),
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
                    List<RecipesTempRecord> listViewRecipesTempRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewRecipesTempRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewRecipesTempRecord =
                            listViewRecipesTempRecordList[listViewIndex];
                        return Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.8, 0),
                                child: Image.network(
                                  'https://picsum.photos/seed/353/600',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.91, -0.03),
                                child: Text(
                                  'Hello World',
                                  style: FlutterFlowTheme.of(context).bodyText1,
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
            ],
          ),
        ),
      ),
    );
  }
}
