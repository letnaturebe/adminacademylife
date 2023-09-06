import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/images.jpeg',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'login': ParameterData.none(),
  'createAccount': ParameterData.none(),
  'createAcademyProfile': ParameterData.none(),
  'createYourProfile': ParameterData.none(),
  'forgotPassword': ParameterData.none(),
  'profilePage': ParameterData.none(),
  'createStory': ParameterData.none(),
  'postCreate': ParameterData.none(),
  'postDetails': (data) async => ParameterData(
        allParams: {
          'postReference':
              getParameter<DocumentReference>(data, 'postReference'),
          'userRecord': await getDocumentParameter<UsersRecord>(
              data, 'userRecord', UsersRecord.fromSnapshot),
        },
      ),
  'postStory': (data) async => ParameterData(
        allParams: {
          'initialStoryIndex': getParameter<int>(data, 'initialStoryIndex'),
        },
      ),
  'editSettings': ParameterData.none(),
  'editUserProfile': ParameterData.none(),
  'editDogProfile': (data) async => ParameterData(
        allParams: {
          'dogProfile': await getDocumentParameter<DogsRecord>(
              data, 'dogProfile', DogsRecord.fromSnapshot),
        },
      ),
  'changePassword': ParameterData.none(),
  'viewProfilePageOther': (data) async => ParameterData(
        allParams: {
          'userDetails': await getDocumentParameter<UsersRecord>(
              data, 'userDetails', UsersRecord.fromSnapshot),
        },
      ),
  'createDogProfile_New': ParameterData.none(),
  'chatPage': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'allChatsPage': ParameterData.none(),
  'addChatUsers': (data) async => ParameterData(
        allParams: {
          'chat': await getDocumentParameter<ChatsRecord>(
              data, 'chat', ChatsRecord.fromSnapshot),
        },
      ),
  'createGroupChat': ParameterData.none(),
  'homePage': ParameterData.none(),
  'studentDetail': (data) async => ParameterData(
        allParams: {
          'student': await getDocumentParameter<StudentsRecord>(
              data, 'student', StudentsRecord.fromSnapshot),
        },
      ),
  'studentList': ParameterData.none(),
  'noticeList': ParameterData.none(),
  'noticeDetail': (data) async => ParameterData(
        allParams: {
          'notice': await getDocumentParameter<NoticesRecord>(
              data, 'notice', NoticesRecord.fromSnapshot),
        },
      ),
  'postList': ParameterData.none(),
};

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
