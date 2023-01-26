{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "GameCenter",
  "optionsFile": "options.json",
  "options": [],
  "exportToGame": true,
  "supportedTargets": -1,
  "extensionVersion": "1.0.3",
  "packageId": "",
  "productId": "",
  "author": "",
  "date": "2019-03-28T05:11:31",
  "license": "",
  "description": "",
  "helpfile": "",
  "iosProps": true,
  "tvosProps": false,
  "androidProps": false,
  "html5Props": false,
  "installdir": "",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","filename":"GameCenter.ext","origname":"","init":"","final":"","kind":4,"uncompress":false,"functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_PresentView_Default","externalName":"GameCenter_PresentView_Default","kind":4,"help":"GameCenter_PresentView_Default()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_PresentView_Achievements","externalName":"GameCenter_PresentView_Achievements","kind":4,"help":"GameCenter_PresentView_Achievements","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_PresentView_Leaderboards","externalName":"GameCenter_PresentView_Leaderboards","kind":4,"help":"GameCenter_PresentView_Leaderboards()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_PresentView_Leaderboard","externalName":"GameCenter_PresentView_Leaderboard","kind":4,"help":"GameCenter_PresentView_Leaderboard(id,timescope,playerscope)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_LocalPlayer_Authenticate","externalName":"GameCenter_LocalPlayer_Authenticate","kind":4,"help":"GameCenter_LocalPlayer_Authenticate()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_LocalPlayer_IsAuthenticated","externalName":"GameCenter_LocalPlayer_IsAuthenticated","kind":4,"help":"GameCenter_LocalPlayer_IsAuthenticated()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_LocalPlayer_IsUnderage","externalName":"GameCenter_LocalPlayer_IsUnderage","kind":4,"help":"GameCenter_LocalPlayer_IsUnderage()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_LocalPlayer_GetInfo","externalName":"GameCenter_LocalPlayer_GetInfo","kind":4,"help":"GameCenter_LocalPlayer_GetInfo()","hidden":false,"returnType":1,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_SavedGames_Fetch","externalName":"GameCenter_SavedGames_Fetch","kind":4,"help":"GameCenter_SavedGames_Fetch()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_SavedGames_Save","externalName":"GameCenter_SavedGames_Save","kind":4,"help":"GameCenter_SavedGames_Save(name,data)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_SavedGames_Delete","externalName":"GameCenter_SavedGames_Delete","kind":4,"help":"GameCenter_SavedGames_Delete(name)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_SavedGames_GetData","externalName":"GameCenter_SavedGames_GetData","kind":4,"help":"GameCenter_SavedGames_GetData(name)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_SavedGames_ResolveConflict","externalName":"GameCenter_SavedGames_ResolveConflict","kind":4,"help":"GameCenter_SavedGames_ResolveConflict(conlfict_id,data)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_Leaderboard_Submit","externalName":"GameCenter_Leaderboard_Submit","kind":4,"help":"GameCenter_Leaderboard_Submit(id,score,context)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_Achievement_Report","externalName":"GameCenter_Achievement_Report","kind":4,"help":"GameCenter_Achievement_Report(identifier,percent,showcompletionbanner)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_Achievement_ResetAll","externalName":"GameCenter_Achievement_ResetAll","kind":4,"help":"GameCenter_Achievement_ResetAll()","hidden":false,"returnType":1,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_PresentView_Achievement","externalName":"GameCenter_PresentView_Achievement","kind":4,"help":"GameCenter_PresentView_Achievement(achievement_id)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_MacOS_RegisterCallbacks","externalName":"RegisterCallbacks","kind":4,"help":"GameCenter_MacOS_RegisterCallbacks(please,do,NOT,call)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
            1,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_MacOS_SetWindowHandle","externalName":"GameCenter_MacOS_SetWindowHandle","kind":4,"help":"GameCenter_MacOS_SetWindowHandle(result_of_window_handle)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_LocalPlayer_IsMultiplayerGamingRestricted","externalName":"GameCenter_LocalPlayer_IsMultiplayerGamingRestricted","kind":4,"help":"GameCenter_LocalPlayer_IsMultiplayerGamingRestricted()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted","externalName":"GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted","kind":4,"help":"GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_AccessPoint_SetActive","externalName":"GameCenter_AccessPoint_SetActive","kind":4,"help":"GameCenter_AccessPoint_SetActive(isActive)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_AccessPoint_GetActive","externalName":"GameCenter_AccessPoint_GetActive","kind":4,"help":"GameCenter_AccessPoint_GetActive()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_AccessPoint_SetLocation","externalName":"GameCenter_AccessPoint_SetLocation","kind":4,"help":"GameCenter_AccessPoint_SetLocation(pointlocation)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_AccessPoint_GetLocation","externalName":"GameCenter_AccessPoint_GetLocation","kind":4,"help":"GameCenter_AccessPoint_GetLocation()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_AccessPoint_IsPresentingGameCenter","externalName":"GameCenter_AccessPoint_IsPresentingGameCenter","kind":4,"help":"GameCenter_AccessPoint_IsPresentingGameCenter()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_AccessPoint_IsVisible","externalName":"GameCenter_AccessPoint_IsVisible","kind":4,"help":"GameCenter_AccessPoint_IsVisible()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_AccessPoint_SetShowHighlights","externalName":"GameCenter_AccessPoint_SetShowHighlights","kind":4,"help":"GameCenter_AccessPoint_SetShowHighlights(show)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_AccessPoint_GetShowHighlights","externalName":"GameCenter_AccessPoint_GetShowHighlights","kind":4,"help":"GameCenter_AccessPoint_GetShowHighlights()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_AccessPoint_GetCoordinate","externalName":"GameCenter_AccessPoint_GetCoordinate","kind":4,"help":"GameCenter_AccessPoint_GetCoordinate(coordinate)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_AccessPoint_PresentWithState","externalName":"GameCenter_AccessPoint_PresentWithState","kind":4,"help":"GameCenter_AccessPoint_PresentWithState(state)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_AccessPoint_Present","externalName":"GameCenter_AccessPoint_Present","kind":4,"help":"GameCenter_AccessPoint_Present()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_Leaderboard_LoadGlobal","externalName":"GameCenter_Leaderboard_LoadGlobal","kind":4,"help":"GameCenter_Leaderboard_LoadGlobal(leaderboardID,timeScope,rangeStart,rangeEnd)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            2,
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_Leaderboard_LoadFriendsOnly","externalName":"GameCenter_Leaderboard_LoadFriendsOnly","kind":4,"help":"GameCenter_Leaderboard_LoadFriendsOnly(leaderboardID,timeScope,rangeStart,rangeEnd)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            2,
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"GameCenter_Achievement_Load","externalName":"GameCenter_Achievement_Load","kind":4,"help":"GameCenter_Achievement_Load()","hidden":false,"returnType":1,"argCount":0,"args":[],"documentation":"",},
      ],"constants":[
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_Leaderboard_PlayerScope_Global","value":"0","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_Leaderboard_PlayerScope_FriendsOnly","value":"1","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_Leaderboard_TimeScope_Today","value":"0","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_Leaderboard_TimeScope_Week","value":"1","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_Leaderboard_TimeScope_AllTime","value":"2","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_AccessPoint_Location_TopLeading","value":"0","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_AccessPoint_Location_TopTrailing","value":"1","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_AccessPoint_Location_BottomLeading","value":"2","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_AccessPoint_Location_BottomTrailing","value":"3","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_AccessPoint_Coordinate_OriginX","value":"0","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_AccessPoint_Coordinate_OriginY","value":"1","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_AccessPoint_Coordinate_SizeWidth","value":"2","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_AccessPoint_Coordinate_SizeHeight","value":"3","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_AccessPoint_State_Default","value":"-1","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_AccessPoint_State_Leaderboards","value":"0","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_AccessPoint_State_Achievements","value":"1","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_AccessPoint_State_Challenges","value":"2","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_AccessPoint_State_LocalPlayerProfile","value":"3","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_AccessPoint_State_Dashboard","value":"4","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_AccessPoint_State_LocalPlayerFriendsList","value":"5","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_Leaderboard_Type_Classic","value":"0","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_Leaderboard_Type_Recurring","value":"1","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"GameCenter_Invalid","value":"-1","hidden":false,},
      ],"ProxyFiles":[
        {"resourceType":"GMProxyFile","resourceVersion":"1.0","name":"libGameCenter.dylib","TargetMask":1,},
      ],"copyToTargets":9007199254740998,"usesRunnerInterface":false,"order":[
        {"name":"GameCenter_PresentView_Default","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_PresentView_Achievements","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_PresentView_Achievement","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_PresentView_Leaderboards","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_PresentView_Leaderboard","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_LocalPlayer_Authenticate","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_LocalPlayer_IsAuthenticated","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_LocalPlayer_IsUnderage","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_LocalPlayer_GetInfo","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_SavedGames_Fetch","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_SavedGames_Save","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_SavedGames_Delete","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_SavedGames_GetData","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_SavedGames_ResolveConflict","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_Leaderboard_Submit","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_Achievement_Report","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_Achievement_ResetAll","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_MacOS_RegisterCallbacks","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_MacOS_SetWindowHandle","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_LocalPlayer_IsMultiplayerGamingRestricted","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_AccessPoint_SetActive","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_AccessPoint_GetActive","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_AccessPoint_SetLocation","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_AccessPoint_GetLocation","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_AccessPoint_IsPresentingGameCenter","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_AccessPoint_IsVisible","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_AccessPoint_SetShowHighlights","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_AccessPoint_GetShowHighlights","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_AccessPoint_GetCoordinate","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_AccessPoint_PresentWithState","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_AccessPoint_Present","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_Leaderboard_LoadGlobal","path":"extensions/GameCenter/GameCenter.yy",},
        {"name":"GameCenter_Leaderboard_LoadFriendsOnly","path":"extensions/GameCenter/GameCenter.yy",},
      ],},
  ],
  "HTML5CodeInjection": "",
  "classname": "GameCenter",
  "tvosclassname": "",
  "tvosdelegatename": "",
  "iosdelegatename": "",
  "androidclassname": "",
  "sourcedir": "",
  "androidsourcedir": "",
  "macsourcedir": "",
  "maccompilerflags": "",
  "tvosmaccompilerflags": "",
  "maclinkerflags": "",
  "tvosmaclinkerflags": "",
  "iosplistinject": "",
  "tvosplistinject": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidactivityinject": "",
  "gradleinject": "",
  "androidcodeinjection": "",
  "hasConvertedCodeInjection": true,
  "ioscodeinjection": "\r\n<YYIosEntitlements>\r\n\r\n     <key>com.apple.developer.game-center</key>\r\n      <true/>\r\n\r\n\t<key>com.apple.developer.icloud-container-identifiers</key>\r\n\t<array>\r\n\t\t<string>iCloud.${YYPackageName}</string>\r\n\t</array>\r\n\r\n\t<key>com.apple.developer.icloud-services</key>\r\n\t<array>\r\n\t\t<string>CloudDocuments</string>\r\n\t</array>\r\n\r\n</YYIosEntitlements>\r\n",
  "tvoscodeinjection": "",
  "iosSystemFrameworkEntries": [
    {"resourceType":"GMExtensionFrameworkEntry","resourceVersion":"1.0","name":"GameKit.framework","weakReference":false,"embed":0,},
  ],
  "tvosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
  "IncludedResources": [],
  "androidPermissions": [],
  "copyToTargets": 9007199254740998,
  "iosCocoaPods": "",
  "tvosCocoaPods": "",
  "iosCocoaPodDependencies": "",
  "tvosCocoaPodDependencies": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/GameCenter/Extensions.yy",
  },
}