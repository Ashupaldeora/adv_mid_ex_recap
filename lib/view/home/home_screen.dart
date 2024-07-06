import 'dart:math';

import 'package:adv_mid_ex_recap/controller/post_provider.dart';
import 'package:adv_mid_ex_recap/main.dart';
import 'package:adv_mid_ex_recap/utils/gradient_list.dart';
import 'package:adv_mid_ex_recap/view/home/components/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<PostProvider>(context);
    final providerFalse = Provider.of<PostProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          "Posts App",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: providerTrue.isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: 50,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/man.png"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "User : " +
                            providerTrue.postModel
                                .posts![providerTrue.currentIndex].userId
                                .toString(),
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    height: 550,
                    child: CardSwiper(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        backCardOffset: Offset(0, 0),
                        onSwipe: (previousIndex, currentIndex, direction) {
                          providerFalse.updateIndex(currentIndex!);
                          providerFalse.updateContainerIndex(currentIndex);
                          return true;
                        },
                        cardBuilder: (context,
                            index,
                            horizontalOffsetPercentage,
                            verticalOffsetPercentage) {
                          List container = [
                            CardsContainer(
                                itemCount: providerFalse
                                    .postModel.posts![index].tags.length,
                                tags:
                                    providerFalse.postModel.posts![index].tags,
                                title:
                                    providerFalse.postModel.posts![index].title,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.orangeAccent,
                                      Colors.orange
                                    ]),
                                body:
                                    providerFalse.postModel.posts![index].body),
                            CardsContainer(
                                itemCount: providerFalse
                                    .postModel.posts![index].tags.length,
                                tags:
                                    providerFalse.postModel.posts![index].tags,
                                title:
                                    providerFalse.postModel.posts![index].title,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.teal, Colors.tealAccent]),
                                body:
                                    providerFalse.postModel.posts![index].body),
                            CardsContainer(
                                itemCount: providerFalse
                                    .postModel.posts![index].tags.length,
                                tags:
                                    providerFalse.postModel.posts![index].tags,
                                title:
                                    providerFalse.postModel.posts![index].title,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.redAccent, Colors.red]),
                                body:
                                    providerFalse.postModel.posts![index].body),
                            CardsContainer(
                                itemCount: providerFalse
                                    .postModel.posts![index].tags.length,
                                tags:
                                    providerFalse.postModel.posts![index].tags,
                                title:
                                    providerFalse.postModel.posts![index].title,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.pinkAccent, Colors.pink]),
                                body:
                                    providerFalse.postModel.posts![index].body),
                            CardsContainer(
                                itemCount: providerFalse
                                    .postModel.posts![index].tags.length,
                                tags:
                                    providerFalse.postModel.posts![index].tags,
                                title:
                                    providerFalse.postModel.posts![index].title,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.lightBlueAccent,
                                      Colors.lightBlue
                                    ]),
                                body:
                                    providerFalse.postModel.posts![index].body),
                          ];

                          return Column(
                            children: [
                              container[providerFalse.containerIndex],
                            ],
                          );
                        },
                        cardsCount: providerTrue.postModel.posts!.length),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/like.png",
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(providerTrue.postModel
                              .posts![providerTrue.currentIndex].reaction.likes
                              .toString()),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/dislike.png",
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(providerTrue
                              .postModel
                              .posts![providerTrue.currentIndex]
                              .reaction
                              .dislikes
                              .toString()),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
