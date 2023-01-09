import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ios_chatapp_0/model/user.dart';
import 'package:new_ios_chatapp_0/provider/user_provider.dart';
import 'package:new_ios_chatapp_0/widget/common/style.dart';
import 'package:provider/provider.dart';


class UserCard extends StatelessWidget{
  final User findUser;
  const UserCard({super.key, required this.findUser});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Provider.of<Products>(context, listen: false).selectGame(discoverGame);
        Provider.of<UserProvider>(context, listen: false).selectUser(findUser);
        Navigator.pushNamed(context, "/user/${findUser.userId}");
      },
      child: Card(
        margin: EdgeInsets.only(bottom: defaultPadding),
        color: indigoAccent,
        child: Stack(
          children: [
            _buildGameImage(),
            _buildCardText(),
          ],
        ),
      ),
    );
  }

  Widget _buildGameImage() {
    return Container(
      width: 372,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: ClipOval(
          child: Image.asset(
            "assets/image/user/sample_user.png",
            fit: BoxFit.cover
          )
        )
      ),
    );
  }

  Widget _buildCardText() {
    // return Positioned(
    //   bottom: 0,
    //   right: 0,
    //   left: 0,
    //   child: GradientBox(
    //     hasBorderRadius: true,
    //     borderRadius: BorderRadius.only(
    //       bottomLeft: Radius.circular(10.0),
    //       bottomRight: Radius.circular(10.0) 
    //     ),
    //     padding: EdgeInsets.all(defaultPadding),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: <Widget>[
    //         Text(
    //           discoverGame.title.toUpperCase(),
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             color: Colors.white
    //           )
    //         ),
    //         Text(
    //           "Platform: " + discoverGame.platforms[0] + " | " +  "Genre: " + discoverGame.genres[0],
    //           style: TextStyle(color: Colors.white)
    //         )
    //       ]
    //     ),
    //   )
    // );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          findUser.name,
          style: const TextStyle(color: CupertinoColors.black, fontSize: 25)
        )
      ]
    );
  }
}