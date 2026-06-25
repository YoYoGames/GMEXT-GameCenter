
/**
 * @module home
 * @title GameCenter
 *
 * @section Extension's Features
 * @desc
 *
 * * Authenticate the local player with Apple Game Center
 * * Present the native Game Center overlays (dashboard, achievements, leaderboards)
 * * Submit scores to and load leaderboards
 * * Report, load and reset achievements
 * * Create, save, load, delete and resolve conflicts for iCloud saved games
 * * Show and control the Game Center access point
 *
 * @section_end
 *
 * @section Introduction
 *
 * @desc
 *
 * This extension wraps Apple's [GameKit](https://developer.apple.com/documentation/gamekit) framework, so it is only supported on **iOS and macOS**. Before using any other feature you must authenticate the local player with ${function.gamecenter_local_player_authenticate}.
 *
 * Game Center lets players build an identity across Apple platforms and enables features like leaderboards, achievements, saved games, the access point, and the system dashboard ([Game Center website](https://developer.apple.com/game-center/)).
 *
 * Leaderboards let players participate in competitions within your game and see how they rank among global players or their Game Center friends. Achievements are milestones that indicate when a player reaches a particular goal; players see them as locked, in progress, or completed. Saved games let players store progress in their iCloud account and sync it across their devices.
 *
 * @section_end
 *
 * @section Guides
 * @desc Guides for the GameCenter extension.
 * @reference page.setup
 * @reference page.quick_start_guide
 * @section_end
 *
 * @section Modules
 * @desc The following are the available modules for the GameCenter extension:
 *
 * @reference module.localplayer
 * @reference module.presentview
 * @reference module.savedgames
 * @reference module.leaderboard
 * @reference module.achievement
 * @reference module.accesspoint
 *
 * @section_end
 *
 * @module_end
 */
