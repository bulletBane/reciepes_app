import 'package:flutter/material.dart';
import 'package:recipes_app/presentation/shared/components/buttons/flat_button_with_annotation.dart';
import 'package:recipes_app/presentation/shared/components/buttons/green_flat_button.dart';

class ButtonsBlock extends StatelessWidget {
  final VoidCallback onGreenButtonPressed;
  final VoidCallback onFlatButtonPressed;
  final String greenButtonData;
  final String annotationData;
  final String flatButtonData;
  const ButtonsBlock({
    Key key,
    @required this.onGreenButtonPressed,
    @required this.onFlatButtonPressed,
    @required this.greenButtonData,
    @required this.flatButtonData,
    this.annotationData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GreenButton(
          onPressed: onGreenButtonPressed,
          data: greenButtonData,
        ),
        const SizedBox(
          height: 30,
        ),
        FlatButtonWithAnnotation(
          onPressed: onFlatButtonPressed,
          annotationData: annotationData,
          data: flatButtonData,
        )
      ],
    );
  }
}
