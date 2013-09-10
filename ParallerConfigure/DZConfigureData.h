//
//  DZConfigureData.h
//  ParallerConfigure
//
//  Created by dzpqzb on 13-9-6.
//  Copyright (c) 2013年 dzpqzb inc. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSString* const kWizParallerRect = @"kWizParallerRect";
static NSString* const kWizParallerAlpha = @"kWizParallerAlpha";
static NSString* const kWizParallerText = @"kWizParallerText";
static NSString* const kWizParallerRotation = @"kWizParallerRotation";
static NSString* const kWizParallerChangedParamers = @"kWizParallerChangedParamers";
//
@interface DZConfigureData : NSObject
+ (id) shareInstance;
@property (nonatomic, strong) NSMutableDictionary* configureData;
@property (nonatomic, assign) int  pageCount;

- (void) saveData;
@end
