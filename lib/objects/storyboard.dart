import 'package:destini_app/objects/story_objects.dart';

class StoryboardController {
  int _current_page_id; // -1 means end of story.

  int _init_page_id;
  Map<int, StoryPage> pages = {
    1: StoryPage(
        id: 1,
        title: "A",
        text: "Description about A",
        pageOptions: [
          PageOption(dest_id: 2, option_text: "B"),
          PageOption(dest_id: 3, option_text: "C"),
          PageOption(dest_id: 4, option_text: "D"),
        ],
        inits_storyboard: true),
    2: StoryPage(
      id: 2,
      title: "B",
      text: "Description about B",
      pageOptions: [
        PageOption(dest_id: 5, option_text: "E"),
        PageOption(dest_id: 6, option_text: "F"),
        PageOption(dest_id: 7, option_text: "H"),
      ],
    ),
    3: StoryPage(
      id: 3,
      title: "C",
      text: "Description about C",
      pageOptions: [
        PageOption(dest_id: 4, option_text: "D"),
        PageOption(dest_id: 7, option_text: "H"),
      ],
    ),
    4: StoryPage(
      id: 4,
      title: "D",
      text: "Description about D",
      pageOptions: [
        PageOption(dest_id: 8, option_text: "J"),
        PageOption(dest_id: 9, option_text: "K"),
      ],
    ),
    5: StoryPage(
      id: 5,
      title: "E",
      text: "Description about E",
      pageOptions: [],
    ),
    6: StoryPage(
      id: 6,
      title: "F",
      text: "Description about F",
      pageOptions: [],
    ),
    7: StoryPage(
      id: 7,
      title: "H",
      text: "Description about H",
      pageOptions: [
        PageOption(dest_id: 10, option_text: "L"),
        PageOption(dest_id: 12, option_text: "N"),
      ],
    ),
    8: StoryPage(
      id: 8,
      title: "J",
      text: "Description about J",
      pageOptions: [
        PageOption(dest_id: 7, option_text: "H"),
      ],
    ),
    9: StoryPage(
      id: 9,
      title: "K",
      text: "Description about K",
      pageOptions: [
        PageOption(dest_id: 11, option_text: "M"),
      ],
    ),
    10: StoryPage(
      id: 10,
      title: "L",
      text: "Description about L",
      pageOptions: [],
    ),
    11: StoryPage(
      id: 11,
      title: "M",
      text: "Description about M",
      pageOptions: [
        PageOption(dest_id: 7, option_text: "H"),
      ],
    ),
    12: StoryPage(
      id: 12,
      title: "N",
      text: "Description about N",
      pageOptions: [],
    ),
  };

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
        _current_page_id = page.id;
      }
    }
  }

  void startStoryboard() {
    findInitiationPage();
    _current_page_id = _init_page_id;
  }

  int returnCurrentPageID() {
    return _current_page_id;
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
