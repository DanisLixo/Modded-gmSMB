{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "NekoPresence",
  "optionsFile": "options.json",
  "options": [],
  "exportToGame": true,
  "supportedTargets": -1,
  "extensionVersion": "1.3.2",
  "packageId": "",
  "productId": "",
  "author": "",
  "date": "2024-06-04T21:03:45.1738525-03:00",
  "license": "",
  "description": "",
  "helpfile": "",
  "iosProps": false,
  "tvosProps": false,
  "androidProps": false,
  "installdir": "",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"NekoPresence.gml","filename":"NekoPresence.gml","origname":"","init":"","final":"","kind":2,"uncompress":false,"functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"np_get_avatar_url","externalName":"np_get_avatar_url","kind":2,"help":"np_get_avatar_url(user_id,avatar_hash)","hidden":false,"returnType":1,"argCount":0,"args":[
            1,
            1,
          ],"documentation":"",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":194,"usesRunnerInterface":false,"order":[
        {"name":"np_get_avatar_url","path":"extensions/NekoPresence/NekoPresence.yy",},
      ],},
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"NekoPresence.dll","filename":"NekoPresence.dll","origname":"","init":"__np_initdll","final":"__np_shutdown","kind":1,"uncompress":false,"functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"__np_initdll","externalName":"np_initdll","kind":1,"help":"__np_initdll()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"__np_shutdown","externalName":"np_shutdown","kind":1,"help":"__np_shutdown()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"np_initdiscord","externalName":"np_initdiscord","kind":1,"help":"np_initdiscord(client_id,autoRegister,steam_id)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            2,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"np_setpresence","externalName":"np_setpresence","kind":1,"help":"np_setpresence(state,details,large_image_key,small_image_key)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
            1,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"np_update","externalName":"np_update","kind":1,"help":"np_update()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"__np_registercallbacks_do_not_call","externalName":"RegisterCallbacks","kind":1,"help":"__np_registercallbacks_do_not_call(arg1,arg2,arg3,arg4)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
            1,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"np_setpresence_more","externalName":"np_setpresence_more","kind":1,"help":"np_setpresence_more(small_image_text,large_image_text,instance)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"np_clearpresence","externalName":"np_clearpresence","kind":1,"help":"np_clearpresence()","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"np_registergame","externalName":"np_registergame","kind":1,"help":"np_registergame(client_id,command)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"np_registergame_steam","externalName":"np_registergame_steam","kind":1,"help":"np_registergame_steam(client_id,steam_app_id)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"np_setpresence_secrets","externalName":"np_setpresence_secrets","kind":1,"help":"np_setpresence_secrets(matchSecret,spectateSecret,joinSecret)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"np_setpresence_partyparams","externalName":"np_setpresence_partyparams","kind":1,"help":"np_setpresence_partyparams(partySize,partyMax,partyId,partyPrivacy)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            2,
            1,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"np_respond","externalName":"np_respond","kind":1,"help":"np_respond(user_id,reply)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"np_setpresence_timestamps","externalName":"np_setpresence_timestamps","kind":1,"help":"np_setpresence_timestamps(startTimestamp,endTimestamp,is_unix)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"np_setpresence_buttons","externalName":"np_setpresence_buttons","kind":1,"help":"np_setpresence_buttons(btnId,btnName,btnUrl)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            1,
            1,
          ],"documentation":"",},
      ],"constants":[
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"np_steam_app_id","value":"string(steam_get_app_id())","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"np_steam_app_id_empty","value":"\"0\"","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"DISCORD_REPLY_NO","value":"0","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"DISCORD_REPLY_YES","value":"1","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"DISCORD_REPLY_IGNORE","value":"2","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"DISCORD_PARTY_PRIVACY_PRIVATE","value":"0","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"DISCORD_PARTY_PRIVACY_PUBLIC","value":"1","hidden":false,},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"DISCORD_MAX_BUTTONS","value":"2","hidden":false,},
      ],"ProxyFiles":[
        {"resourceType":"GMProxyFile","resourceVersion":"1.0","name":"libnekopresence.so","TargetMask":7,},
        {"resourceType":"GMProxyFile","resourceVersion":"1.0","name":"NekoPresence_x64.dll","TargetMask":6,},
        {"resourceType":"GMProxyFile","resourceVersion":"1.0","name":"libNekoPresence.dylib","TargetMask":1,},
      ],"copyToTargets":194,"usesRunnerInterface":false,"order":[
        {"name":"__np_initdll","path":"extensions/NekoPresence/NekoPresence.yy",},
        {"name":"__np_shutdown","path":"extensions/NekoPresence/NekoPresence.yy",},
        {"name":"np_initdiscord","path":"extensions/NekoPresence/NekoPresence.yy",},
        {"name":"np_setpresence","path":"extensions/NekoPresence/NekoPresence.yy",},
        {"name":"np_update","path":"extensions/NekoPresence/NekoPresence.yy",},
        {"name":"__np_registercallbacks_do_not_call","path":"extensions/NekoPresence/NekoPresence.yy",},
        {"name":"np_setpresence_more","path":"extensions/NekoPresence/NekoPresence.yy",},
        {"name":"np_clearpresence","path":"extensions/NekoPresence/NekoPresence.yy",},
        {"name":"np_registergame","path":"extensions/NekoPresence/NekoPresence.yy",},
        {"name":"np_registergame_steam","path":"extensions/NekoPresence/NekoPresence.yy",},
        {"name":"np_setpresence_secrets","path":"extensions/NekoPresence/NekoPresence.yy",},
        {"name":"np_setpresence_partyparams","path":"extensions/NekoPresence/NekoPresence.yy",},
        {"name":"np_respond","path":"extensions/NekoPresence/NekoPresence.yy",},
        {"name":"np_setpresence_timestamps","path":"extensions/NekoPresence/NekoPresence.yy",},
        {"name":"np_setpresence_buttons","path":"extensions/NekoPresence/NekoPresence.yy",},
      ],},
  ],
  "classname": "",
  "tvosclassname": null,
  "tvosdelegatename": null,
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
  "ioscodeinjection": "",
  "tvoscodeinjection": "",
  "iosSystemFrameworkEntries": [],
  "tvosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
  "IncludedResources": [],
  "androidPermissions": [],
  "copyToTargets": 17179869418,
  "iosCocoaPods": "",
  "tvosCocoaPods": "",
  "iosCocoaPodDependencies": "",
  "tvosCocoaPodDependencies": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
}