// ignore_for_file: depend_on_referenced_packages

import 'package:annotations/annotations.dart';
import 'package:generators/src/model_visitors.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';

class JsonGenerator extends GeneratorForAnnotation<JsonGenAnnotation> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    final buffer = StringBuffer();
    final className = '${visitor.className}Gen';
    buffer.writeln('class $className {');
    for (final field in visitor.fields.entries) {
      buffer.writeln('  final ${field.value} ${field.key};');
    }
    buffer.writeln('$className({');
    for (final field in visitor.fields.entries) {
      buffer.writeln('  required this.${field.key},');
    }
    buffer.writeln('});');

    buffer.writeln('String get json => \'{"${visitor.fields.keys.join('", "')}"}\';');

    buffer.writeln('}');

    print(buffer.toString());

    return buffer.toString();
  }
}
