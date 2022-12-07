import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<bool?> login() async {
  final Config config = new Config(
      tenant: "69ff4482-882e-4a34-9418-0b08013bc3ba",
      clientId: "7709ee94-38ed-4aff-b13d-6f367ad083ab",
      scope: "openid profile  User.read",
      redirectUri: "https://jwt.ms",
      isB2C: false,
      webUseRedirect: true,
      navigatorKey: navigatorKey,
      loader: Center(child: CircularProgressIndicator()));

  AadOAuth oauth = new AadOAuth(config);
  await oauth.login();
  final acessToken = await oauth.getAccessToken();
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  get acessToken => acessToken;

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;

  late bool passwordVisibility;
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => login());
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Image.asset(
            'imagens/logo.png',
          ),
          Text("oi")
        ],
      ),
    );
  }
}
