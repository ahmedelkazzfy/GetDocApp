import 'package:flutter/material.dart';
import 'package:medicalassiss/core/theming/colors.dart';
import 'package:medicalassiss/core/theming/size_config.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.id,
    required this.username,
    required this.press,
  });

  final String id;
  final String username;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultPadding,
            vertical: SizeConfig.kDefaultPadding * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  child: Text(username.toString().substring(0, 1)),
                ),
                if (true)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: ColorManager.mainColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 3),
                      ),
                    ),
                  )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: SizeConfig.kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    const Opacity(
                      opacity: 0.64,
                      child: Text(
                        'last massage',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Opacity(
              opacity: 0.64,
              child: Text('time'),
            ),
          ],
        ),
      ),
    );
  }
}
