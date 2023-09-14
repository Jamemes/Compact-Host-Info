function NetworkMatchMakingEPIC:_make_room_info(lobby)
	local room_info = {
		owner_id = lobby:key_value("owner_account_id"),
		owner_account_id = lobby:key_value("owner_id"),
		owner_name = lobby:key_value("owner_name"),
		room_id = lobby:id(),
		owner_level = lobby:key_value("owner_level")
	}
	
	return room_info
end