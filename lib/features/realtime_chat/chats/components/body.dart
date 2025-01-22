import 'package:flutter/material.dart';
import 'package:medicalassiss/core/theming/colors.dart';
import 'package:medicalassiss/core/theming/size_config.dart';
import 'package:medicalassiss/features/realtime_chat/chats/components/chat_card.dart';
import 'package:medicalassiss/features/realtime_chat/chats/components/filled_outline_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(SizeConfig.kDefaultPadding, 0,
              SizeConfig.kDefaultPadding, SizeConfig.kDefaultPadding),
          color: ColorManager.chatMainColor,
          child: Row(
            children: [
              FillOutlineButton(
                  press: () {},
                  text: AppLocalizations.of(context)!.recentmessage),
              const SizedBox(width: SizeConfig.kDefaultPadding),
              FillOutlineButton(
                press: () {},
                text: AppLocalizations.of(context)!.active,
                isFilled: false,
              ),
            ],
          ),
        ),
        // Use Consumer to automatically rebuild this part when the state changes
        ChatCard(
          id: 'id',
          username: 'username',
          press: () {
            // String generateRoomId(
            //     String senderId, String receiverId) {
            //   final sortedIds = [senderId, receiverId]..sort();
            //   return sortedIds.join(
            //       '_'); // Produces a unique string like 'user1_user2'
            // }

            // // Current user
            // String currentUser =
            //     AuthService.supabase.auth.currentUser!.id;
            // // Common approach to create a room ID by combining the user IDs of both participants
            // String roomId =
            //     generateRoomId(currentUser, user['id']);

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const PrivateChatPage(
            //       recieverName: 'username',
            //       senderId: 'currentUser',
            //       receiverId: 'id',
            //       roomId: 'roomId',
            //     ),
            //   ),
            // );
          },
        ),
      ],
    );
  }
}
