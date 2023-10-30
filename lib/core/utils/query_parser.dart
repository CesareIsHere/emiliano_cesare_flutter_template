///* This function is used to parse the query parameters and remove null values from the query parameters.
///* If value is an array (still a string but wrote as an array), create new values. Example: tags : [1,2,3] into tags[0] : 1, tags[1] : 2, tags[2] : 3
Map<String, dynamic>? queryParser(Map<String, dynamic>? query) {
  // Removing null values from the query parameters.
  query?.removeWhere((key, value) => value == null || value == []);

  // If value is an array (still a string but wrote as an array), create new values. Example: tags : [1,2,3] into tags[0] : 1, tags[1] : 2, tags[2] : 3
  var tempQuery = Map<String, dynamic>.from(query ?? {});
  tempQuery.forEach((key, value) {
    if (value is List) {
      for (var i = 0; i < value.length; i++) {
        query?["$key[$i]"] = value[i];
      }
      query?.remove(key);
    }
  });

  return query;
}
