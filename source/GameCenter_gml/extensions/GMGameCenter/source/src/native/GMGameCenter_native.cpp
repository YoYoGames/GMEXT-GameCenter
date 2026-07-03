#include "GMGameCenter_native.h"

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

void gamecenter_leaderboard_submit(std::string_view leaderboard_id,
                                   std::int32_t score,
                                   std::int32_t context,
                                   const gm::wire::GMFunction& callback)
{
    // Note: GameCenter is iOS-only. This is a placeholder that creates
    // a failure result. The iOS implementation should override this.
    GameCenterLeaderboardSubmitResult result{};
    result.success = false;
    result.error_code = -1;
    result.error_message = "Not implemented on this platform";
    result.leaderboard_id = std::string(leaderboard_id);
    result.score = score;
    result.context = context;

    if (callback) {
        callback.call(result);
    }
}
