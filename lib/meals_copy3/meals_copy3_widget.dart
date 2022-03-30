import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MealsCopy3Widget extends StatefulWidget {
  const MealsCopy3Widget({
    Key key,
    this.hg,
  }) : super(key: key);

  final String hg;

  @override
  _MealsCopy3WidgetState createState() => _MealsCopy3WidgetState();
}

class _MealsCopy3WidgetState extends State<MealsCopy3Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
            Icons.chevron_left_sharp,
            color: Colors.black,
            size: 36,
          ),
        ),
        title: Text(
          'Dish',
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
              size: 36,
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
            children: [],
          ),
        ),
      ),
    );
  }
}
