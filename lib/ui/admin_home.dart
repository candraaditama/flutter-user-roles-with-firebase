// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_roles/utils/auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:user_roles/widget/griddashboard.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///App bar
      /*
      appBar: AppBar(
        title: Text('Admin Home Page'),
      ), */

      backgroundColor: Color(0xff121212),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Johnys Family",
                      style: TextStyle(
                              color: Colors.white70,
                              fontFamily: "SFProBold",
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                              color: Color(0xffa29aac),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  //icon: Image.asset(
                  //  "assets/images/notification.png",
                  //  width: 24,
                  icon:Icon(
                    FontAwesomeIcons.signOutAlt,
                    color: Colors.white70,
                    size: 15,
                  ),
                  onPressed: () {
                    AuthHelper.logOut();
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GridDashboard()
        ],
      ),
    );
  }




/*
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Text("Home page"),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection("users").snapshots(),
              builder : (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                if(snapshot.hasData && snapshot.data != null){
                  final docs = snapshot.data.docs;
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: docs.length,
                      itemBuilder : (BuildContext context, int index){
                        final user = docs[index].data();
                        return ListTile(
                          title: Text(user['name'] ?? user['email']),
                        );
                      }

                  );
                }
                return Center(child: CircularProgressIndicator(),);
              }
            ),
            RaisedButton(
              child: Text("Log out"),
              onPressed: () {
                AuthHelper.logOut();
              },
            )
          ],
        ),
      ),
    );
  } */
}
