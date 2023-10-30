import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom_firebase/app_widgets/app_filled_btn.dart';
import 'package:flutter_ecom_firebase/app_widgets/app_outlined_btn.dart';
import 'package:flutter_ecom_firebase/app_widgets/unfocus_widget.dart';
import 'package:flutter_ecom_firebase/constants/dimens.dart';
import 'package:flutter_ecom_firebase/constants/strings.dart';
import 'package:flutter_ecom_firebase/constants/styles.dart';
import 'package:flutter_ecom_firebase/modules/auth/controllers/register_controller.dart';
import 'package:get/get.dart';

import '../../../app_widgets/app_text_btn.dart';
import '../../../app_widgets/asset_image.dart';
import '../../../constants/assets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return UnFocusWidget(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Dimens.boxHeight20, _buildLoginBody(context)],
        ),
      ),
    );
  }

  Widget _buildLoginBody(BuildContext context) {
    return GetBuilder<RegisterController>(
        builder: (logic) => Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: Dimens.edgeInsets12_16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Dimens.boxHeight12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Dimens.boxHeight20,
                        NxAssetImage(
                          imgAsset: AssetValues.quadrant,
                          height: Dimens.thirty,
                          width: Dimens.thirty,
                        ),
                        Text(
                          StringValues.keliene,
                          style: AppStyles.style36Bold.copyWith(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Dimens.boxHeight16,
                    Text(
                      StringValues.letLogin,
                      style: AppStyles.style36Bold.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Dimens.boxHeight16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          StringValues.alreadyHaveAccount,
                          style: AppStyles.style15Normal.copyWith(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Dimens.boxWidth8,
                        Text(
                          StringValues.login,
                          style: AppStyles.style15Bold.copyWith(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    Dimens.boxHeight24,
                    _buildLoginField(context, logic)
                  ],
                ),
              ),
            )));
  }

  Widget _buildLoginField(BuildContext context, RegisterController logic) {
    return FocusScope(
        node: logic.focusNode,
        child: Column(
          children: [
            Dimens.boxHeight32,
            TextFormField(
              decoration: const InputDecoration(
                hintText: StringValues.emailOrUsername,
              ),
              keyboardType: TextInputType.text,
              maxLines: 1,
              style: AppStyles.style14Normal.copyWith(
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
              controller: logic.emailTextController,
              onEditingComplete: logic.focusNode.nextFocus,
            ),
            Dimens.boxHeight16,
            TextFormField(
              obscureText: logic.showPassword,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: logic.toggleViewPassword,
                  child: Icon(
                    logic.showPassword
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                  ),
                ),
                hintText: StringValues.password,
              ),
              keyboardType: TextInputType.visiblePassword,
              maxLines: 1,
              style: AppStyles.style14Normal.copyWith(
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
              controller: logic.passwordTextController,
              onEditingComplete: logic.focusNode.unfocus,
            ),
            Dimens.heightedBox(Dimens.twentyEight),
            NxTextButton(
              label: StringValues.forgotPassword,
              //onTap: RouteManagement.goToForgotPasswordView,
              onTap: () {},
            ),
            Dimens.boxHeight32,
            NxFilledButton(
              // onTap: () => logic.login(),
              label: StringValues.login,
              height: Dimens.fiftyFour,
              width: Dimens.screenWidth,
            ),
            Dimens.boxHeight32,
            _buildSocialLoginBtn(context, logic)
          ],
        ));
  }

  Widget _buildSocialLoginBtn(BuildContext context, RegisterController logic) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: NxOutlinedButton(
          label: StringValues.gmail,
          prefix: NxAssetImage(
            imgAsset: AssetValues.gmailIcon,
            height: Dimens.fourty,
            width: Dimens.thirty,
          ),
        )),
        Dimens.boxWidth12,
        Expanded(
            child: NxOutlinedButton(
          label: StringValues.facebook,
          prefix: NxAssetImage(
            imgAsset: AssetValues.facebookIcon,
            height: Dimens.fourty,
            width: Dimens.thirty,
          ),
        )),
      ],
    );
  }
}
