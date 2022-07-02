class DashboardModel {
  int? books;
  int? authors;
  int? categories;
  int? subCategories;

  DashboardModel(
      {this.books, this.authors, this.categories, this.subCategories});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    books = json['books'];
    authors = json['authors'];
    categories = json['categories'];
    subCategories = json['subCategories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['books'] = books;
    data['authors'] = authors;
    data['categories'] = categories;
    data['subCategories'] = subCategories;
    return data;
  }
}