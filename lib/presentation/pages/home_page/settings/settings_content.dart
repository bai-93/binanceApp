import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';

import 'settings_table.dart';

class SettingsContent extends StatefulWidget {
  const SettingsContent({super.key});

  @override
  State<SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 15.0),
      child: Column(
        children: [
          const SizedBox(
            height: 16.0,
          ),
          makeProfileContainer(),
          const SettingsTable()
        ],
      ),
    );
  }

  Widget makeProfileContainer() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
                color: AppColors.onboardingPrimary.withOpacity(0.12),
                blurRadius: 4.0,
                offset: const Offset(0.0, 3.0))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(14.0))),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14.0, top: 6.0, bottom: 6.0),
            child: SizedBox(
              width: 182.0,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: Text(
                          'baiaman_happy_life.com',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style:
                              TextStyle(color: AppColors.text, fontSize: 14.0),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'ID 28954761',
                        style: TextStyle(color: AppColors.text, fontSize: 14.0),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          debugPrint("make copy");
                        },
                        child: Image.asset(
                          'lib/images/home/settings/copy.png',
                          width: 24.0,
                          height: 24.0,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 40.0,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 22.0, bottom: 22.0, right: 14.0),
            child: Container(
              height: 36.0,
              width: 94.0,
              decoration: BoxDecoration(
                  color: AppColors.verified,
                  borderRadius: const BorderRadius.all(Radius.circular(14.0))),
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 6.0, top: 6.0, bottom: 6.0),
                    child: Image.asset(
                        'lib/images/login/signup/check_ring_light.png',
                        width: 24.0,
                        height: 24.0),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 9.0, bottom: 10.0, right: 6.0),
                    child: Text(
                      'Verified',
                      style: TextStyle(color: AppColors.text, fontSize: 14.0),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
