import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../phone_authentication/phone_authentication_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingWidget extends StatefulWidget {
  const LandingWidget({Key key}) : super(key: key);

  @override
  _LandingWidgetState createState() => _LandingWidgetState();
}

class _LandingWidgetState extends State<LandingWidget> {
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
            await signOut();
            await Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => PhoneAuthenticationWidget(),
              ),
              (r) => false,
            );
          },
          child: Icon(
            Icons.person_sharp,
            color: Colors.black,
            size: 36,
          ),
        ),
        title: Text(
          'Rassoi',
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Poppins',
                fontSize: 36,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavBarPage(initialPage: 'MealsCopy2'),
                  ),
                );
              },
              child: Icon(
                Icons.search_sharp,
                color: Colors.black,
                size: 36,
              ),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Container(
                        width: 260,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFF5F5F5),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(
                              'https://picsum.photos/seed/962/600',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Container(
                        width: 220,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFF5F5F5),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(
                              'https://picsum.photos/seed/481/600',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(-0.8, 0),
                        child: Text(
                          'Upcommiing Meals',
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 1, 0, 0),
                  child: StreamBuilder<List<TempRecord>>(
                    stream: queryTempRecord(
                      queryBuilder: (tempRecord) => tempRecord.where('user_uid',
                          isEqualTo: FFAppState().user),
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
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    StreamBuilder<List<UpcommingMealsRecord>>(
                                      stream: queryUpcommingMealsRecord(),
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
                                        List<UpcommingMealsRecord>
                                            imageUpcommingMealsRecordList =
                                            snapshot.data;
                                        return InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    NavBarPage(
                                                        initialPage: 'Meals'),
                                              ),
                                            );
                                          },
                                          child: Image.network(
                                            listViewTempRecord.image,
                                            width: 100,
                                            height: 70,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      listViewTempRecord.name
                                          .maybeHandleOverflow(
                                        maxChars: 20,
                                        replacement: '…',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 8,
                                            lineHeight: 3,
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
              ),
              Align(
                alignment: AlignmentDirectional(-0.85, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Text(
                    'Explore',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
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
                      List<CategoriesRecord> gridViewCategoriesRecordList =
                          snapshot.data;
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 4,
                          childAspectRatio: 1.2,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: gridViewCategoriesRecordList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewCategoriesRecord =
                              gridViewCategoriesRecordList[gridViewIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      setState(() => FFAppState().category =
                                              valueOrDefault<String>(
                                            gridViewCategoriesRecord
                                                .categoryName,
                                            'All',
                                          ));
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBarPage(
                                              initialPage: 'MealsCopy2'),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        gridViewCategoriesRecord.image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    gridViewCategoriesRecord.categoryName,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
