class ResultModel {}

class DataSuccess extends ResultModel {}

class ErrorModel extends ResultModel {
  String message;
  ErrorModel({
    required this.message,
  });
}

class ExceptionModel extends ResultModel {
  String message;
  ExceptionModel({
    required this.message,
  });
}

class ListOf<T> extends ResultModel {
  List<T> listOfData;
  ListOf({
    required this.listOfData,
  });
}
