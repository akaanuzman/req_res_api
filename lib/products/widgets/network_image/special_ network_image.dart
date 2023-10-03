// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/index.dart';
import '../../generation/index.dart';

/// [SpecialNetworkImage] is a [CachedNetworkImage] with [CircleAvatar] for errorWidget.
/// [imageSize] is optional default value small.
/// [iconSize] is optional default value small.
/// [imageUrl] is required.
/// [imageBuilder] is optional.
class SpecialNetworkImage extends StatelessWidget {
  final String imageUrl;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final NetworkImageSizeConstants imageSize;
  final IconSizeConstants iconSize;

  const SpecialNetworkImage({
    super.key,
    required this.imageUrl,
    required this.imageBuilder,
    this.imageSize = NetworkImageSizeConstants.small,
    this.iconSize = IconSizeConstants.small,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: imageBuilder,
      errorWidget: (context, url, error) => CircleAvatar(
        radius: imageSize.value,
        child: Icon(
          Icons.error,
          color: ColorName.brightRed,
          size: context.sized.dynamicHeight(iconSize.value),
        ),
      ),
    );
  }
}
