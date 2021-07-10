import 'package:flutter/material.dart';
import 'package:vipcoder/const/const.dart';
import 'package:vipcoder/pages/verify-Certificate.dart';

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
            accountEmail: Text("vipcoding.np@gmail.com")),
        ListTile(
          onTap: () {
            Navigator.pop(context);
          },
          leading: Icon(
            Icons.space_dashboard_rounded,
            color: ancentColor,
          ),
          title: Text("Dashboard"),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.local_offer_sharp,
            color: ancentColor,
          ),
          title: Text("Offers"),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CertificateScreen()));
          },
          leading: Icon(Icons.document_scanner_outlined),
          title: Text("Verify Your Certificate"),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.image_outlined),
          title: Text("Image Gallery"),
        ),
        Divider(
          color: ancentColor,
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.web_sharp),
          title: Text("Blog"),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.emoji_events_outlined),
          title: Text("Events"),
        ),
        Divider(),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.feedback_rounded),
          title: Text("Feedback"),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.info_outline),
          title: Text("About us"),
        ),
        Divider(),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.facebook_sharp),
          title: Text("Facebook Page"),
        ),
      ],
    ),
  );
}
