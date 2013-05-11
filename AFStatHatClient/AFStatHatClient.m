// AFStatHatClient.m
//
// Copyright (c) 2013 Say Goodnight Software
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "AFStatHatClient.h"
#import "AFJSONRequestOperation.h"

static NSString * const kAFStatHatBaseURLString = @"http://api.stathat.com/";

@interface AFStatHatClient () {
    NSString* _ezKey;
}

@end

@implementation AFStatHatClient

- (id)initWithEZKey:(NSString*)ezKey {
    self = [super initWithBaseURL:[NSURL URLWithString:kAFStatHatBaseURLString]];
    if (!self) {
        return nil;
    }

    _ezKey = ezKey;
    
    // self.parameterEncoding = AFJSONParameterEncoding;
    //
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

- (void) postEZStat:(NSString*)statName
          withCount:(NSNumber*)count {
    [self postEZStat:statName withCount:count success:nil failure:nil];
}

- (void) postEZStat:(NSString*)statName
          withValue:(NSNumber*)value {
    [self postEZStat:statName withValue:value success:nil failure:nil];
}

- (void) postEZStat:(NSString*)statName
          withValue:(NSNumber*)value
            success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {

    NSDictionary* params = @{
                             @"ezkey": _ezKey,
                             @"stat": statName,
                             @"value": value
                             };
    [self postPath:@"ez" parameters:params success:success failure:failure];
}

- (void) postEZStat:(NSString*)statName
          withCount:(NSNumber*)count
            success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    NSDictionary* params = @{
                             @"ezkey": _ezKey,
                             @"stat": statName,
                             @"count": count
                             };
    [self postPath:@"ez" parameters:params success:success failure:failure];
}

@end