/// @description Fetch achievement data

// This function loads all the achievements without displaying the Game Center
// UI. The result is delivered to the 'on_load' callback defined in the Create
// event (replaces the old Social Async event).
asyncBusy = true;
gamecenter_achievement_load(on_load);
