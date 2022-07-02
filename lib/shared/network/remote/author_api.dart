import 'package:http/http.dart' as http;
import 'package:untitled/models/author.dart';
import 'package:untitled/shared/components/constants.dart';

class AuthorAPI {

  // add Author
  static Future<http.Response> addAuthor(PostAuthor author) async {
    String url = '${getBaseUrl()}${getAuthorUrl()}';

    return await http.post(
      Uri.parse(url),
      headers: getHeaders(),
      body: author.toJsonBody(),
    );
  }

  // edit Author
  static Future<http.Response> editAuthor(
      {required int? id, required String? name}) async {
    String url = '${getBaseUrl()}${getAuthorUrl()}';
    PostAuthor author = PostAuthor.named(authorName: name, authorId: id);

    return await http.put(
      Uri.parse(url),
      headers: getHeaders(),
      body: author.toJsonBody(),
    );
  }

  // get 1 Author
  static Future<http.Response> getAuthorById(int? id) async {
    String url = '${getBaseUrl()}${getAuthorUrl()}$id';

    return await http.get(
      Uri.parse(url),
      headers: getHeaders(),
    );
  }

  // get all authors
  static Future<http.Response> getAllAuthors() async {
    String uri = '${getBaseUrl()}${getAuthorUrl()}';
    return await http.get(
      Uri.parse(uri),
      headers: getHeaders(),
    );
  }

  // delete author
  static Future<http.Response> deleteAuthor(int? id) async {
    Uri uri = Uri.parse('${getBaseUrl()}${getAuthorUrl()}$id');
    return await http.delete(uri, headers: getHeaders());
  }

  static Future<http.Response> getLength() async {
    String uri = '${getBaseUrl()}${getAuthorUrl()}length';

    return await http.get(
      Uri.parse(uri),
      headers: getHeaders(),
    );
  }

}
