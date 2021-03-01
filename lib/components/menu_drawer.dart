import 'package:flutter/material.dart';
import 'package:pocket_app/models/account_user.dart';
import 'package:pocket_app/resource/values.dart';
import 'package:pocket_app/routes/app_routes.dart';

class MenuDrawer extends StatefulWidget {
  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    final AccountUser accountUser =
        ModalRoute.of(context).settings.arguments as AccountUser;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xffa71afd),
                  Color(0xff726de1),
                  Color(0xff1afea5),
                ],
              ),
            ),
            height: 120,
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        accountUser.data.accntName,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        accountUser.data.accntEmail,
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(Values.exit),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRouters.LOGIN_VIEW,
              );
            },
          ),
        ],
      ),
    );
  }
}
