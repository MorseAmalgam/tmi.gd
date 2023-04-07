extends RefCounted

func handle_message(message, tmi: Tmi):
	if message.notification_type != "channel.channel_points_custom_reward_redemption.add:1":
		return

	tmi.command.emit(
		"redeem",
		{
			"user": {
				"id": message.event.user_id,
				"display_name": message.event.user_name
			},
			"text": message.event.get("user_input", ""),
			"reward": message.event.reward,
		}
	)	
