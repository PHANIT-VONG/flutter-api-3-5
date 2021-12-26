import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_3_5/pages/fecth_without_bloc.dart';

import 'fecth_with_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              color: Colors.blue,
              child: const Text('Fecth Data Without Bloc'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const FecthDataWithoutBloc(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20.0),
            CupertinoButton(
              color: Colors.blue,
              child: const Text('Fecth Data With Bloc'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const FecthDataWithBloc(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
