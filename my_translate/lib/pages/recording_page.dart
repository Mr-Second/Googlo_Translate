import 'package:flutter/material.dart';
import '../const/const_page.dart';

class RecordingTranslate extends StatefulWidget {
  @override
  _RecordingTranslateState createState() => _RecordingTranslateState();

}


class _RecordingTranslateState extends State<RecordingTranslate> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context,index){
          return _displayList(index);
        },
      ),
    );
  }

  Widget _displayList(int index){
    return Container(
      padding: EdgeInsets.only(
        bottom: 2.0,
        left: 2.0,
        right: 2.0
      ),
      child: Card(
        margin: EdgeInsets.only(
          left: 8.0,
          right: 8.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          )
        ),
        child: Container(
          padding: EdgeInsets.only(
            left: 15.0,
            top: 15.0,
            bottom: 15.0,
          ),
          height: 80.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _flexible(index),
              _collection(index)
            ],
          ),
        ),
      ),
    );
  }
  Widget _flexible(int index){
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            _items[index].title,
            style: Theme.of(context).textTheme.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            _items[index].subtitle,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 18.0
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }

  Widget _collection(int index){
    return IconButton(
      onPressed: (){
        print(_items[index].isCollected);
        setState(() {
          _items[index].isCollected = _items[index].isCollected == true ? false : true;
        });
      },
      icon:Icon(
        _items[index].isCollected ? Icons.star : Icons.star_border,
        size: 25.0,
        color: _items[index].isCollected ? Colors.yellow[600] : Colors.grey[700],
      ),
    );
  }

}

  List<Translate> _items = [
    Translate(
      'Plum blossom',
      '梅花',
      true
    ),
    Translate(
      'Sunflower',
      '向日葵',
      true
    ),
    Translate(
      'Rose',
      '玫瑰花',
      true
    ),
    Translate(
      'Violet',
      '紫罗兰',
      true
    ),
      Translate(
      'Daffodil',
      '水仙花',
      true
    ),
    Translate(
      'Carnation',
      '康乃馨',
      true
    ),
    Translate(
      'Tulip',
      '郁金香',
      true
    ),
    Translate(
      'Chrysanthemum',
      '菊花',
      true
    ),
  ];

