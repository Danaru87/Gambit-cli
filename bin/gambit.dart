import 'dart:io';

import 'package:args/command_runner.dart';
import 'src/apple/provisioning_profiles/cmd.dart';
import 'src/apple/use_profile/cmd.dart';
import 'src/get_app_version/cmd.dart';

void main(List<String> arguments) {
  CommandRunner("gambit", "You helpfull tool for flutter cicd")
    ..addCommand(
      GetAppVersionCmd(),
    )
    ..addCommand(AppleProvisioninProfileCmd())
    ..addCommand(AppleUseProfile())
    ..run(arguments).catchError((error) {
      if (error is! UsageException) throw error;
      print(error);
      exit(64);
    });
}
