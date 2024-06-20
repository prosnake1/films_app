import 'package:films_app/repository/singletons/pagescount.dart';
import 'package:get_it/get_it.dart';

var pagesCount = GetIt.I.get<PagesCountSingleton>().pagesCount;

class CurrentPageSingleton {
  int page;
  void nextPage() {
    if (page < pagesCount && page != 0) {
      page++;
    }
  }

  void previousPage() {
    if (page > 1 && page != 0) {
      page--;
    }
  }

  CurrentPageSingleton(this.page);
}
