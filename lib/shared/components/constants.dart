String getBaseUrl() => 'https://libraryapiapp.azurewebsites.net/';

Map<String, String> getHeaders() => {
      'Content-Type': 'application/json; charset=UTF-8',
    };

String getStudentUrl() => 'api/student/';

String getBlockStudentUrl() => 'block-student/';

String getAcceptStudentUrl() => 'accept-student/';

String getBookUrl() => 'api/book/';

String getCategoryUrl() => 'api/Category/';

String getDeleteCategoryUrl(int? id) => '${getBaseUrl()}${getCategoryUrl()}$id';

String getSubCategoryUrl() => 'api/SubCategory/';

String getAddNewSubCategoryUrl() =>
    '${getBaseUrl()}api/SubCategory/add-new-subCategory';

String getAuthorUrl() => 'api/Author/';

String getOfficerUrl() => 'api/Officer/';

String getRequestUrl() => 'api/request/';
String getLoginOfficerUrl()=>'api/login/login-officer/';

String getFormattedDate(DateTime? dateTime) =>
    '${dateTime!.year} / ${dateTime.month} / ${dateTime.day}';
