import 'package:flutter/material.dart';

/**
 * 星形收藏图标的widget
 */
class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorite = true;
  int _favoriteCount = 41;
  
  void _toggleFavorite() {
    setState(() {
      //If the lake is currently favorited, unfavorite it.
      if (_isFavorite) {
        _favoriteCount -= 1;
        _isFavorite = false;
      } else {
        _favoriteCount += 1;
        _isFavorite = true;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
              icon: (_isFavorite 
                  ? new Icon(Icons.star) 
                  : new Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: _toggleFavorite,
          ),
        ),
        new SizedBox(
           width: 18.0,
          child: new Container(
            child: new Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }

}