//
//  MetasploitSession.h
//  Metasploit
//
//  Created by Erran Carey on 6/21/12.
//  Copyright (c) 2012 Erran Carey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MetasploitSession : NSObject<NSURLConnectionDelegate>{
    NSURLConnection* _connection;
    BOOL _finished;
    NSURL* _host;
    NSString* _token;
}

@property (strong, nonatomic) NSMutableData* receivedData;
@property (strong, nonatomic) NSString* token;

-(id)initWithUsername:(NSString*)user andPassword:(NSString*)pass forHost:(NSURL*)host;

-(NSDictionary*)authenticate:(NSString*)user andPassword:(NSString*)pass;

-(NSDictionary*)execute:(NSArray*)args_array;

- (void)connectionDidFinishLoading:(NSURLConnection *)connection;

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;

- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace;

@end

