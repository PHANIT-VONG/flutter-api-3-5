import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_3_5/controllers/post_controller.dart';
import 'package:flutter_api_3_5/models/post_model.dart';
import 'package:flutter_api_3_5/widgets/loading_widget.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _userIdController = TextEditingController();

  final _tittleController = TextEditingController();

  final _bodyController = TextEditingController();

  PostModel _afterPost = PostModel(userId: 0, id: 0, title: '', body: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                style: const TextStyle(fontSize: 20.0),
                decoration: const InputDecoration(
                  hintText: 'Enter UserId',
                  border: OutlineInputBorder(),
                ),
                controller: _userIdController,
              ),
              const SizedBox(height: 16.0),
              TextField(
                style: const TextStyle(fontSize: 20.0),
                decoration: const InputDecoration(
                  hintText: 'Enter Tittle',
                  border: OutlineInputBorder(),
                ),
                controller: _tittleController,
              ),
              const SizedBox(height: 16.0),
              TextField(
                style: const TextStyle(fontSize: 20.0),
                decoration: const InputDecoration(
                  hintText: 'Enter Body',
                  border: OutlineInputBorder(),
                ),
                controller: _bodyController,
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 60.0,
                width: double.infinity,
                child: CupertinoButton(
                  color: Colors.blue,
                  onPressed: () async {
                    var postModel = PostModel(
                      userId: int.parse(_userIdController.text),
                      id: 0,
                      title: _tittleController.text,
                      body: _bodyController.text,
                    );
                    LoadingWidget.buidLoading(context, 'Loading');
                    await Future.delayed(const Duration(seconds: 2));
                    _afterPost = await PostController().createPost(postModel);
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: const Text('SAVE'),
                ),
              ),
              const SizedBox(height: 16.0),
              Card(
                color: Colors.orange,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(_afterPost.userId.toString()),
                  ),
                  title: Text(
                    _afterPost.title,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                  subtitle: Text(_afterPost.body,
                      style: const TextStyle(fontSize: 18.0)),
                  trailing: Text(_afterPost.id.toString(),
                      style: const TextStyle(fontSize: 18.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
