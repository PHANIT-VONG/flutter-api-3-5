import 'package:flutter/material.dart';
import 'package:flutter_api_3_5/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_bloc/post_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc()..add(GetPostEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ETEC Flutter API 3-5',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
