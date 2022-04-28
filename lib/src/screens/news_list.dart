import 'package:flutter/material.dart';
import 'package:performant_data/src/blocs/stories_bloc.dart';
import '../blocs/stories_provider.dart';

class NewsList extends StatelessWidget {
  Widget build(context) {
    final bloc = StoriesProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
        stream: bloc.topIds,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Still waiting on Ids');
          }

          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, int index) {
                return Text(snapshot.data[index]);
              });
        });
  }

  Widget buildList() {
    return ListView.builder(
        itemCount: 1000,
        itemBuilder: (context, int index) {
          return FutureBuilder(
              future: getFuture(),
              builder: (context, snapshot) {
                return Container(
                  height: 80.0,
                  child: snapshot.hasData
                      ? Text('Im visible $index')
                      : Text('Havent fetched data $index'),
                );
              });
        });
  }

  getFuture() {
    return Future.delayed(
      Duration(seconds: 2),
      () => 2,
    );
  }
}
