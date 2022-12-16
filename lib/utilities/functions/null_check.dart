bool isNull(dynamic data) {
  List nulls = [null, '', 'null', {}, [], "Null"];
  return nulls.contains(data);
}
