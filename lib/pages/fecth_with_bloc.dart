import 'package:flutter/material.dart';
import 'package:flutter_api_3_5/models/post_model.dart';
import 'package:flutter_api_3_5/post_bloc/post_bloc.dart';
import 'package:flutter_api_3_5/widgets/loading_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FecthDataWithBloc extends StatelessWidget {
  const FecthDataWithBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fecth Data With Bloc'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return _buildLoading();
          } else {
            if (state is PostLoaded) {
              return _buildList(state.postList);
            } else {
              return _buildError(context, 'Some went wrong');
            }
          }
        },
      ),
    );
  }

  Center _buildError(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              LoadingWidget.buidLoading(context, 'Loading...');
              BlocProvider.of<PostBloc>(context).add(GetPostEvent());
              Navigator.pop(context);
            },
            icon: const Icon(Icons.refresh),
          ),
          Text(message, style: const TextStyle(fontSize: 20.0)),
        ],
      ),
    );
  }

  ListView _buildList(List<PostModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        var data = list[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text(data.userId.toString()),
            ),
            title: Text(
              data.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20.0),
            ),
            subtitle: Text(
              data.body,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              data.id.toString(),
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        );
      },
    );
  }

  Center _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
