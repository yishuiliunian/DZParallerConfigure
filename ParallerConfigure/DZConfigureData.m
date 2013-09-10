//
//  DZConfigureData.m
//  ParallerConfigure
//
//  Created by dzpqzb on 13-9-6.
//  Copyright (c) 2013年 dzpqzb inc. All rights reserved.
//

#import "DZConfigureData.h"

@implementation DZConfigureData
@synthesize configureData = _configureData;
@synthesize pageCount = _pageCount;
+ (id) shareInstance
{
    static DZConfigureData* share = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = [[DZConfigureData alloc] init];
    });
    return share;
}

+(NSString*) documentsPath
{
    static NSString* documentDirectory= nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (nil == documentDirectory) {
            NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            documentDirectory = [paths objectAtIndex:0] ;
        }
    });
    
	return documentDirectory;
}
- (NSString*) dataFilePath
{
    NSString* documentsPath = [DZConfigureData documentsPath];
    return [documentsPath stringByAppendingPathComponent:@"data.plist"];
}

- (NSDictionary*) configureFileData
{
    return [NSDictionary dictionaryWithContentsOfFile:[self dataFilePath]];
}
- (void) saveData
{
    [_configureData writeToFile:[self dataFilePath] atomically:YES];
}

- (void) copy:(NSDictionary*)from toMutableDid:(NSMutableDictionary*)aim
{
    for (NSString* key  in from.allKeys) {
        id object = from[key];
        if ([object isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary* subAim = [NSMutableDictionary new];
            [self copy:object toMutableDid:subAim];
            [aim setObject:subAim forKey:key];
        }
        else
        {
            [aim setObject:object forKey:key];
        }
    }
}

- (void) copyConfiguData:(NSDictionary*)dic
{
    
}

- (id) init

{
    self = [super init];
    if (!self) {
        return nil;
    }
    _pageCount = 5;

    _configureData = [NSMutableDictionary new];
    NSDictionary* dic  = [self configureFileData];
    if (dic) {
        [self copy:dic toMutableDid:_configureData];
    }
    else
    {
        NSString* path = [[NSBundle mainBundle] pathForResource:@"GuideData" ofType:@"plist"];
        [self copy:[NSDictionary dictionaryWithContentsOfFile:path] toMutableDid:_configureData];
    }
    
//    _configureData = [NSMutableDictionary new];
    return self;
}
@end
