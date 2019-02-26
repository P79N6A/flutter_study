import 'package:flutter/material.dart';
import 'package:flutter_study/components/list_refresh.dart';
import 'package:flutter_study/components/list_view_item.dart';
import 'package:flutter_study/utils/net_utils.dart';
import 'package:flutter_study/views/news_page/news_page_item.dart';

class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsPageState();
  }
}

class NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListRefresh(getIndexListData, makeCard),
        )
      ],
    );
  }

  Future<Map> getIndexListData([Map<String, dynamic> params]) async {
    const juejin_flutter =
        'https://timeline-merger-ms.juejin.im/v1/get_tag_entry?src=web&tagId=5a96291f6fb9a0535b535438';
    var pageIndex = (params is Map) ? params['pageIndex'] : 0;
    final _param = {'page': pageIndex, 'pageSize': 20, 'sort': 'rankIndex'};
    var responseList = [];
    var pageTotal = 0;

    try {
      var response = await NetUtils.get(juejin_flutter, params: _param);
      responseList = response['d']['entrylist'];
      pageTotal = response['d']['total'];
      if (!(pageTotal is int) || pageTotal <= 0) {
        pageTotal = 0;
      }
    } catch (e) {}
    pageIndex += 1;
    List resultList = new List();
    for (int i = 0; i < responseList.length; i++) {
      try {
        NewsPageItem cellData = NewsPageItem.fromJson(responseList[i]);
        resultList.add(cellData);
      } catch (e) {
        // No specified type, handles all
      }
    }
    Map<String, dynamic> result = {
      "list": resultList,
      'total': pageTotal,
      'pageIndex': pageIndex
    };
    return result;
  }

  Widget makeCard(index, item) {
    var myTitle = '${item.title}';
    var myUsername = '${'👲'}: ${item.username} ';
    var codeUrl = '${item.detailUrl}';
    return ListViewItem(
      itemUrl: codeUrl,
      itemTitle: myTitle,
      data: myUsername,
    );
  }
}
