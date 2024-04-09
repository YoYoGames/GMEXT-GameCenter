// Functions

/**
 * @func GameCenter_MacOS_SetWindowHandle
 * @desc This function passes the GameMaker window handle, as returned by ${function.window_handle}, to the extension.
 *
 * On MacOS we need to pass this to the extension before actually using any functionality, or else the extension won't show any GameCenter pop-ups.
 * 
 * @param {string} result_of_window_handle The result of a call to ${function.window_handle}
 * 
 * @returns {boolean} `true` if successful or `false` if the window is undefined or the view controller is undefined
 * 
 * @version {}
 * 
 * @example
 * 
 * ```gml
 * var _handle = window_handle();
 * GameCenter_MacOS_SetWindowHandle(_handle);
 * ```
 * 
 * @func_end
 */

// Constants


// Modules

/**
 * @module macos
 * @title MacOS
 * @section_func
 * @ref GameCenter_MacOS_SetWindowHandle
 * @section_end
 * 
 * @module_end
 */