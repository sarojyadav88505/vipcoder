import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vipcoder/const/const.dart';
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
              "VIP",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            backgroundColor: Colors.blue[100],
          ),
          accountName: Text("VIPCODING"),
          accountEmail: Text("vipcoding.np@gmail.com"),
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
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.image_outlined,
            color: primaryColor,
          ),
          title: Text("Image Gallery"),
        ),
        Divider(),
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.emoji_events_outlined,
            color: primaryColor,
          ),
          title: Text("Events"),
        ),
        ListTile(
          onTap: () {},
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
          onTap: () {},
          leading: Icon(
            Icons.info_outline,
            color: primaryColor,
          ),
          title: Text("About us"),
        ),
      ],
    ),
  );
}
