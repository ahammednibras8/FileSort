import 'dart:io';

import 'package:args/args.dart';

void main(List<String> arguments) {
  //Set up the argument parser
  final parser = ArgParser()
    ..addOption('path', abbr: 'p', help: 'The directory to organize')
    ..addOption('types',
        abbr: 't', help: 'Comma-separated file types to organize');

  //Parse arguments
  final argResults = parser.parse(arguments);

  final path = argResults['path'];
  final types = argResults['types']?.split(',');

  //Check if the path arguments is provided
  if (path == null) {
    print('Error: You must provide a directory path');
    return;
  }

  //Check if the directory exists
  final directory = Directory(path);
  if (!directory.existsSync()) {
    print('Error: The directory does not exists');
    return;
  }

  print('Organizing files in: $path');
  if (types != null) {
    print('Organizing by the following file types: $types');
  }

  //Future file organizing logic goes here...
}
