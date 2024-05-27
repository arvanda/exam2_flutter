import 'package:flutter/material.dart';
import 'package:flutter_exam_2/models/post.dart';

class PostPageStateful extends StatefulWidget {
  const PostPageStateful({super.key});

  @override
  State<PostPageStateful> createState() => _PostPageStatefulState();
}

class _PostPageStatefulState extends State<PostPageStateful> {
  PostResult? postResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("exam Panda post"),
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
                // Add your onPressed code here
              },
              child: Text("post"),
            ),
          ],
        ),
      ),
    );
  }
}
