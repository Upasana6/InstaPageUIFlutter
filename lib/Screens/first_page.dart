import 'package:flutter/material.dart';
import 'package:insta_page/modals/story.dart';

class FirstPage extends StatelessWidget {
  final int _selectedIndex = 0;
  final Story story = Story();
  final int postCount = 12;
  final int storyCount = 16;

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Instagram",
          style: TextStyle(
            fontSize: 26,
            fontFamily: 'Lobster',
          ),
        ),
        actions: [
          Transform.rotate(
            angle: 24.6,
            child: Icon(
              Icons.send,
              size: 32,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 16,
        itemBuilder: (context, upperIndex) {
          return upperIndex == 0
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 16,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 10,
                              width: MediaQuery.of(context).size.height / 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: story.storyImage[index % 4],
                                  fit: BoxFit.contain,
                                ),
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                index.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ), //TODO divider after this
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 7.0,
                                horizontal: 10,
                              ),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 22,
                                width: MediaQuery.of(context).size.height / 22,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: story.storyImage[upperIndex % 4],
                                    fit: BoxFit.contain,
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              upperIndex.toString(),
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 7.0,
                            horizontal: 10,
                          ),
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 7 / 8,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: story.storyImage[upperIndex % 4],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.favorite_outline,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.chat_bubble_outline_rounded,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Transform.rotate(
                                angle: 24.6,
                                child: Icon(
                                  Icons.send_sharp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.bookmark_border_outlined,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5.0,
                        bottom: 10,
                        left: 10,
                      ),
                      child: Text(
                        "Comments...",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                  ],
                );
        },
      ),
      bottomNavigationBar: BottomNavigator(
        selectedIndex: _selectedIndex,
      ),
    );
  }
}

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({
    Key key,
    @required int selectedIndex,
  })  : _selectedIndex = selectedIndex,
        super(key: key);

  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: "",
          backgroundColor: Colors.black,
          icon: Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          backgroundColor: Colors.black,
          icon: Icon(
            Icons.search,
          ),
        ),
        BottomNavigationBarItem(
            label: "",
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.add_a_photo,
            )),
        BottomNavigationBarItem(
          label: "",
          backgroundColor: Colors.black,
          icon: Icon(
            Icons.favorite_outline_sharp,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          backgroundColor: Colors.black,
          icon: Icon(
            Icons.face,
          ),
        ),
      ],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedIndex,
    );
  }
}
