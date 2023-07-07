import 'package:newsapp/data/models/news.dart';
import 'package:newsapp/shared/Network/diohelper.dart';

class DataSource {
  Future<NewsModel> getNews(String category) async {
    try {
      final res = await DioHelper.getData(
          url: "top-headlines",
          parameters: {
            'country':'us',
            'category':category,
            'apiKey':'4b44be43212c4495bec89cbad53fd10e'

          }


          );
      print(category);;
      print(res.data);

      return NewsModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

}