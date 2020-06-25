import 'package:flutter/material.dart';
import 'package:skype_clone/resources/firebase_repository.dart';
import 'package:skype_clone/utils/universalvariables.dart';
import 'package:skype_clone/utils/utilities.dart';
import 'package:skype_clone/widgets/appbar.dart';
import 'package:skype_clone/widgets/custom_tile.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

final FirebaseRepository _respository = FirebaseRepository();

class _ChatListScreenState extends State<ChatListScreen> {
  String currentUser;
  String initials;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _respository.getCurrentUser().then((user) {
      setState(() {
        currentUser = user.uid;
        initials = Util.getInitials(user.displayName);
      });
    });
  }

  CustomAppBar customAppBar(BuildContext context) {
    return CustomAppBar(
      leading: IconButton(
          icon: Icon(Icons.notifications, color: Colors.white),
          onPressed: () {}),
      title: UserCircle(initials),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/search_screen');
          },
        ),
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      appBar: customAppBar(context),
      floatingActionButton: NewChatButtom(),
      body: ChatListContainer(currentUser),
    );
  }
}

class ChatListContainer extends StatefulWidget {
  final String currentUser;
  ChatListContainer(this.currentUser);
  @override
  _ChatListContainerState createState() => _ChatListContainerState();
}

class _ChatListContainerState extends State<ChatListContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: 2,
          itemBuilder: (context, item) {
            return CustomTile(
              mini: false,
              onTap: () {},
              title: Text(
                'the Cs guy',
                style: TextStyle(
                  fontFamily: "Arial",
                  fontSize: 19,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                'Hello',
                style: TextStyle(
                  color: UniversalVariables.greyColor,
                  fontSize: 14,
                ),
              ),
              leading: Container(
                constraints: BoxConstraints(maxHeight: 60, maxWidth: 60),
                child: Stack(
                  children: <Widget>[
                    CircleAvatar(
                        maxRadius: 30,
                        backgroundColor: Colors.grey,
                        backgroundImage:
                            NetworkImage('https://i.redd.it/h3mfh734kdfy.png')),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 13,
                        height: 13,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: UniversalVariables.onlineDotColor,
                            border: Border.all(
                                color: UniversalVariables.blackColor,
                                width: 2)),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class UserCircle extends StatelessWidget {
  final String text;

  UserCircle(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: UniversalVariables.separatorColor,
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              text ?? "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: UniversalVariables.lightBlueColor,
                fontSize: 13,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: UniversalVariables.blackColor, width: 2),
                  color: UniversalVariables.onlineDotColor),
            ),
          )
        ],
      ),
    );
  }
}

class NewChatButtom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: UniversalVariables.fabGradient, shape: BoxShape.circle),
      child: Icon(
        Icons.edit,
        color: Colors.white,
        size: 25,
      ),
      padding: EdgeInsets.all(15),
    );
  }
}
