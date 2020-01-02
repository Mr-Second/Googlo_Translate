import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView
      (
        children: <Widget>
          [
            UserAccountsDrawerHeader(
            accountName: null,
            accountEmail: null,
            currentAccountPicture: null,
            decoration: BoxDecoration
            (
              
              image: DecorationImage
              (
                fit: BoxFit.cover,
                image: AssetImage('images/bg_account_switcher.png'),
              )
            ),
          ),
          ListTile(
            title: Text(
              '首页',
              style: TextStyle(color: Colors.blue[600]),
            ),
            leading: ImageIcon(
              AssetImage('images/home.png'),
              color: Colors.blue[600],
              ),
            onTap: (){
              showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    content: Text('>_< Sorry！该功能尚未实现，后续版本会加入此功能！'),
                  );
                }
              );
            },
          ),
          ListTile(
            title: Text(
              '翻译收藏夹',
              style: TextStyle(color: Colors.black),
              ),
            leading: ImageIcon(AssetImage('images/ic_collection.png')),
            onTap: (){
              showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    content: Text('>_< Sorry！该功能尚未实现，后续版本会加入此功能！'),
                  );
                }
              );
            },
          ),
          ListTile(
            title: Text(
              '离线翻译',
              style: TextStyle(color: Colors.black),
              ),
            leading: ImageIcon(AssetImage('images/download_completed.png')),
            onTap: (){
              showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    content: Text('>_< Sorry！该功能尚未实现，后续版本会加入此功能！'),
                  );
                }
              );
            },
          ),
          ListTile(
            title: Text(
              '设置',
              style: TextStyle(color: Colors.black),
              ),
            leading: ImageIcon(AssetImage('images/setting.png')),
            onTap: (){
              showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    content: Text('>_< Sorry！该功能尚未实现，后续版本会加入此功能！'),
                  );
                }
              );
            },
          ),
        ],
      )
    );
  }
}


