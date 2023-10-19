import 'package:flutter/material.dart';
import 'package:chap9/widgets/header.dart';
import 'package:chap9/widgets/row_with_card.dart';
import 'package:chap9/widgets/row.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Custom Scroll Example'),
              background: Image.network(
                'https://shorturl.at/bfIJS',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                childCount: 20, // Adjust the number of list items.
              ),
            ),
          ),
        ],
      ),
    );
  }
}