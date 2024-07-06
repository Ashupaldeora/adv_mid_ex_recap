import 'package:adv_mid_ex_recap/api/api_services.dart';
import 'package:adv_mid_ex_recap/models/post_data.dart';
import 'package:flutter/cupertino.dart';

class PostProvider extends ChangeNotifier {
  PostModel postModel = PostModel.temp();
  int currentIndex = 0, containerIndex = 0, temp = 0;

  bool isLoading = false;
  Future<void> loadData() async {
    isLoading = true;
    Map json = await ApiServices.apiServices.fetchData();
    postModel = PostModel.fromJson(json);
    print(PostModel.postModel.limit);
    isLoading = false;
    notifyListeners();
  }

  void updateContainerIndex(int index) {
    if (index < 3) {
      containerIndex++;
    } else {
      containerIndex = temp;

      temp++;
      if (temp > 4) {
        temp = 0;
      }
    }
    notifyListeners();
  }

  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  PostProvider() {
    loadData();
  }
}
