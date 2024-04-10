
/**
 * @module home
 * @title GameCenter
 * 
 * @section Extension's Features
 * @desc
 *
 * * Sign in to Apple GameCenter
 * * Submit to and show specific leaderboards
 * * Show multiple leaderboards
 * * Report and show achievements
 * * Create save slots
 * * Save/Delete save slots
 * * Query all save slots
 * 
 * @section_end
 *
 * @section Introduction
 * 
 * @desc
 *
 * Game Center lets players build an identity across Apple platforms and enables features like the Game Center leaderboards, achievements, multiplayer functionality, dashboard, and more. Add features within your custom user interface or take advantage of the updated Game Center user interface ([Game Center website](https://developer.apple.com/game-center/))
 *
 * Leaderboards let players participate in new competitions within your game and challenge other players to beat their score. Players see how they rank among global players, as well as their Game Center friends. You can even create a friends-only leaderboard in your custom UI. Classic leaderboards are ongoing and maintain a player's score forever. Use these to showcase scoring for overall or lifetime events, such as all-time number of matches won or the shortest time taken to complete a level. Recurring leaderboards are short lived and expire, then repeat after a set time, such as daily, monthly, or weekly. Use recurring leaderboards for timed live events — for example, to show the most matches won in a week. You can use one or both leaderboard types in your game.
 *
 * Achievements are special milestones that indicate when a player has successfully reached a particular goal in your game. You decide which achievements are relevant to your game and worth offering to your players. Players see achievements as locked, in progress, or completed. You can also create hidden achievements, which only appear once completed. Consider using hidden achievements to prevent spoilers in your game and to surprise and delight players. You can provide up to 100 achievements, each of which can award up to 100 points, and your game can award up to 1,000 points in total. Keep these limits in mind when releasing the initial version of your game, as you may want to add new achievements in future updates. For variety, consider creating a set of achievements that require dedication and a range of skills to complete.
 * 
 * @section_end
 * 
 * @section Guides
 * @desc Guides for the GameCenter extension.
 * @ref page.setup
 * @ref page.quick_start_guide
 * @section_end
 * 
 * @section Modules
 * @desc The following are the available modules for the GameCenter extension:
 * 
 * @reference module.presentview
 * @reference module.localplayer
 * @reference module.savedgames
 * @reference module.leaderboard
 * @reference module.achievement
 * @reference module.macos
 * @reference module.accesspoint
 * 
 * @section_end
 * 
 * @module_end
 */