import 'package:destini_app/objects/story_objects.dart';

class StoryboardController {
  int _current_page_id; // -1 means end of story.

  int _init_page_id;
  Map<int, StoryPage> pages = {};

  void findInitiationPage() {
    int counter = 0;
    for (final page in pages.values) {
      if (page.inits_storyboard == true) {
        if (counter > 0) {
          throw Exception(
              "Can't define more than one initiation page. Please check storyboard.");
        }
        counter++;
        _init_page_id = page.id;
      }
    }
  }

  void startStoryboard() {
    findInitiationPage();
    _current_page_id = _init_page_id;
  }

  StoryPage returnCurrentPage() {
    try {
      return pages[_current_page_id];
    } on RangeError {
      _current_page_id = -1;
    }
  }

  dynamic continueToNextPage(PageOption selectedOption) {
    // Gets story option, then changes current page to destination. If story is finished, will return -1 .
    if (selectedOption.dest_id == -1) {
      _current_page_id = -1;
      return -1;
    } else {
      _current_page_id = selectedOption.dest_id;
      return true;
    }
  }
}
