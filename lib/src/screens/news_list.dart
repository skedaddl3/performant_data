import 'package:flutter/material.dart';
import 'package:performant_data/src/blocs/stories_bloc.dart';
import '../blocs/stories_provider.dart';

class NewsList extends StatelessWidget {
  Widget build(context) {
    final bloc = StoriesProvider.of(context);

    bloc.fetchTopIds();

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
        builder: (context, AsyncSnapshot<List<int>> snapshot) {
          if (!snapshot.hasData) {
            return Text('Still waiting on Ids');
          }

          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, int index) {
                return Text('${snapshot.data[index]}');
              });
        });
  }



}
