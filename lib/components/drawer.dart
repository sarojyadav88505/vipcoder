import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vipcoder/const/const.dart';
import 'package:vipcoder/pages/Notes-download.dart';
import 'package:vipcoder/pages/about-us.dart';
import 'package:vipcoder/pages/event.dart';
import 'package:vipcoder/pages/verify-Certificate.dart';

void _launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

Widget myDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            child: Text(
              "CC",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            backgroundColor: Colors.blue[100],
          ),
          accountName: Text("CarelessCoder"),
          accountEmail: Text("CarelessCoder.np@gmail.com"),
        ),
        ListTile(
          onTap: () {
            Navigator.pop(context);
          },
          leading: Icon(
            Icons.space_dashboard_rounded,
            color: primaryColor,
          ),
          title: Text("Dashboard"),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CertificateScreen()));
          },
          leading: Icon(
            Icons.document_scanner_outlined,
            color: primaryColor,
          ),
          title: Text("Verify Your Certificate"),
        ),
        Divider(),
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EventScreen()));
          },
          leading: Icon(
            Icons.emoji_events_outlined,
            color: primaryColor,
          ),
          title: Text("Events"),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotesDownload()));
          },
          leading: Icon(
            Icons.download,
            color: primaryColor,
          ),
          title: Text("Download"),
        ),
        Divider(),
        ListTile(
          onTap: () {
            _launchURL("https://facebook.com/enfo404");
            // print('Saroj');
          },
          leading: Icon(
            Icons.facebook_sharp,
            color: primaryColor,
          ),
          title: Text("Facebook Page"),
        ),
        Divider(),
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.feedback_rounded,
            color: primaryColor,
          ),
          title: Text("Feedback"),
        ),
        ListTile(
          title: Text("About us"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AboutUsPage()));
          },
          leading: Icon(
            Icons.info_outline,
            color: primaryColor,
          ),
        ),
        Divider(),
        ListTile(
          title: Text("Exit"),
          onTap: () {
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            }
          },
          leading: Icon(
            Icons.logout,
            color: primaryColor,
          ),
        ),
      ],
    ),
  );
}
