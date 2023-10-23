import 'package:flutter/material.dart';
import 'package:flutter_ecom_firebase/constants/strings.dart';
import 'package:get/get.dart';

import '../../../app_widgets/asset_image.dart';
import '../../../app_widgets/unfocus_widget.dart';
import '../../../constants/assets.dart';
import '../../../constants/dimens.dart';
import '../../../constants/styles.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  Widget _buildBody(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Padding(
        padding: Dimens.edgeInsetsHorizDefault,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Dimens.boxHeight32,
              _buildBody1(),
              _buildRegisterBody(context),
              _buildRegisterText(),
            ]),
      ),
    ));
  }

  Widget _buildRegisterText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Dimens.boxHeight10,
        Text(
          StringValues.rightAddress,
          style: AppStyles.style12Normal.copyWith(
            color: Theme.of(Get.context!).textTheme.titleMedium!.color,
          ),
        )
      ],
    );
  }

  Widget _buildBody1() {
    return Padding(
      padding: Dimens.edgeInsets12_16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: Dimens.thirtyFour,
            height: Dimens.thirtyFour,
            child: NxAssetImage(
              imgAsset: AssetValues.quadrant,
              width: Dimens.screenWidth,
              fit: BoxFit.cover,
            ),
          ),
          Dimens.boxWidth4,
          Padding(
            padding: Dimens.edgeInsets12_0,
            child: Text(
              StringValues.keliene,
              style: AppStyles.style14Bold.copyWith(
                color: Theme.of(Get.context!).textTheme.titleMedium!.color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UnFocusWidget(
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: Dimens.screenWidth,
            height: Dimens.screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildBody(context),
                // _buildRegisterationBody(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterBody(BuildContext context) {
    return Container();
  }
}
