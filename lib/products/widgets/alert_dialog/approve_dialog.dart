import 'package:flutter/material.dart';

import '../../constants/string_constants.dart';
import '../../generation/index.dart';

/// [ApproveDialog] is a [AlertDialog] with [TextButton] for actions.
/// [title] is required.
/// [content] is required.
/// [isHasYesNoActions] is optional default value false.
/// If you want to create a warning dialogue with two actions, you must make [isHasYesNoActions] parameter true.
/// [onYesPressed] is optional.
/// If you want to call the method that will run when the yes button is clicked, you must use [onYesPressed] parameter.
/// [show] is a static method for show dialog.
///
///
final class ApproveDialog extends StatelessWidget {
  final String title;
  final String content;
  final bool isHasYesNoActions;
  final Function()? onYesPressed;
  const ApproveDialog({
    super.key,
    required this.title,
    required this.content,
    this.isHasYesNoActions = false,
    this.onYesPressed,
  });

  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String content,
    bool isHasYesNoActions = false,
    Function()? onYesPressed,
  }) async {
    return await showAdaptiveDialog<bool?>(
      context: context,
      builder: (context) => ApproveDialog(
        title: title,
        content: content,
        isHasYesNoActions: isHasYesNoActions,
        onYesPressed: onYesPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(title),
      content: Text(content),
      actions: !isHasYesNoActions
          ? [
              _SpecialAction(
                onPressed: onYesPressed,
                label: StringConstants.ok,
              ),
            ]
          : [
              const _SpecialAction(label: StringConstants.no),
              _SpecialAction(
                label: StringConstants.yes,
                textColor: ColorName.brightRed,
                onPressed: onYesPressed,
              ),
            ],
    );
  }
}

class _SpecialAction extends StatelessWidget {
  final String label;
  final Color? textColor;
  final Function()? onPressed;
  const _SpecialAction({
    required this.label,
    this.textColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () => Navigator.pop(context, true),
      child: Text(label),
    );
  }
}
