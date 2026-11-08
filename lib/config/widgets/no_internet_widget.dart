import 'package:app/config/assets.dart';
import 'package:app/config/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoInternetWidget extends StatelessWidget {
  final VoidCallback onRetry;
  const NoInternetWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              SvgPicture.asset(
                Assets.assetsIconsNetwork,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              const SizedBox(height: 24),
              Text(
                'server_connection_error'.tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                onPressed: onRetry,
                text: 'retry'.tr(),
                backgroundColor: const Color(0xFFEE6352),
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
