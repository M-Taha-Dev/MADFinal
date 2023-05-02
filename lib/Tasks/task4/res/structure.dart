import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../authentication/email_password/email_password.dart' as email;
import '../authentication/google_sign_in/google_sign_in.dart' as google;
import '../authentication/phone_sign_in/phone_sign_in.dart' as phone;
import '../backend_actions/user_presence/user_presence.dart' as user_presence;

import '../database/crud/screens/db_login_screen.dart';
import 'custom_colors.dart';
import 'fire_assets.dart';

List<Map<String, dynamic>> menu = [
  {
    'name': 'Authentication',
    'icon': FireAssets.fireAuthentication,
    'screens': [
      {
        'name': 'Email Sign In',
        'icon': const Icon(
          Icons.email_rounded,
          color: Palette.firebaseNavy,
        ),
        'widget': const email.SignInScreen(),
      },
      {
        'name': 'Phone Sign In',
        'icon': const Icon(
          Icons.phone,
          color: Palette.firebaseNavy,
        ),
        'widget': const phone.SignInScreen(),
      },
      {
        'name': 'Google Sign In',
        'icon': const FaIcon(
          FontAwesomeIcons.google,
          color: Palette.firebaseNavy,
        ),
        'widget': const google.SignInScreen(),
      },

    ]
  },
  {
    'name': 'Database',
    'icon': FireAssets.fireDatabase,
    'screens': [
      {
        'name': 'CRUD operations',
        'icon': const Icon(
          Icons.task_alt,
          color: Palette.firebaseNavy,
        ),
        'widget': const DbLoginScreen(),
      },

    ]
  },







];
