class PostBook {
  int? bookId;
  int? availableQuantity;
  int? publishedYear;
  int? subCategoryId;
  String? title;
  List<int?>? authorsIds;

  PostBook({
    this.bookId = 0,
    this.title,
    this.availableQuantity,
    this.publishedYear,
    this.subCategoryId,
    this.authorsIds,
});

  Map<String , dynamic> toJson() {
    return {
      'bookId': bookId,
      'availableQuantity': availableQuantity,
      'title': title,
      'subCategoryId': subCategoryId,
      'publishedYear': publishedYear,
      'authorsIds': authorsIds,
    };
  }
}
