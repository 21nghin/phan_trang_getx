import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REST API'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StaggeredGridView.countBuilder(
              itemBuilder: (context, int index) => Container(
                height: 200,
                width: 100,
                color: Colors.red,
              ),
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              itemCount: 1000,
            ),
          )
        ],
      ),
    );
  }
}
