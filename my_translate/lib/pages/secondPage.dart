import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String _inputText = "";
  String _tanslateText = "";
  bool _hasTranslate = false;
  TextEditingController _inputController;
  TextEditingController _translateController;


  @override
  void initState() {
    super.initState();
    _inputController = new TextEditingController.fromValue(
      TextEditingValue(
        text: _inputText,
      ),
    );
  _translateController = new TextEditingController.fromValue(
        TextEditingValue(
          text: '',
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text("Translate"),
         ),
         body: Column(
           children: <Widget>[
             TextField(
                controller: _inputController,
                maxLines: 2,
                decoration: InputDecoration(
                hintText: '输入文字（中文）',
                suffixIcon: IconButton(
                icon:Icon(Icons.cancel),
                onPressed: (){
                  print('输入：'+_inputController.text);
                },
              )
              ),
            ),
            TextField(
                maxLines: 2,
                controller: _translateController,
                onTap: () async {
                  this._tanslateText = _inputController.text;
                  String res = await _translate();
                  print('输出：'+res);
                  setState(() {
                    _translateController.value = new TextEditingController.fromValue(new TextEditingValue(
                      text: res, 
                    )).value;
                    _translateController.text = res;
                  });
                 },
                decoration: InputDecoration(
                hintText: _hasTranslate ? _tanslateText : '翻译（英语）',
                suffixIcon: IconButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.forward),
                )
               ),
            )
           ],   
         ),
       ),
    );
  }
  
  Future<String> _translate() async {
    print("正在翻译："+this._tanslateText);
    String sign = md5.convert(utf8.encode('20191224000369465'+this._tanslateText+'1435660288'+'TEPDTL4lJAIGL8ee800F')).toString();
    String url = "http://api.fanyi.baidu.com/api/trans/vip/translate?q="+this._tanslateText+"&from=zh&to=en&appid=20191224000369465&salt=1435660288&sign="+sign;
    print(url);
    String translateText = "";
    var client = http.Client();
    var uri = Uri.parse(url);
    http.Response response = await client.get(uri);
    final Map<String,dynamic> responseData = json.decode(response.body);
    print('翻译后为：'+responseData['trans_result'][0]['dst']);
    translateText = responseData['trans_result'][0]['dst'];
    return translateText;
  }
}