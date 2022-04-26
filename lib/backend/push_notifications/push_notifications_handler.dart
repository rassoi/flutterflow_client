import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../home_page/home_page_widget.dart';
import '../../meals/meals_widget.dart';
import '../../landing/landing_widget.dart';
import '../../meals_copy/meals_copy_widget.dart';
import '../../meals_copy2/meals_copy2_widget.dart';
import '../../meals_copy2_copy/meals_copy2_copy_widget.dart';
import '../../meal_info/meal_info_widget.dart';
import '../../login/login_widget.dart';
import '../../main/main_widget.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler(
      {Key key, this.handlePushNotification, this.child})
      : super(key: key);

  final Function(BuildContext) handlePushNotification;
  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: SpinKitThreeBounce(
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 50,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'HomePage': (data) async => HomePageWidget(),
  'Meals': (data) async => hasMatchingParameters(data, {'hg'})
      ? MealsWidget(
          hg: getParameter(data, 'hg'),
        )
      : NavBarPage(initialPage: 'MealsWidget'),
  'Landing': (data) async => LandingWidget(),
  'MealsCopy': (data) async => hasMatchingParameters(data, {'hg'})
      ? MealsCopyWidget(
          hg: getParameter(data, 'hg'),
        )
      : NavBarPage(initialPage: 'MealsCopyWidget'),
  'MealsCopy2': (data) async => hasMatchingParameters(data, {'category'})
      ? MealsCopy2Widget(
          category: getParameter(data, 'category'),
        )
      : NavBarPage(initialPage: 'MealsCopy2Widget'),
  'MealsCopy2Copy': (data) async => MealsCopy2CopyWidget(
        mealDetail: getParameter(data, 'mealDetail'),
      ),
  'meal_info': (data) async => MealInfoWidget(
        mealRef: getParameter(data, 'mealRef'),
      ),
  'login': (data) async => LoginWidget(),
  'main': (data) async => MainWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
