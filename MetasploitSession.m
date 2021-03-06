//
//  MetasploitSession.m
//  Metasploit
//
//  Created by Erran Carey on 6/21/12.
//  Copyright (c) 2012 Erran Carey. All rights reserved.
//

#import "MetasploitSession.h"
#import "MessagePack.h"

@implementation MetasploitSession
@synthesize loginSucceeded;
@synthesize receivedData;
@synthesize token = _token;

- (NSDictionary*)authenticate:(NSString*)user andPassword:(NSString*)pass
{
	NSArray* array = [NSArray arrayWithObjects:@"auth.login",user,pass, nil];
	return [self execute:array];
}

- (id)initWithUsername:(NSString*)user andPassword:(NSString*)pass forHost:(NSURL*)host
{
	if (self = [super init])
  {
		_host = host;
		[self authenticate:user andPassword:pass];
	}
	return self;
}

- (NSDictionary*)execute:(NSArray*)array
{
	NSData* packed_array = [array messagePack];

	NSMutableURLRequest* request = [[NSMutableURLRequest alloc]initWithURL:_host];
	[request setValue:@"binary/message-pack" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPMethod:@"POST"];
	[request setHTTPBody:packed_array];

	_connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	while(!_finished)
  {
		[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
	}
	_finished = NO;

	NSDictionary* dic = [receivedData messagePackParse];
	if ([array containsObject:@"auth.login"] && [[dic objectForKey:@"result"] isEqualToString:@"success"])
  {
		_token = [dic objectForKey:@"token"];
    self.loginSucceeded = true;
	}
	
	if (![array containsObject:@"auth.login"])
  {
			for(id key in [receivedData messagePackParse])
      {
        NSLog(@"The command returned: %@: %@",key,[[receivedData messagePackParse]objectForKey:key]);
			}
	}
	return [receivedData messagePackParse];
}

#pragma mark NSURLConnection Delegate methods
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	NSLog(@"Connection failed with \n%@",error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	connection = nil;
	_connection = nil;
	_finished = YES;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
	self.receivedData = [NSMutableData dataWithData:data];
}

- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace{
	return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
	[challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
	[challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

@end

