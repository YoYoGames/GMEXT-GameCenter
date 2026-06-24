/// @description Get data

if (locked) exit;

Obj_GameCenter_SavedGames.selected = name;
Obj_GameCenter_SavedGames.load_saved_game_data(name);
