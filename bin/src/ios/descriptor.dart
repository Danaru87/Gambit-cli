import '../core/command_descriptor.dart';
import 'get_provisioning_profiles/cmd.dart';
import 'testflight_last_build_number/cmd.dart';
import 'testflight_publish/cmd.dart';
import 'use_profile/cmd.dart';

class IOSDescriptor extends CommandDescriptor {
  IOSDescriptor()
      : super(
          commandName: "ios",
          commandDescription: """
All you need for iOS Flutter app.
Only available on MacOS.""",
          subCommands: [
            GetProvisioninProfile(),
            UseProfile(),
            TestflightLastBuildNumberCmd(),
            TestflightPublish(),
          ],
        );
}
