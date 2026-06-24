/// @description Show achievements

// This function shows a screen overlay with all achievements information.
// Dismissing the view triggers the subscribed view callback (set up in
// Obj_GameCenter via gamecenter_view_callback_subscribe).
gamecenter_present_view_achievements();
