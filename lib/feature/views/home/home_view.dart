import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import '../../models/user_model.dart';
import '../../../products/widgets/network_image/circle_network_image.dart';
import '../../../products/constants/index.dart';
import '../../../products/generation/index.dart';
import 'mixin/home_mixin.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(userController);
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.users),
        actions: [
          IconButton(
            onPressed: () async => showLogoutDialog(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: watch.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              padding: context.padding.normal,
              itemBuilder: (context, index) {
                UserModel user = watch.users[index];
                return _UserInformationItemCard(user: user);
              },
              separatorBuilder: (context, index) =>
                  context.sized.emptySizedHeightBoxLow3x,
              itemCount: watch.users.length,
            ),
    );
  }
}

class _UserInformationItemCard extends StatelessWidget {
  const _UserInformationItemCard({
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.padding.normal,
      decoration: BoxDecoration(
        color: ColorName.placeboPurple,
        borderRadius: context.border.highBorderRadius,
        border: Border.all(
          color: ColorName.purplePristine,
          width: 2,
        ),
      ),
      child: _UserInformationsWidget(user: user),
    );
  }
}

class _UserInformationsWidget extends StatelessWidget {
  const _UserInformationsWidget({
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleNetworkImage(
          imageUrl: user.avatar ?? '',
          imageSize: NetworkImageSizeConstants.medium,
        ),
        context.sized.emptySizedWidthBoxLow3x,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${user.firstName} ${user.lastName}",
              style: context.general.textTheme.bodyLarge,
            ),
            Text(
              user.email ?? '',
              style: context.general.textTheme.bodySmall,
            ),
          ],
        )
      ],
    );
  }
}
