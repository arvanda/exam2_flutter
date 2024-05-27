import 'package:flutter/material.dart';
import 'package:flutter_exam_2/models/post.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: PostPage(),
    );
  }
}

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  PostResult? postResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Post"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(postResult != null
                ? "${postResult!.id} | ${postResult!.name} | ${postResult!.email} | ${postResult!.body}"
                : "Tidak ada Data"),
            ElevatedButton(
              onPressed: () {
                PostResult.connectToAPI(
                        'id labore ex et quam laborum', "Eliseo@gardner.biz")
                    .then((value) {
                  setState(() {
                    postResult = value;
                  });
                });
              },
              child: const Text("Post"),
            ),
          ],
        ),
      ),
    );
  }
}
