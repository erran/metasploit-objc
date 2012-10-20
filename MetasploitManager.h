//
//  MetasploitManager.h
//  Metasploit
//
//  Created by Erran Carey on 6/22/12.
//  Copyright (c) 2012 Erran Carey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MetasploitSession.h"

@interface MetasploitManager : NSObject{
    MetasploitSession* _session;
}
-(id)initWithSession:(MetasploitSession*)session;

@property (strong,nonatomic) MetasploitSession* session;

//Core API
-(NSDictionary*)addCoreModulePath:(NSString*)modulePath;
-(NSDictionary*)getCoreModuleStats;
-(NSDictionary*)getCoreThreadList;
-(NSDictionary*)getCoreVersion;
-(NSDictionary*)killCoreThread:(NSString*)threadID;
-(NSDictionary*)reloadCoreModules;
-(NSDictionary*)saveCore;
-(NSDictionary*)setCoreGlobalVar:(NSString*)optName optionValue:(NSString*)optVal;
-(NSDictionary*)stopCore;
-(NSDictionary*)unsetCoreGlobalVar:(NSString*)optName;

//Console API
-(NSDictionary*)createConsole;
-(NSDictionary*)destroyConsole:(NSString*)consoleID;
-(NSDictionary*)detachSessionFromConsole:(NSString*)consoleID;
-(NSDictionary*)killSessionFromConsole:(NSString*)consoleID;
-(NSDictionary*)listConsoles;
-(NSDictionary*)readConsole:(NSString*)consoleID;
-(NSDictionary*)tabConsole:(NSString*)consoleID input:(NSString*)input;
-(NSDictionary*)writeToConsole:(NSString*)consoleID arguments:(NSString*)args;

//Jobs API
-(NSDictionary*)listJobs;
-(NSDictionary*)getJobInfo:(NSString*)jobID;
-(NSDictionary*)stopJob:(NSString*)jobID;

//Modules API
-(NSDictionary*)getModuleExploits;
-(NSDictionary*)getModuleAuxiliary;
-(NSDictionary*)postModule;
-(NSDictionary*)getModuleEncoders;
-(NSDictionary*)getNopsModules;
-(NSDictionary*)getPayloads;
-(NSDictionary*)getModuleInfoForType:(NSString*)moduleType withModelName:(NSString*)moduleName;
-(NSDictionary*)getModuleOptionsForType:(NSString*)moduleType withModelName:(NSString*)moduleName;
-(NSDictionary*)getCompatiblePayloadsForModuleName:(NSString*)moduleName;
-(NSDictionary*)targetCompatiblePayloadsForModuleName:(NSString*)moduleName targetIndex:(NSString*)index;
-(NSDictionary*)getCompatibleSessions:(NSString*)moduleName;
-(NSDictionary*)moduleEncodeData:(NSString*)data withEncoderModule:(NSString*)encoderModule withHash:(NSString*)options;
-(NSDictionary*)moduleExecuteForModelType:(NSString*)moduleType forModuleName:(NSString*)moduleName withHash:(NSString*)dataStoreOptions;

//Plugins API
-(NSDictionary*)loadPlugin:(NSString*)pluginName withHash:(NSString*)options;
-(NSDictionary*)unloadPlugin:(NSString*)pluginName;
-(NSDictionary*)listLoadedPlugins;

//Sessions API
-(NSDictionary*)listSessions;
-(NSDictionary*)stopSession:(NSString*)sessionID;
-(NSDictionary*)sessionReadShell:(NSString*)sessionID;
-(NSDictionary*)sessionReadShell:(NSString*)sessionID withReadPointer:(NSString*)readPointer;
-(NSDictionary*)sessionWriteToShell:(NSString*)sessionID data:(NSString*)data;
-(NSDictionary*)sessionWriteToMeterpreter:(NSString*)sessionID data:(NSString*)data;
-(NSDictionary*)sessionReadMeterpreter:(NSString*)sessionID;
-(NSDictionary*)runSingleMeterpreter:(NSString*)sessionID command:(NSString*)command;
-(NSDictionary*)runMeterpreterScript:(NSString*)sessionID withName:(NSString*)scriptName;
-(NSDictionary*)detachMeterpreterSession:(NSString*)sessionID;
-(NSDictionary*)killMeterpreterSession:(NSString*)sessionID;
-(NSDictionary*)tabMeterpreter:(NSString*)sessionID input:(NSString*)input;
-(NSDictionary*)getCompatibleModuleForSession:(NSString*)sessionID;
-(NSDictionary*)upgradeShell:(NSString*)sessionID forHost:(NSString*)connectedHost;
-(NSDictionary*)clearRing:(NSString*)sessionID;
-(NSDictionary*)lastRing:(NSString*)sessionID;
-(NSDictionary*)ringPut:(NSString*)sessionID data:(NSString*)data;
-(NSDictionary*)ringRead:(NSString*)sessionID;
-(NSDictionary*)ringRead:(NSString *)sessionID withReadPointer:(NSString*)readPointer;

@end

