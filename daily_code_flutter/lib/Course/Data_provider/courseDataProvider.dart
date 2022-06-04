import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_app/Course/Model/coursemodel.dart';

class CourseDataProvider {
  static const String mainUrl = "http://localhost:8080/allCourses";
  static const String addUrl = "http://localhost:8080/Course";

  Future<Course> create(Course course) async {
    final http.Response response = await http.post(
        Uri.parse("http://localhost:8080/addCourse"),
        headers: {
          "Content-Type": "application/json",
          // "Access-Control-Allow-Origin": "*"
        },
        body: jsonEncode({
          "code": course.code,
          "title": course.title,
          "description": course.description
        }));

    if (response.statusCode == 201) {
      return Course.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Can't create course");
    }
  }

  Future<Course> getbyId(String id) async {
    final response = await http.get(Uri.parse("$addUrl/$id"));

    if (response.statusCode == 200) {
      return Course.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Getting Course by id failed");
    }
  }

  Future<List<Course>> getAll() async {
    final response = await http.get(Uri.parse(mainUrl));
    if (response.statusCode == 200) {
      final courses = jsonDecode(response.body) as List;
      return courses.map((c) => Course.fromJson(c)).toList();
    } else {
      throw Exception("Could not get the courses");
    }
  }

  Future<Course> update(int id, Course course) async {
    final response =
        await http.put(Uri.parse("http://localhost:8080/updatecourse/$id"),
            headers: <String, String>{"Content-Type": "application/json"},
            body: jsonEncode({
              "id": id,
              "code": course.code,
              "title": course.title,
              "description": course.description
            }));

    if (response.statusCode == 200) {
      return Course.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the course");
    }
  }

  // static const String deleteUrl = "http://localhost:8080/deleteCourse";

  Future<void> delete(int id) async {
    final response =
        await http.delete(Uri.parse("http://localhost:8080/deleteCourse/$id"));
    if (response.statusCode != 204) {
      throw Exception("Unable to delete the course");
    }
  }
}
