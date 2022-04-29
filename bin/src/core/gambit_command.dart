import 'package:args/command_runner.dart';
import 'package:dcli/dcli.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'command_descriptor.dart';

abstract class GambitCommand extends Command {
  final CommandDescriptor commandDescriptor;
  bool verboseEnabled = false;

  @override
  String get description => commandDescriptor.commandDescription;

  @override
  String get name => commandDescriptor.commandName;

  GambitCommand(this.commandDescriptor) {
    for (final option in commandDescriptor.options) {
      argParser.addOption(
        option.name,
        abbr: option.abbr,
        help: option.help,
        defaultsTo: option.defaultValue,
        mandatory: option.mandatory,
      );
    }

    for (final flag in commandDescriptor.flags) {
      argParser.addFlag(
        flag.name,
        abbr: flag.abbr,
        help: flag.help,
        negatable: flag.negatable,
      );
    }
  }

  printDebug(
    String message, {
    String verbosePrefix = "",
    String verboseSuffix = "",
  }) {
    if (verboseEnabled) {
      print("$verbosePrefix $message $verboseSuffix".trim());
    }
  }

  printSuccess(
    String message, {
    String verbosePrefix = "",
    String verboseSuffix = "",
  }) {
    if (verboseEnabled) {
      print(green("$verbosePrefix $message $verboseSuffix".trim()));
    } else {
      print(message);
    }
  }

  printError(String message) {
    printerr(red(message));
  }

  @override
  @mustCallSuper

  /// Run command
  /// Check verbose mode
  void run() {
    verboseEnabled = argResults!["verbose"] ?? false;
  }
}
