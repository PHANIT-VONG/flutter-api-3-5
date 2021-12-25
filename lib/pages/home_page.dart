import 'package:flutter/material.dart';
import 'package:flutter_api_3_5/controllers/post_controller.dart';
import 'package:flutter_api_3_5/models/post_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: FutureBuilder<List<PostModel>>(
        future: PostController().fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _buildError(snapshot);
          } else {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _buildLoading();
            } else {
              return ListView.separated(
                itemBuilder: (context, index) {
                  var data = snapshot.data![index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(data.userId.toString()),
                    ),
                    title: Text(
                      data.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      data.body,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(data.id.toString()),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: snapshot.data!.length,
              );
            }
          }
        },
      ),
    );
  }

  Center _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Center _buildError(AsyncSnapshot<Object?> snapshot) {
    return Center(
      child: Text('${snapshot.error}'),
    );
  }
}
