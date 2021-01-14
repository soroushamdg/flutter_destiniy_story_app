class PageOption {
  int dest_id; // represents destination page id. -1 means no destination and end of story.
  String option_text;

  PageOption({this.dest_id, this.option_text});
}

class StoryPage {
  int id;

  String title;
  String text;

  bool inits_storyboard;
  List<PageOption> pageOptions;

  StoryPage(
      {this.id, this.text, this.pageOptions, this.inits_storyboard = false});
}
