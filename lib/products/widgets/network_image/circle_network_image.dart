import 'package:flutter/material.dart';

import '../../constants/index.dart';
import 'special_ network_image.dart';

/// [CircleNetworkImage] is a [SpecialNetworkImage] with [CircleAvatar].
/// [imageSize] is optional default value small.
/// [iconSize] is optional default value small.
/// [imageUrl] is required.
///
/// This is a circle network image widget.
/// Small view is given by default.
class CircleNetworkImage extends StatelessWidget {
  final String imageUrl;
  final NetworkImageSizeConstants imageSize;
  final IconSizeConstants iconSize;
  const CircleNetworkImage({
    super.key,
    required this.imageUrl,
    this.imageSize = NetworkImageSizeConstants.small,
    this.iconSize = IconSizeConstants.small,
  });

  @override
  Widget build(BuildContext context) {
    return SpecialNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: imageSize.value,
        backgroundImage: imageProvider,
      ),
      iconSize: iconSize,
      imageSize: imageSize,
    );
  }
}
