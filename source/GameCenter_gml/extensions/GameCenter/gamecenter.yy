{
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
  "installdir": "",
  "files": [
    {"filename":"GameCenter.ext","origname":"","init":"","final":"","kind":4,"uncompress":false,"functions":[
        {"externalName":"GameCenter_PresentView_Default","kind":4,"help":"GameCenter_PresentView_Default()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"GameCenter_PresentView_Default","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_PresentView_Achievements","kind":4,"help":"GameCenter_PresentView_Achievements","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"GameCenter_PresentView_Achievements","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_PresentView_Leaderboards","kind":4,"help":"GameCenter_PresentView_Leaderboards()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"GameCenter_PresentView_Leaderboards","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_PresentView_Leaderboard","kind":4,"help":"GameCenter_PresentView_Leaderboard(id,timescope,playerscope)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            2,
            2,
          ],"resourceVersion":"1.0","name":"GameCenter_PresentView_Leaderboard","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_LocalPlayer_Authenticate","kind":4,"help":"GameCenter_LocalPlayer_Authenticate()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"GameCenter_LocalPlayer_Authenticate","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_LocalPlayer_IsAuthenticated","kind":4,"help":"GameCenter_LocalPlayer_IsAuthenticated()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"GameCenter_LocalPlayer_IsAuthenticated","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_LocalPlayer_IsUnderage","kind":4,"help":"GameCenter_LocalPlayer_IsUnderage()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"GameCenter_LocalPlayer_IsUnderage","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_LocalPlayer_GetInfo","kind":4,"help":"GameCenter_LocalPlayer_GetInfo()","hidden":false,"returnType":1,"argCount":0,"args":[],"resourceVersion":"1.0","name":"GameCenter_LocalPlayer_GetInfo","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_SavedGames_Fetch","kind":4,"help":"GameCenter_SavedGames_Fetch()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"GameCenter_SavedGames_Fetch","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_SavedGames_Save","kind":4,"help":"GameCenter_SavedGames_Save(name,data)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"GameCenter_SavedGames_Save","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_SavedGames_Delete","kind":4,"help":"GameCenter_SavedGames_Delete(name)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"GameCenter_SavedGames_Delete","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_SavedGames_GetData","kind":4,"help":"GameCenter_SavedGames_GetData(name)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"GameCenter_SavedGames_GetData","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_SavedGames_ResolveConflict","kind":4,"help":"GameCenter_SavedGames_ResolveConflict(conlfict_id,data)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            1,
          ],"resourceVersion":"1.0","name":"GameCenter_SavedGames_ResolveConflict","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_Leaderboard_Submit","kind":4,"help":"GameCenter_Leaderboard_Submit(id,score,context)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            2,
            2,
          ],"resourceVersion":"1.0","name":"GameCenter_Leaderboard_Submit","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_Achievement_Report","kind":4,"help":"GameCenter_Achievement_Report(identifier,percent,showcompletionbanner)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            2,
            2,
          ],"resourceVersion":"1.0","name":"GameCenter_Achievement_Report","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_Achievement_ResetAll","kind":4,"help":"GameCenter_Achievement_ResetAll()","hidden":false,"returnType":1,"argCount":0,"args":[],"resourceVersion":"1.0","name":"GameCenter_Achievement_ResetAll","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_PresentView_Achievement","kind":4,"help":"GameCenter_PresentView_Achievement(achievement_id)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"GameCenter_PresentView_Achievement","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"RegisterCallbacks","kind":4,"help":"GameCenter_MacOS_RegisterCallbacks(please,do,NOT,call)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
            1,
            1,
          ],"resourceVersion":"1.0","name":"GameCenter_MacOS_RegisterCallbacks","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_MacOS_SetWindowHandle","kind":4,"help":"GameCenter_MacOS_SetWindowHandle(result_of_window_handle)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"GameCenter_MacOS_SetWindowHandle","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_LocalPlayer_IsMultiplayerGamingRestricted","kind":4,"help":"GameCenter_LocalPlayer_IsMultiplayerGamingRestricted()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"GameCenter_LocalPlayer_IsMultiplayerGamingRestricted","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted","kind":4,"help":"GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"GameCenter_LocalPlayer_IsPersonalizedCommunicationRestricted","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_AccessPoint_SetActive","kind":4,"help":"GameCenter_AccessPoint_SetActive(isActive)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"GameCenter_AccessPoint_SetActive","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_AccessPoint_GetActive","kind":4,"help":"GameCenter_AccessPoint_GetActive()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"GameCenter_AccessPoint_GetActive","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_AccessPoint_SetLocation","kind":4,"help":"GameCenter_AccessPoint_SetLocation(pointlocation)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"GameCenter_AccessPoint_SetLocation","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_AccessPoint_GetLocation","kind":4,"help":"GameCenter_AccessPoint_GetLocation()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"GameCenter_AccessPoint_GetLocation","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_AccessPoint_IsPresentingGameCenter","kind":4,"help":"GameCenter_AccessPoint_IsPresentingGameCenter()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"GameCenter_AccessPoint_IsPresentingGameCenter","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_AccessPoint_IsVisible","kind":4,"help":"GameCenter_AccessPoint_IsVisible()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"GameCenter_AccessPoint_IsVisible","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_AccessPoint_SetShowHighlights","kind":4,"help":"GameCenter_AccessPoint_SetShowHighlights(show)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"GameCenter_AccessPoint_SetShowHighlights","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_AccessPoint_GetShowHighlights","kind":4,"help":"GameCenter_AccessPoint_GetShowHighlights()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"GameCenter_AccessPoint_GetShowHighlights","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_AccessPoint_GetCoordinate","kind":4,"help":"GameCenter_AccessPoint_GetCoordinate(coordinate)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"GameCenter_AccessPoint_GetCoordinate","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_AccessPoint_PresentWithState","kind":4,"help":"GameCenter_AccessPoint_PresentWithState(state)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"GameCenter_AccessPoint_PresentWithState","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_AccessPoint_Present","kind":4,"help":"GameCenter_AccessPoint_Present()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"GameCenter_AccessPoint_Present","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_Leaderboard_LoadGlobal","kind":4,"help":"GameCenter_Leaderboard_LoadGlobal(leaderboardID,timeScope,rangeStart,rangeEnd)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            2,
            2,
            2,
          ],"resourceVersion":"1.0","name":"GameCenter_Leaderboard_LoadGlobal","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"GameCenter_Leaderboard_LoadFriendsOnly","kind":4,"help":"GameCenter_Leaderboard_LoadFriendsOnly(leaderboardID,timeScope,rangeStart,rangeEnd)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            2,
            2,
            2,
          ],"resourceVersion":"1.0","name":"GameCenter_Leaderboard_LoadFriendsOnly","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[
        {"value":"0","hidden":false,"resourceVersion":"1.0","name":"GameCenter_Leaderboard_PlayerScope_Global","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"1","hidden":false,"resourceVersion":"1.0","name":"GameCenter_Leaderboard_PlayerScope_FriendsOnly","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"0","hidden":false,"resourceVersion":"1.0","name":"GameCenter_Leaderboard_TimeScope_Today","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"1","hidden":false,"resourceVersion":"1.0","name":"GameCenter_Leaderboard_TimeScope_Week","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"2","hidden":false,"resourceVersion":"1.0","name":"GameCenter_Leaderboard_TimeScope_AllTime","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"0","hidden":false,"resourceVersion":"1.0","name":"GameCenter_AccessPoint_Location_TopLeading","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"1","hidden":false,"resourceVersion":"1.0","name":"GameCenter_AccessPoint_Location_TopTrailing","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"2","hidden":false,"resourceVersion":"1.0","name":"GameCenter_AccessPoint_Location_BottomLeading","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"3","hidden":false,"resourceVersion":"1.0","name":"GameCenter_AccessPoint_Location_BottomTrailing","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"0","hidden":false,"resourceVersion":"1.0","name":"GameCenter_AccessPoint_Coordinate_OriginX","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"1","hidden":false,"resourceVersion":"1.0","name":"GameCenter_AccessPoint_Coordinate_OriginY","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"2","hidden":false,"resourceVersion":"1.0","name":"GameCenter_AccessPoint_Coordinate_SizeWidth","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"3","hidden":false,"resourceVersion":"1.0","name":"GameCenter_AccessPoint_Coordinate_SizeHeight","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"-1","hidden":false,"resourceVersion":"1.0","name":"GameCenter_AccessPoint_State_Default","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"0","hidden":false,"resourceVersion":"1.0","name":"GameCenter_AccessPoint_State_Leaderboards","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"1","hidden":false,"resourceVersion":"1.0","name":"GameCenter_AccessPoint_State_Achievements","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"2","hidden":false,"resourceVersion":"1.0","name":"GameCenter_AccessPoint_State_Challenges","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"3","hidden":false,"resourceVersion":"1.0","name":"GameCenter_AccessPoint_State_LocalPlayerProfile","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"4","hidden":false,"resourceVersion":"1.0","name":"GameCenter_AccessPoint_State_Dashboard","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"5","hidden":false,"resourceVersion":"1.0","name":"GameCenter_AccessPoint_State_LocalPlayerFriendsList","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"0","hidden":false,"resourceVersion":"1.0","name":"GameCenter_Leaderboard_Type_Classic","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"1","hidden":false,"resourceVersion":"1.0","name":"GameCenter_Leaderboard_Type_Recurring","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"-1","hidden":false,"resourceVersion":"1.0","name":"GameCenter_Invalid","tags":[],"resourceType":"GMExtensionConstant",},
      ],"ProxyFiles":[
        {"TargetMask":1,"resourceVersion":"1.0","name":"libGameCenter.dylib","tags":[],"resourceType":"GMProxyFile",},
      ],"copyToTargets":9007199254740998,"order":[
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
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
  ],
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
  "ioscodeinjection": "\r\n<YYIosEntitlements>\r\n\r\n\t<key>com.apple.developer.icloud-container-identifiers</key>\r\n\t<array>\r\n\t\t<string>iCloud.${YYPackageName}</string>\r\n\t</array>\r\n\r\n\t<key>com.apple.developer.icloud-services</key>\r\n\t<array>\r\n\t\t<string>CloudDocuments</string>\r\n\t</array>\r\n\r\n</YYIosEntitlements>\r\n",
  "tvoscodeinjection": "",
  "iosSystemFrameworkEntries": [
    {"weakReference":false,"embed":0,"resourceVersion":"1.0","name":"GameKit.framework","tags":[],"resourceType":"GMExtensionFrameworkEntry",},
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
  "resourceVersion": "1.2",
  "name": "GameCenter",
  "tags": [],
  "resourceType": "GMExtension",
}