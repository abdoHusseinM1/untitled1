import 'package:untitled/models/author.dart';
import 'package:untitled/models/book_model.dart';
import 'package:untitled/models/category.dart';
import 'package:untitled/models/officer.dart';
import 'package:untitled/models/student.dart';
import 'package:untitled/models/sub_category.dart';


 Officer? currentOfficer = Officer(
  fullName: "empty name",
  email: 'Empty Email',
  nationalId: 'Empty National Id',
  isAdmin: true,
 );

 List<PostCategory> categories = [];

List<SubCategory> allSubCategories = [];
List<Author> allAuthors = [];

Book? selectedBookToAdd = Book.empty();
Student? selectedStudentToAdd = Student.empty();

List<Student> students = [];