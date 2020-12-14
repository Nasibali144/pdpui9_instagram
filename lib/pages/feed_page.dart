import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdpui9_instagram/models/post_model.dart';
import 'package:pdpui9_instagram/models/story_model.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  List<Story> _story = [
    Story('Jazmin', 'assets/images/user_1.jpeg'),
    Story('Sylvester', 'assets/images/user_2.jpeg'),
    Story('Lavina', 'assets/images/user_3.jpeg'),
    Story('Jazmin', 'assets/images/user_1.jpeg'),
    Story('Sylvester', 'assets/images/user_2.jpeg'),
    Story('Lavina', 'assets/images/user_3.jpeg'),
  ];

  List<Post> _post = [
    Post(
      userName: 'Brianne',
      userImage: 'assets/images/user_1.jpeg',
      feedImage: 'assets/images/feed_1.jpeg',
      caption: 'Consequator nihil aliquid omnis consequator'
    ),
    Post(
        userName: 'Henri',
        userImage: 'assets/images/user_2.jpeg',
        feedImage: 'assets/images/feed_2.jpeg',
        caption: 'Consequator nihil aliquid omnis consequator'
    ),
    Post(
        userName: 'Mariano',
        userImage: 'assets/images/user_3.jpeg',
        feedImage: 'assets/images/feed_3.jpeg',
        caption: 'Consequator nihil aliquid omnis consequator'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(),

            // #stories, #watchall
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Stories', style: TextStyle(color: Colors.grey),),
                  Text('Watch All', style: TextStyle(color: Colors.grey),)
                ],
              ),
            ),

            // #storyList
            Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: _story.map((story) {
                  return itemOfStory(story);
                }).toList(),
              ),
            ),

            // #postList
            Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _post.length,
                itemBuilder: (ctx, i) {
                  return itemOfPost(_post[i]);
                },
              ),
            )
          ],
        ),
      )
    );
  }

  Widget itemOfStory(Story story) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(width: 3, color: Color(0xFF8e44ad))
          ),
          child: Container(
            padding: EdgeInsets.all(
              2,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.userImage),
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(story.userName, style: TextStyle(color: Colors.grey),)
      ],
    );
  }

  Widget itemOfPost(Post post) {
    return Column(
      children: [
        // #header
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image(
                      image: AssetImage(post.userImage),
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(post.userName, style: TextStyle(color: Colors.grey),)
                ],
              ),
              IconButton(
                icon: Icon(SimpleLineIcons.options, color: Colors.grey[300],),
                onPressed: () {},
              )
            ],
          ),
        ),

        // #image
        FadeInImage(
          width: MediaQuery.of(context).size.width,
          image: AssetImage(post.feedImage),
          placeholder: AssetImage('assets/images/placeholder.png'),
        ),

        // #icons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(FontAwesome.heart_o, color: Colors.grey,),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(FontAwesome.comment_o, color: Colors.grey,),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(FontAwesome.send_o, color: Colors.grey,),
                  onPressed: () {},
                ),
              ],
            ),
            IconButton(
              icon: Icon(FontAwesome.bookmark_o, color: Colors.grey,),
              onPressed: () {},
            ),
          ],
        ),

        // #tags
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
            horizontal: 14,
          ),
          child: RichText(
            softWrap: true,
            overflow: TextOverflow.visible,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Liked by ',
                  style: TextStyle(color: Colors.grey),
                ),
                TextSpan(
                  text: 'Sigmund, ',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Yessenia, ',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Dayana ',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'and ',
                  style: TextStyle(color: Colors.grey),
                ),
                TextSpan(
                  text: '1263 others',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ]
            ),
          ),
        ),

        // #caption
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 5,
          ),
          child: RichText(
            softWrap: true,
            overflow: TextOverflow.visible,
            text: TextSpan(
              children: [
                TextSpan(
                  text: post.userName,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' ${post.caption}',
                  style: TextStyle(color: Colors.grey,),
                ),
              ]
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(
              horizontal: 14,
            ),
            alignment: Alignment.topLeft,
            child: Text('February 2020', style: TextStyle(color: Colors.grey),)
        )
      ],
    );
  }

}
