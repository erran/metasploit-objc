//
//  MetasploitProManager.h
//  Metasploit
//
//  Created by Erran Carey on 6/22/12.
//  Copyright (c) 2012 Erran Carey. All rights reserved.
//

#import "MetasploitManager.h"

@interface MetasploitProManager : MetasploitManager
//Pro General API
- (NSDictionary*)about;
- (NSDictionary*)workspaces;
- (NSDictionary*)projects;
- (NSDictionary*)addWorkspace:(NSString*)workspaceSettings;
- (NSDictionary*)addProject:(NSString*)projectSettings;
- (NSDictionary*)deleteWorkspace:(NSString*)workspaceName;
- (NSDictionary*)deleteProject:(NSString*)projectName;
- (NSDictionary*)users;

//Pro License API
- (NSDictionary*)register:(NSString*)productKey;//Why is register pink? Stupid reserved words.
- (NSDictionary*)activate:(NSString*)activationOptions;
- (NSDictionary*)activateOffline:(NSString*)activationFilePath;
- (NSDictionary*)license;
- (NSDictionary*)revertLicense;

//Pro Updates API
- (NSDictionary*)updateAvailable:(NSString*)updateCheckOptions;
- (NSDictionary*)updateInstall:(NSString*)installOptions;
- (NSDictionary*)updateInstallOffline:(NSString*)updatePath;
- (NSDictionary*)updateStatus;
- (NSDictionary*)updateStop;
- (NSDictionary*)restartService;

//Pro Task API
- (NSDictionary*)taskList;
- (NSDictionary*)taskStatus:(NSString*)taskID;
- (NSDictionary*)taskStop:(NSString*)taskID;
- (NSDictionary*)taskLog:(NSString*)taskID;
- (NSDictionary*)deleteTaskLog:(NSString*)taskID;

//Pro Feature API
- (NSDictionary*)startDiscover:(NSDictionary*)config;
- (NSDictionary*)startImport:(NSDictionary*)config;
- (NSDictionary*)startImportCredentials:(NSDictionary*)config;
- (NSDictionary*)startNexpose:(NSDictionary*)config;
- (NSDictionary*)startBruteforce:(NSDictionary*)config;
- (NSDictionary*)startExploit:(NSDictionary*)config;
- (NSDictionary*)startWebScan:(NSDictionary*)config;
- (NSDictionary*)startWebAudit:(NSDictionary*)config;
- (NSDictionary*)startWebSploit:(NSDictionary*)config;
- (NSDictionary*)startCleanUp:(NSDictionary*)config;
- (NSDictionary*)startCollect:(NSDictionary*)config;
- (NSDictionary*)startReport:(NSDictionary*)config;

//Pro Import API
- (NSDictionary*)importData:(NSString*)workspace data:(NSString*)data options:(NSString*)options;
- (NSDictionary*)importFile:(NSString*)workspace path:(NSString*)path options:(NSString*)options;
- (NSDictionary*)validateImportFile:(NSString*)path;

//Pro Loot API
- (NSDictionary*)lootDownload:(NSString*)lootID;
- (NSDictionary*)lootList:(NSString*)workspaceName;

//Pro Module API
- (NSDictionary*)searchModule:(NSString*)query;
- (NSDictionary*)validateModule:(NSString*)moduleName options:(NSString*)options;
- (NSDictionary*)modules:(NSString*)moduleType;

//Pro Report API
- (NSDictionary*)downloadReport:(NSString*)reportID;
- (NSDictionary*)downloadReportByTaskID:(NSString*)taskID;
- (NSDictionary*)listReport:(NSString*)workspaceName;

//Pro Meterpreter API
- (NSDictionary*)chDir:(NSString*)sessionID path:(NSString*)path;
- (NSDictionary*)cwd:(NSString*)sessionID path:(NSString*)path;
- (NSDictionary*)listMeterpreters:(NSString*)sessionID path:(NSString*)path;
- (NSDictionary*)removeMeterperter:(NSString*)sessionID path:(NSString*)path;
- (NSDictionary*)rootPath:(NSString*)sessionID;
- (NSDictionary*)searchMeterpreter:(NSString*)sessionID query:(NSString*)query;
- (NSDictionary*)tunnelInterfaces:(NSString*)sessionID;

@end

