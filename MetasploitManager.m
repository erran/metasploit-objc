//
//  MetasploitManager.m
//  Metasploit
//
//  Created by Erran Carey on 6/22/12.
//  Copyright (c) 2012 Erran Carey. All rights reserved.
//

#import "MetasploitManager.h"

@implementation MetasploitManager
@synthesize session = _session;

- (id)initWithSession:(MetasploitSession*)session
{
	if (self = [super init])
  {
		_session = session;
	}
	return self;
}

//Console API
- (NSDictionary*)createConsole
{
	NSArray* array = [NSArray arrayWithObjects:@"console.create",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)destroyConsole:(NSString*)consoleID
{
	NSArray* array = [NSArray arrayWithObjects:@"console.destroy",_session.token,consoleID,nil];
	return [_session execute:array];
}

- (NSDictionary*)detachSessionFromConsole:(NSString*)consoleID
{
	NSArray* array = [NSArray arrayWithObjects:@"console.session_detach",_session.token,consoleID,nil];
	return [_session execute:array];
}

- (NSDictionary*)killSessionFromConsole:(NSString*)consoleID
{
	NSArray* array = [NSArray arrayWithObjects:@"console.session_kill",_session.token,consoleID,nil];
	return [_session execute:array];
}

- (NSDictionary*)listConsoles
{
	NSArray* array = [NSArray arrayWithObjects:@"console.list",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)readConsole:(NSString*)consoleID
{
	NSArray* array = [NSArray arrayWithObjects:@"console.read",_session.token,consoleID,nil];
	return [_session execute:array];
}

- (NSDictionary*)tabConsole:(NSString*)consoleID input:(NSString*)input
{
	NSArray* array = [NSArray arrayWithObjects:@"console.tabs",_session.token,consoleID,[NSString stringWithFormat:@"%@\n",input],nil];
	return [_session execute:array];
}

- (NSDictionary*)writeToConsole:(NSString*)consoleID arguments:(NSString*)args
{
	NSArray* array = [NSArray arrayWithObjects:@"console.write",_session.token,consoleID,[NSString stringWithFormat:@"%@\n",args],nil];
	return [_session execute:array];
}

//Core API
- (NSDictionary*)addCoreModulePath:(NSString*)modulePath
{
	NSArray* array = [NSArray arrayWithObjects:@"core.add_module_path",_session.token,modulePath,nil];
	return [_session execute:array];
}

- (NSDictionary*)coreModuleStats
{
	NSArray* array = [NSArray arrayWithObjects:@"core.module_stats",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)coreThreadList
{
	NSArray* array = [NSArray arrayWithObjects:@"core.thread_list",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)coreVersion
{
	NSArray* array = [NSArray arrayWithObjects:@"core.version",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)killCoreThread:(NSString*)threadID
{
	NSArray* array = [NSArray arrayWithObjects:@"core.thread_kill",_session.token,threadID,nil];
	return [_session execute:array];
}

- (NSDictionary*)reloadCoreModules
{
	NSArray* array = [NSArray arrayWithObjects:@"core.reload_modules",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)saveCore
{
	NSArray* array = [NSArray arrayWithObjects:@"core.save",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)setCoreGlobalVar:(NSString*)optName optionValue:(NSString*)optVal
{
	NSArray* array = [NSArray arrayWithObjects:@"core.setg",_session.token,optName,optVal,nil];
	return [_session execute:array];
}

- (NSDictionary*)stopCore
{
	NSArray* array = [NSArray arrayWithObjects:@"core.stop",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)unsetCoreGlobalVar:(NSString*)optName
{
	NSArray* array = [NSArray arrayWithObjects:@"core.unsetg",_session.token,optName,nil];
	return [_session execute:array];
}

//Jobs API
- (NSDictionary*)listJobs
{
	NSArray* array = [NSArray arrayWithObjects:@"job.list",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)jobInfo:(NSString*)jobID
{
	NSArray* array = [NSArray arrayWithObjects:@"job.info",_session.token,jobID,nil];
	return [_session execute:array];
}

- (NSDictionary*)stopJob:(NSString*)jobID
{
	NSArray* array = [NSArray arrayWithObjects:@"job.stop",_session.token,jobID,nil];
	return [_session execute:array];
}

//Modules API
- (NSDictionary*)moduleExploits
{
	NSArray* array = [NSArray arrayWithObjects:@"module.exploits",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)moduleAuxiliary
{
	NSArray* array = [NSArray arrayWithObjects:@"module.auxiliary",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)postModule
{
	NSArray* array = [NSArray arrayWithObjects:@"module.post",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)payloads
{
	NSArray* array = [NSArray arrayWithObjects:@"module.payloads",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)moduleEncoders
{
	NSArray* array = [NSArray arrayWithObjects:@"module.encoders",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)nopsModules
{
	NSArray* array = [NSArray arrayWithObjects:@"module.nops",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)moduleInfoForType:(NSString*)moduleType withModelName:(NSString*)moduleName
{
	NSArray* array = [NSArray arrayWithObjects:@"module.info",_session.token,moduleType,moduleName,nil];
	return [_session execute:array];
}

- (NSDictionary*)moduleOptionsForType:(NSString*)moduleType withModelName:(NSString*)moduleName
{
	NSArray* array = [NSArray arrayWithObjects:@"module.options",_session.token,moduleType,moduleName,nil];
	return [_session execute:array];
}

- (NSDictionary*)compatiblePayloadsForModuleName:(NSString*)moduleName
{
	NSArray* array = [NSArray arrayWithObjects:@"module.compatible_payloads",_session.token,moduleName,nil];
	return [_session execute:array];
}

- (NSDictionary*)targetCompatiblePayloadsForModuleName:(NSString*)moduleName targetIndex:(NSString*)index
{
	NSArray* array = [NSArray arrayWithObjects:@"module.target_compatible_payloads",_session.token,moduleName,index,nil];
	return [_session execute:array];
}

- (NSDictionary*)compatibleSessions:(NSString*)moduleName
{
	NSArray* array = [NSArray arrayWithObjects:@"module.compatible_sessions",_session.token,moduleName,nil];
	return [_session execute:array];
}

- (NSDictionary*)moduleEncodeData:(NSString*)data withEncoderModule:(NSString*)encoderModule withHash:(NSString*)options
{
	NSArray* array = [NSArray arrayWithObjects:@"module.encode",_session.token,data,encoderModule,options,nil];
	return [_session execute:array];
}

- (NSDictionary*)moduleExecuteForModelType:(NSString*)moduleType forModuleName:(NSString*)moduleName withHash:(NSString*)dataStoreOptions
{
	NSArray* array = [NSArray arrayWithObjects:@"module.execute",_session.token,moduleType,moduleName,dataStoreOptions,nil];
	return [_session execute:array];
}

//Plugins API
- (NSDictionary*)loadPlugin:(NSString*)pluginName withHash:(NSString*)options
{
	NSArray* array = [NSArray arrayWithObjects:@"plugin.load",_session.token,pluginName,options,nil];
	return [_session execute:array];
}

- (NSDictionary*)unloadPlugin:(NSString*)pluginName
{
	NSArray* array = [NSArray arrayWithObjects:@"plugin.unload",_session.token,pluginName,nil];
	return [_session execute:array];
}

- (NSDictionary*)listLoadedPlugins
{
	NSArray* array = [NSArray arrayWithObjects:@"plugin.loaded",_session.token,nil];
	return [_session execute:array];
}

//Sessions API
- (NSDictionary*)listSessions
{
	NSArray* array = [NSArray arrayWithObjects:@"session.list",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)stopSession:(NSString*)sessionID
{
	NSArray* array = [NSArray arrayWithObjects:@"session.stop",_session.token,sessionID,nil];
	return [_session execute:array];
}

- (NSDictionary*)sessionReadShell:(NSString*)sessionID
{
	NSArray* array = [NSArray arrayWithObjects:@"session.shell_read",_session.token,sessionID,nil];
	return [_session execute:array];
}

- (NSDictionary*)sessionReadShell:(NSString*)sessionID withReadPointer:(NSString*)readPointer
{
	NSArray* array = [NSArray arrayWithObjects:@"session.shell_read",_session.token,sessionID,readPointer,nil];
	return [_session execute:array];
}

- (NSDictionary*)sessionWriteToShell:(NSString*)sessionID data:(NSString*)data
{
	NSArray* array = [NSArray arrayWithObjects:@"session.shell_write",_session.token,sessionID,[data stringByAppendingFormat:@"\n"],nil];
	return [_session execute:array];
}

- (NSDictionary*)sessionWriteToMeterpreter:(NSString*)sessionID data:(NSString*)data
{
	NSArray* array = [NSArray arrayWithObjects:@"session.shell_write",_session.token,sessionID,[data stringByAppendingFormat:@"\n"],nil];
	return [_session execute:array];
}

- (NSDictionary*)sessionReadMeterpreter:(NSString*)sessionID
{
	NSArray* array = [NSArray arrayWithObjects:@"session.meterpreter_read",_session.token,sessionID,nil];
	return [_session execute:array];
}

- (NSDictionary*)runSingleMeterpreter:(NSString*)sessionID command:(NSString*)command
{
	NSArray* array = [NSArray arrayWithObjects:@"session.meterpreter_run_single",_session.token,sessionID,command,nil];
	return [_session execute:array];
}

- (NSDictionary*)runMeterpreterScript:(NSString*)sessionID withName:(NSString*)scriptName
{
	NSArray* array = [NSArray arrayWithObjects:@"session.meterpreter_run_single",_session.token,sessionID,scriptName,nil];
	return [_session execute:array];
}

- (NSDictionary*)detachMeterpreterSession:(NSString*)sessionID
{
	NSArray* array = [NSArray arrayWithObjects:@"session.meterpreter_session_detach",_session.token,sessionID,nil];
	return [_session execute:array];
}

- (NSDictionary*)killMeterpreterSession:(NSString*)sessionID
{
	NSArray* array = [NSArray arrayWithObjects:@"session.meterpreter_session_detach",_session.token,sessionID,nil];
	return [_session execute:array];
}

- (NSDictionary*)tabMeterpreter:(NSString*)sessionID input:(NSString*)input
{
	NSArray* array = [NSArray arrayWithObjects:@"session.meterpreter_tabs",_session.token,sessionID,input,nil];
	return [_session execute:array];
}

- (NSDictionary*)compatibleModuleForSession:(NSString*)sessionID
{
	NSArray* array = [NSArray arrayWithObjects:@"session.compatible_modules",_session.token,sessionID,nil];
	return [_session execute:array];
}

- (NSDictionary*)upgradeShell:(NSString*)sessionID forHost:(NSString*)connectedHost
{
	NSArray* array = [NSArray arrayWithObjects:@"session.shell_upgrade",_session.token,sessionID,connectedHost,nil];
	return [_session execute:array];
}

- (NSDictionary*)clearRing:(NSString*)sessionID
{
	NSArray* array = [NSArray arrayWithObjects:@"session.ring_clear",_session.token,sessionID,nil];
	return [_session execute:array];
}

- (NSDictionary*)lastRing:(NSString*)sessionID
{
	NSArray* array = [NSArray arrayWithObjects:@"session.ring_last",_session.token,sessionID,nil];
	return [_session execute:array];
}

- (NSDictionary*)ringPut:(NSString*)sessionID data:(NSString*)data
{
	NSArray* array = [NSArray arrayWithObjects:@"session.ring_put",_session.token,sessionID,data,nil]; //Alias for session.shell_write
	return [_session execute:array];
}

- (NSDictionary*)ringRead:(NSString*)sessionID
{
	NSArray* array = [NSArray arrayWithObjects:@"session.ring_read",_session.token,sessionID,nil]; //Alias for session.shell_read
	return [_session execute:array];
}

- (NSDictionary*)ringRead:(NSString *)sessionID withReadPointer:(NSString*)readPointer
{
	NSArray* array = [NSArray arrayWithObjects:@"session.ring_read",_session.token,sessionID,readPointer,nil]; //Alias for session.shell_read
	return [_session execute:array];
}

@end

