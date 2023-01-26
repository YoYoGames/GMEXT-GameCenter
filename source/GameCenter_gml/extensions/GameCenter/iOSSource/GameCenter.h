#import <GameKit/GameKit.h>

@interface GameCenter:NSObject <GKGameCenterControllerDelegate,GKLocalPlayerListener>
{
}

@property (nonatomic, strong) NSMutableArray *ArrayOfConflicts;
@property (nonatomic) double LastAsyncOpId;

// -(double) GameCenter_MacOS_SetWindowHandle:(NSWindow*) ptrgamewindowhandle;//NOT FOR IOS

-(double) GameCenter_PresentView_Default;
-(double) GameCenter_PresentView_Achievements;
-(double) GameCenter_PresentView_Achievement:(NSString*) ach_id;
-(double) GameCenter_PresentView_Leaderboards;
-(double) GameCenter_PresentView_Leaderboard:(NSString*) leaderboardId leaderboardTimeScope: (double) leaderboardTimeScope playerScope:(double) playerScope;

-(double) GameCenter_LocalPlayer_Authenticate;
-(double) GameCenter_LocalPlayer_IsAuthenticated;
-(double) GameCenter_LocalPlayer_IsUnderage;
-(double) GameCenter_LocalPlayer_IsMultiplayerGamingRestricted;
-(double) GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted;
-(NSString*) GameCenter_LocalPlayer_GetInfo;

-(double) GameCenter_SavedGames_Fetch;
-(double) GameCenter_SavedGames_Save: (NSString*) name data: (NSString*) mNSData;
-(double) GameCenter_SavedGames_Delete: (NSString*) name;
-(double) GameCenter_SavedGames_GetData: (NSString*) name;
-(double) GameCenter_SavedGames_ResolveConflict:(double) conflict_ind data:(NSString*) data;

-(double) GameCenter_Leaderboard_Submit: (NSString*) leaderboardID score: (double) score dcontext: (double) dcontext;
-(double) GameCenter_Leaderboard_LoadGlobal: (NSString*) leaderboardID timeScope:(double) timeScope rangeStart:(double) rangeStart rangeEnd:(double) rangeEnd;
-(double) GameCenter_Leaderboard_LoadFriendsOnly: (NSString*) leaderboardID timeScope:(double) timeScope rangeStart:(double) rangeStart rangeEnd:(double) rangeEnd;

-(double) GameCenter_Achievement_Load;
-(double) GameCenter_Achievement_Report: (NSString*) identifier percentComplete: (double) percent showCompletionBanner:(double) showCompletionBanner;
-(double) GameCenter_Achievement_ResetAll;

-(double) RegisterCallbacks: (NSString*) a1 a2: (NSString*) a2 a3: (NSString*) a3 a4: (NSString*) a4;

/* GKAccessPoint: https://developer.apple.com/documentation/gamekit/gkaccesspoint?language=objc */
-(double) GameCenter_AccessPoint_SetActive:(double)dactive;
-(double) GameCenter_AccessPoint_GetActive;
-(double) GameCenter_AccessPoint_SetLocation:(double)dlocation;
-(double) GameCenter_AccessPoint_GetLocation;
-(double) GameCenter_AccessPoint_IsPresentingGameCenter;
-(double) GameCenter_AccessPoint_IsVisible;
-(double) GameCenter_AccessPoint_SetShowHighlights:(double)dshow;
-(double) GameCenter_AccessPoint_GetShowHighlights;
-(double) GameCenter_AccessPoint_GetCoordinate:(double)dcoordid;
-(double) GameCenter_AccessPoint_PresentWithState:(double)dstate;
-(double) GameCenter_AccessPoint_Present;

@end
