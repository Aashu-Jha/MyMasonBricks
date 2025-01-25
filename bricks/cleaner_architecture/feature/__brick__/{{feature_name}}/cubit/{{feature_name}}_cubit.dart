import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '{{feature_name}}_state.dart';

class {{feature_name.pascalCase()}}Cubit extends Cubit<{{feature_name.pascalCase()}}State> {
  {{feature_name.pascalCase()}}Cubit() : super({{feature_name.pascalCase()}}Initial());
}
