// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class ModelVisitor extends SimpleElementVisitor<void> {
  String className = '';
  Map<String, dynamic> fields = {};

  @override
  visitConstructorElement(ConstructorElement element) {
    final returnType = element.returnType.toString();
    className = returnType;
  }

  @override
  visitFieldElement(FieldElement element) {
    fields[element.name] = element.type.toString();
  }
}
