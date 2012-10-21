//
//  MetasploitProManager.m
//  Metasploit
//
//  Created by Erran Carey on 6/22/12.
//  Copyright (c) 2012 Erran Carey. All rights reserved.
//

#import "MetasploitProManager.h"

@implementation MetasploitProManager

//Pro General API
- (NSDictionary*)about
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.about",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)workspaces
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.workspaces",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)projects
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.workspaces",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)addWorkspace:(NSString*)workspaceSettings
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.workspace_add",_session.token,workspaceSettings,nil];
	return [_session execute:array];
}

- (NSDictionary*)addProject:(NSString*)projectSettings
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.workspace_add",_session.token,projectSettings,nil];
	return [_session execute:array];
}

- (NSDictionary*)deleteWorkspace:(NSString*)workspaceName
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.workspace_del",_session.token,workspaceName,nil];
	return [_session execute:array];
}

- (NSDictionary*)deleteProject:(NSString*)projectName
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.workspace_del",_session.token,projectName,nil];
	return [_session execute:array];
}

- (NSDictionary*)users
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.users",_session.token,nil];
	return [_session execute:array];
}

//Pro License API
- (NSDictionary*)register:(NSString*)productKey
{
  NSArray* array = [NSArray arrayWithObjects:@"pro.register",_session.token,productKey,nil];
  return [_session execute:array];
}

- (NSDictionary*)activate:(NSString*)activationOptions
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.activate",_session.token,activationOptions,nil];
	return [_session execute:array];
}

- (NSDictionary*)activateOffline:(NSString*)activationFilePath
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.activate_offline",_session.token,activationFilePath,nil];
	return [_session execute:array];
}

- (NSDictionary*)license
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.license",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)revertLicense
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.license_revert",_session.token,nil];//Something about being the same as license
	return [_session execute:array];
}

//Pro Updates API
- (NSDictionary*)updateAvailable:(NSString*)updateCheckOptions
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.update_available",_session.token,updateCheckOptions,nil];
	return [_session execute:array];
}

- (NSDictionary*)updateInstall:(NSString*)installOptions
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.update_install",_session.token,installOptions,nil];
	return [_session execute:array];
}

- (NSDictionary*)updateInstallOffline:(NSString*)updatePath
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.update_install_offline",_session.token,updatePath,nil];
	return [_session execute:array];
}

- (NSDictionary*)updateStatus
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.update_status",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)updateStop
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.update_stop",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)restartService
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.restart_service",_session.token,nil];
	return [_session execute:array];
}

//Pro Task API
- (NSDictionary*)taskList
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.task_list",_session.token,nil];
	return [_session execute:array];
}

- (NSDictionary*)taskStatus:(NSString*)taskID
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.task_status",_session.token,taskID,nil];
	return [_session execute:array];
}

- (NSDictionary*)taskStop:(NSString*)taskID
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.task_stop",_session.token,taskID,nil];
	return [_session execute:array];
}

- (NSDictionary*)taskLog:(NSString*)taskID
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.task_log",_session.token,taskID,nil];
	return [_session execute:array];
}

- (NSDictionary*)deleteTaskLog:(NSString*)taskID
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.task_delete_log",_session.token,taskID,nil];
	return [_session execute:array];
}

//Pro Feature API
- (NSDictionary*)startDiscover:(NSDictionary*)config
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.start_discover",_session.token,config,nil];
	return [_session execute:array];
}

- (NSDictionary*)startImport:(NSDictionary*)config
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.start_import",_session.token,config,nil];
	return [_session execute:array];
}

- (NSDictionary*)startImportCredentials:(NSDictionary*)config
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.start_import_creds",_session.token,config,nil];
	return [_session execute:array];
}

- (NSDictionary*)startNexpose:(NSDictionary*)config
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.start_nexpose",_session.token,config,nil];
	return [_session execute:array];
}

- (NSDictionary*)startBruteforce:(NSDictionary*)config
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.start_bruteforce",_session.token,config,nil];
	return [_session execute:array];
}

- (NSDictionary*)startExploit:(NSDictionary*)config
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.start_exploit",_session.token,config,nil];
	return [_session execute:array];
}

- (NSDictionary*)startWebScan:(NSDictionary*)config
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.start_webscan",_session.token,config,nil];
	return [_session execute:array];
}

- (NSDictionary*)startWebAudit:(NSDictionary*)config
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.webaudit",_session.token,config,nil];
	return [_session execute:array];
}

- (NSDictionary*)startWebSploit:(NSDictionary*)config
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.start_websploit",_session.token,config,nil];
	return [_session execute:array];
}

- (NSDictionary*)startCleanUp:(NSDictionary*)config
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.start_cleanup",_session.token,config,nil];
	return [_session execute:array];
}

- (NSDictionary*)startCollect:(NSDictionary*)config
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.start_collect",_session.token,config,nil];
	return [_session execute:array];
}

- (NSDictionary*)startReport:(NSDictionary*)config
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.start_report",_session.token,config,nil];
	return [_session execute:array];
}

//Pro Import API
- (NSDictionary*)importData:(NSString*)workspace data:(NSString*)data options:(NSString*)options
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.import_data",_session.token,data,options,nil];
	return [_session execute:array];
}

- (NSDictionary*)importFile:(NSString*)workspace path:(NSString*)path options:(NSString*)options
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.import_file",_session.token,path,options,nil];
	return [_session execute:array];
}

- (NSDictionary*)validateImportFile:(NSString*)path
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.validate_import_file",_session.token,path,nil];//Workspace parameter? validate_ v.s. just import_file?
	return [_session execute:array];
}

//Pro Loot API
- (NSDictionary*)lootDownload:(NSString*)lootID
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.loot_download",_session.token,lootID,nil];
	return [_session execute:array];
}

- (NSDictionary*)lootList:(NSString*)workspaceName
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.loot_list",_session.token,workspaceName,nil];
	return [_session execute:array];
}

//Pro Module API
- (NSDictionary*)searchModule:(NSString*)query
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.module_search",_session.token,query,nil];
	return [_session execute:array];
}

- (NSDictionary*)validateModule:(NSString*)moduleName options:(NSString*)options
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.module_validate",_session.token,moduleName,options,nil];
	return [_session execute:array];
}

- (NSDictionary*)modules:(NSString*)moduleType
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.modules",_session.token,moduleType,nil];
	return [_session execute:array];
}

//Pro Report API
- (NSDictionary*)downloadReport:(NSString*)reportID
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.report_download",_session.token,reportID,nil];
	return [_session execute:array];
}

- (NSDictionary*)downloadReportByTaskID:(NSString*)taskID
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.report_download_by_task",_session.token,taskID,nil];
	return [_session execute:array];
}

- (NSDictionary*)listReport:(NSString*)workspaceName
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.report_list",_session.token,workspaceName,nil];
	return [_session execute:array];
}

//Pro Meterpreter API
- (NSDictionary*)chDir:(NSString*)sessionID path:(NSString*)path
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.meterpreter_chdir",_session.token,sessionID,path,nil];
	return [_session execute:array];
}

- (NSDictionary*)cwd:(NSString*)sessionID path:(NSString*)path
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.meterpreter_cwd",_session.token,sessionID,path,nil];
	return [_session execute:array];
}

- (NSDictionary*)listMeterpreters:(NSString*)sessionID path:(NSString*)path
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.meterpreter_list",_session.token,sessionID,path,nil];
	return [_session execute:array];
}

- (NSDictionary*)removeMeterperter:(NSString*)sessionID path:(NSString*)path
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.meterpreter_rm",_session.token,sessionID,path,nil];
	return [_session execute:array];
}

- (NSDictionary*)rootPath:(NSString*)sessionID
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.meterpreter_root_paths",_session.token,sessionID,nil];
	return [_session execute:array];
}

- (NSDictionary*)searchMeterpreter:(NSString*)sessionID query:(NSString*)query
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.meterpreter_search",_session.token,sessionID,query,nil];
	return [_session execute:array];
}

- (NSDictionary*)tunnelInterfaces:(NSString*)sessionID
{
	NSArray* array = [NSArray arrayWithObjects:@"pro.meterpreter_tunnel_interfaces",_session.token,sessionID,nil];
	return [_session execute:array];
}

@end

