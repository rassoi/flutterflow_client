import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    child: Text(
                      'Let\'s Transform your ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).grayIcon,
                            fontSize: 16,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    'GHAR \nKA \n  KHANA !!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Oswald',
                          color: FlutterFlowTheme.of(context).grayIcon,
                          fontSize: 45,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
                  child: StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(
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
                      List<UsersRecord> rowUsersRecordList = snapshot.data!;
                      // Return an empty Container when the document does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final rowUsersRecord = rowUsersRecordList.isNotEmpty
                          ? rowUsersRecordList.first
                          : null;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Container(
                              width: 230,
                              height: 44,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        GoRouter.of(context).prepareAuthEvent();
                                        final user =
                                            await signInWithGoogle(context);
                                        if (user == null) {
                                          return;
                                        }
                                        setState(() =>
                                            FFAppState().user = currentUserUid);

                                        context.goNamedAuth('Home', mounted);
                                      },
                                      text: 'Sign in with Google',
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.transparent,
                                        size: 20,
                                      ),
                                      options: FFButtonOptions(
                                        width: 230,
                                        height: 44,
                                        color: Color(0xFF72E6C1),
                                        textStyle: GoogleFonts.getFont(
                                          'Open Sans',
                                          color: Color(0xFF101213),
                                          fontSize: 17,
                                        ),
                                        elevation: 4,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-0.83, 0),
                                    child: Container(
                                      width: 22,
                                      height: 22,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: TextFormField(
                          controller: textController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Phone no. here',
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
                            filled: true,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(
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
                      List<UsersRecord> rowUsersRecordList = snapshot.data!;
                      // Return an empty Container when the document does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final rowUsersRecord = rowUsersRecordList.isNotEmpty
                          ? rowUsersRecordList.first
                          : null;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Container(
                              width: 230,
                              height: 44,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 2, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final phoneNumberVal =
                                              textController!.text;
                                          if (phoneNumberVal == null ||
                                              phoneNumberVal.isEmpty ||
                                              !phoneNumberVal.startsWith('+')) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'Phone Number is required and has to start with +.'),
                                              ),
                                            );
                                            return;
                                          }
                                          await beginPhoneAuth(
                                            context: context,
                                            phoneNumber: phoneNumberVal,
                                            onCodeSent: () async {
                                              context.goNamedAuth(
                                                  'login', mounted);
                                            },
                                          );

                                          setState(() => FFAppState().user =
                                              currentUserUid);
                                        },
                                        text: 'Sign in with Phone',
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.transparent,
                                          size: 20,
                                        ),
                                        options: FFButtonOptions(
                                          width: 230,
                                          height: 44,
                                          color: Color(0xFF72E6C1),
                                          textStyle: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: Color(0xFF101213),
                                            fontSize: 17,
                                          ),
                                          elevation: 4,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-0.85, 0),
                                    child: Icon(
                                      Icons.phone_enabled,
                                      color: Color(0xFF101213),
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                      child: Text(
                        'By  Clicking i accept the Terms & conditions & Privacy Policy',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).gray600,
                              fontSize: 12,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
