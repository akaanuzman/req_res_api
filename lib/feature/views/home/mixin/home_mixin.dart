import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../products/widgets/alert_dialog/approve_dialog.dart';

import '../../../../products/constants/index.dart';
import '../../../controllers/user_controller.dart';
import '../home_view.dart';

mixin HomeMixin on ConsumerState<HomeView> {
  final userController = ChangeNotifierProvider((ref) => UserController());

  @override
  void initState() {
    ref.read(userController).fetchUsers();
    super.initState();
  }

  Future<void> showLogoutDialog() async {
    ApproveDialog.show(
      context: context,
      title: StringConstants.dearUser,
      content: StringConstants.areUSureLogout,
      isHasYesNoActions: true,
      onYesPressed: () async => await ref.read(userController).logout(context),
    );
  }
}
