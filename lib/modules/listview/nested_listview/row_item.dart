class RowItem {
  String title;
  List<String> children;
  bool isExpanded;

  RowItem(
      {required this.title, required this.children, this.isExpanded = false});
}
