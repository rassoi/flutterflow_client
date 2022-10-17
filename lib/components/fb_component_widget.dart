import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FbComponentWidget extends StatefulWidget {
  const FbComponentWidget({Key? key}) : super(key: key);

  @override
  _FbComponentWidgetState createState() => _FbComponentWidgetState();
}

class _FbComponentWidgetState extends State<FbComponentWidget> {
  int? countControllerValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
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
        updateCount: (count) => setState(() => countControllerValue = count),
        stepSize: 1,
      ),
    );
  }
}
