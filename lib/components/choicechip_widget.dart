import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoicechipWidget extends StatefulWidget {
  const ChoicechipWidget({
    Key? key,
    this.options,
  }) : super(key: key);

  final List<String>? options;

  @override
  _ChoicechipWidgetState createState() => _ChoicechipWidgetState();
}

class _ChoicechipWidgetState extends State<ChoicechipWidget> {
  String? choiceChipsValue;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowChoiceChips(
      options: [ChipData('Option 1', Icons.train_outlined)],
      onChanged: (val) => setState(() => choiceChipsValue = val?.first),
      selectedChipStyle: ChipStyle(
        backgroundColor: Color(0xFF323B45),
        textStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
        iconColor: Colors.white,
        iconSize: 18,
        elevation: 4,
      ),
      unselectedChipStyle: ChipStyle(
        backgroundColor: Colors.white,
        textStyle: FlutterFlowTheme.of(context).bodyText2.override(
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
    );
  }
}
