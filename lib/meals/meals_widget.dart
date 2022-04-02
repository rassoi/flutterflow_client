import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../meals_copy2_copy/meals_copy2_copy_widget.dart';
import 'package:flutter/material.dart';
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
        leading: Icon(
          Icons.person_sharp,
          color: Colors.black,
          size: 24,
        ),
        title: Text(
          'My Meals',
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Poppins',
                fontSize: 36,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
            child: Icon(
              Icons.search_sharp,
              color: Colors.black,
              size: 28,
            ),
          ),
        ],
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
                  FlutterFlowDropDown(
                    initialOption: dropDownValue ??= '1',
                    options: ['1', '2'].toList(),
                    onChanged: (val) => setState(() => dropDownValue = val),
                    width: 180,
                    height: 50,
                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                    hintText: 'Please select...',
                    fillColor: Color(0xFFC4A2A2),
                    elevation: 2,
                    borderColor: Colors.transparent,
                    borderWidth: 0,
                    borderRadius: 0,
                    margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                    hidesUnderline: true,
                  ),
                  Container(
                    width: 160,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFDABEBE),
                      borderRadius: BorderRadius.circular(25),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Color(0xFF9E9E9E),
                        width: 1,
                      ),
                    ),
                    child: FlutterFlowCountController(
                      decrementIconBuilder: (enabled) => FaIcon(
                        FontAwesomeIcons.minus,
                        color: enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                        size: 20,
                      ),
                      incrementIconBuilder: (enabled) => FaIcon(
                        FontAwesomeIcons.plus,
                        color: enabled ? Colors.blue : Color(0xFFEEEEEE),
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
                ],
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: StreamBuilder<List<TempRecord>>(
                  stream: queryTempRecord(
                    queryBuilder: (tempRecord) => tempRecord
                        .where('meal_time', isEqualTo: dropDownValue)
                        .where('day', isEqualTo: 'Brakefast'),
                  ),
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
                    List<TempRecord> listViewTempRecordList = snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: listViewTempRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewTempRecord =
                            listViewTempRecordList[listViewIndex];
                        return InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MealsCopy2CopyWidget(
                                  mealDetail: listViewTempRecord.ref,
                                ),
                              ),
                            );
                          },
                          child: Image.network(
                            listViewTempRecord.image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
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
