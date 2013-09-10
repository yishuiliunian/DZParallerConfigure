//
//  DZPageCheckViewController.m
//  ParallerConfigure
//
//  Created by dzpqzb on 13-9-6.
//  Copyright (c) 2013年 dzpqzb inc. All rights reserved.
//

static NSString* const kWizParallerDataIconTalk = @"kWizParallerDataIconTalk";
static NSString* const kWizParallerDataIconRecord = @"kWizParallerDataIconRecord";
static NSString* const kWizParallerDataIconMusic = @"kWizParallerDataIconMusic";
static NSString* const kWizParallerDataIconFlag = @"kWizParallerDataIconFlag";
static NSString* const kWizParallerDataIconCloud = @"kWizParallerDataIconCloud";
static NSString* const kWizParallerDataIconWeather = @"kWizParallerDataIconWeather";
static NSString* const kWizParallerDataIconBook = @"kWizParallerDataIconBook";
///
static NSString* const kWizParallerDataIconBackBrain = @"kWizParallerDataIconBackBrain";
static NSString* const kWizParallerDataIconBackTree = @"kWizParallerDataIconBackTree";
static NSString* const kWizParallerDataIconBackBox = @"kWizParallerDataIconBackBox";
static NSString* const kWizParallerDataIconBackShare = @"kWizParallerDataIconBackShare";
//
static NSString* const kWizParallerDataIconItem0 = @"kWizParallerDataIconItem0";
static NSString* const kWizParallerDataIconItem1 = @"kWizParallerDataIconItem1";
static NSString* const kWizParallerDataIconItem2 = @"kWizParallerDataIconItem2";
static NSString* const kWizParallerDataIconItem3 = @"kWizParallerDataIconItem3";
static NSString* const kWizParallerDataIconItem4 = @"kWizParallerDataIconItem4";
static NSString* const kWizParallerDataIconItem5 = @"kWizParallerDataIconItem5";
static NSString* const kWizParallerDataIconItem6 = @"kWizParallerDataIconItem6";
//
#import "DZPageCheckViewController.h"
#import <objc/runtime.h>
@interface NSObject(a)
@property (nonatomic, strong) NSString* identify;
@end

static void* kIdentify = &kIdentify;
@implementation NSObject (a)

@dynamic identify;

- (void) setIdentify:(NSString *)identify
{
    objc_setAssociatedObject(self, kIdentify, identify, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-( NSString*) identify
{
    return objc_getAssociatedObject(self, kIdentify);
}

@end

@interface DZPageCheckViewController ()
{
    NSMutableDictionary* _parallersData;
    //
    UIImageView* _imageView;
    
    UISlider* widthSlider;
    UISlider* heightSlider;
    UISlider* alphaSlider;
    //
    NSString* lastIdentify;
}
@end

@implementation DZPageCheckViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) moveImageViewWithRecognizer:(UIPanGestureRecognizer*)sender
{
    CGPoint point = [sender locationInView:self.view];
    float width =CGRectGetWidth(sender.view.frame);
    float height = CGRectGetHeight(sender.view.frame);
    sender.view.frame = CGRectMake(point.x, point.y,width,height);
    [self setParallerIdentify:sender.identify PointX:point.x y:point.y width:width height:height];
    //
    NSDictionary* info = [[DZConfigureData shareInstance] configureData][sender.identify][self.pageCountStr];
    
    CGRect rect = CGRectFromString(info[kWizParallerRect]);
    widthSlider.minimumValue = 0;
    widthSlider.value = rect.size.width;
    widthSlider.maximumValue = CGRectGetWidth(self.view.frame);
    //
    heightSlider.minimumValue = 0;
    heightSlider.value = rect.size.height;
    heightSlider.maximumValue = CGRectGetWidth(self.view.frame);
    //
    alphaSlider.minimumValue = 0;
    alphaSlider.value = [info[kWizParallerAlpha] floatValue];
    alphaSlider.maximumValue = 1.0;
    lastIdentify = sender.identify;
}
- (void) loadView
{
    _imageView = [UIImageView new];
    _imageView.frame = [UIScreen mainScreen].bounds;
    self.view = _imageView;
}


- (void)  setParallerIdentify:(NSString*)identify PointX:(float)x y:(float)y width:(float)width height:(float)height
{

    NSString* rect = [NSString stringWithFormat:@"{{%f,%f},{%f,%f}}",x, y ,width, height];
    NSMutableDictionary* dic =  [[DZConfigureData shareInstance] configureData][identify][self.pageCountStr];
    [dic setObject:rect forKey:kWizParallerRect];
}

- (void) showNavgationbar
{
    [self.navigationController setNavigationBarHidden:!self.navigationController.navigationBarHidden];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    _imageView.userInteractionEnabled = YES;
    _imageView.image = [UIImage imageNamed:self.pageCountStr];
    UITapGestureRecognizer* tapGestrue = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showNavgationbar)];
    tapGestrue.numberOfTapsRequired = 2;
    tapGestrue.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tapGestrue];
    //
    //
    _parallersData = [NSMutableDictionary new];
    NSDictionary* keyNames = @{kWizParallerDataIconBook:@"guide_icon_book",
                               kWizParallerDataIconCloud:@"guide_icon_cloud",
                               kWizParallerDataIconFlag:@"guide_icon_flag",
                               kWizParallerDataIconRecord:@"guide_icon_record",
                               kWizParallerDataIconTalk:@"guide_icon_talk",
                               kWizParallerDataIconWeather:@"guide_icon_weather",
                               kWizParallerDataIconBackBox:@"guid_icon_back_box",
                               kWizParallerDataIconBackTree:@"guid_icon_back_tree",
                               kWizParallerDataIconBackShare:@"guid_icon_back_share",
                               kWizParallerDataIconBackBrain:@"guid_icon_back_brain",
                               kWizParallerDataIconItem0:@"guid_icon_0",
                               kWizParallerDataIconItem1:@"guid_icon_1",
                               kWizParallerDataIconItem2:@"guid_icon_2",
                               kWizParallerDataIconItem3:@"guid_icon_3",
                               kWizParallerDataIconItem4:@"guid_icon_4",
                               kWizParallerDataIconItem5:@"guid_icon_5",
                               kWizParallerDataIconItem6:@"guid_icon_6"
                               };
    UIImageView* (^ImageViewWithImageName)(NSString*) = ^(NSString*name) {
        UIImageView* imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:name];
        return imageView;
    };
    //
    NSDictionary* dic = [[DZConfigureData shareInstance] configureData];
    void(^AddImageViewByKey)(NSString*, NSString* name) = ^(NSString* key, NSString* name) {
        UIImageView* imageView = ImageViewWithImageName(keyNames[key]);
        [self.view addSubview:imageView];
        UILabel* label = [[UILabel alloc] init];
        label.text = [name substringFromIndex:20];
        [imageView addSubview:label];
        label.frame = CGRectMake(-40, 0, 200, 20);
        [_parallersData setObject:imageView forKey:name];
        
        UIPanGestureRecognizer* tap = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveImageViewWithRecognizer:)];
        [imageView addGestureRecognizer:tap];
        imageView.userInteractionEnabled = YES;
        tap.identify = name;
    };
    for (NSString* name in dic.allKeys) {
        if ([name hasPrefix:kWizParallerDataIconWeather]) {
            AddImageViewByKey(kWizParallerDataIconWeather, name);
        }
        else if ([name hasPrefix:kWizParallerDataIconTalk])
        {
            AddImageViewByKey(kWizParallerDataIconTalk, name);
        }
        else if ([name hasPrefix:kWizParallerDataIconRecord])
        {
            AddImageViewByKey(kWizParallerDataIconRecord, name);
        }
        else if ([name hasPrefix:kWizParallerDataIconFlag])
        {
            AddImageViewByKey(kWizParallerDataIconFlag, name);
        }
        else if ([name hasPrefix:kWizParallerDataIconBook])
        {
            AddImageViewByKey(kWizParallerDataIconBook, name);
        }
        else if ([name hasPrefix:kWizParallerDataIconBackBox])
        {
            AddImageViewByKey(name, name);
        }
        else if ([name hasPrefix:kWizParallerDataIconBackTree])
        {
            AddImageViewByKey(name, name);
        }
        else if ([name hasPrefix:kWizParallerDataIconBackBrain])
        {
            AddImageViewByKey(name, name);
        }
        else if ([name hasPrefix:kWizParallerDataIconBackShare])
        {
            AddImageViewByKey(name, name);
        }
        else if ([name hasPrefix:@"kWizParallerDataIconItem"])
        {
            AddImageViewByKey(name, name);
        }
    }
    self.view.backgroundColor = [UIColor blueColor];
    
    for (NSString* name  in dic.allKeys) {
        [self configureParaller:_parallersData[name] identify:name atPageIndex:[self.pageCountStr integerValue]];
    }
    
    widthSlider = [[UISlider alloc] initWithFrame:CGRectMake(30, 25, 200, 20)];
    [self.view addSubview:widthSlider];
    [widthSlider addTarget:self action:@selector(changedWidth) forControlEvents:UIControlEventValueChanged];
    heightSlider = [[UISlider alloc] initWithFrame:CGRectOffset(widthSlider.frame, 0, 30)];
    [self.view addSubview:heightSlider];
    [heightSlider addTarget:self action:@selector(changeHeight) forControlEvents:UIControlEventValueChanged];
    alphaSlider = [[UISlider alloc] initWithFrame:CGRectOffset(heightSlider.frame, 0, 30)];
    [self.view addSubview:alphaSlider];
    [alphaSlider addTarget:self action:@selector(changeAlpha) forControlEvents:UIControlEventValueChanged];
	// Do any additional setup after loading the view.
}

- (void) changedWidth
{
    NSDictionary* info = [[DZConfigureData shareInstance] configureData][lastIdentify][self.pageCountStr];
    CGRect rect = CGRectFromString(info[kWizParallerRect]);
    [self setParallerIdentify:lastIdentify PointX:rect.origin.x y:rect.origin.y width:widthSlider.value height:CGRectGetHeight(rect)];
    UIView* paraller = _parallersData[lastIdentify];
    paraller.frame = CGRectMake(rect.origin.x, rect.origin.y, widthSlider.value, CGRectGetHeight(rect));
}

- (void) changeHeight
{
    NSDictionary* info = [[DZConfigureData shareInstance] configureData][lastIdentify][self.pageCountStr];
    CGRect rect = CGRectFromString(info[kWizParallerRect]);
    
    [self setParallerIdentify:lastIdentify PointX:rect.origin.x y:rect.origin.y width:CGRectGetWidth(rect) height:heightSlider.value];
    
    UIView* paraller = _parallersData[lastIdentify];
    paraller.frame = CGRectMake(rect.origin.x, rect.origin.y, CGRectGetWidth(rect), heightSlider.value);
}

- (void) changeAlpha
{
    NSMutableDictionary* info = [[DZConfigureData shareInstance] configureData][lastIdentify][self.pageCountStr];
    info[kWizParallerAlpha] = [@(alphaSlider.value) stringValue];
    UIView* paraller = _parallersData[lastIdentify];
    paraller.alpha = alphaSlider.value;
}

- (void) configureParaller:(UIView*)paraller identify:(NSString*)identify atPageIndex:(NSInteger)index
{
    NSDictionary* info = [[DZConfigureData shareInstance] configureData][identify][[@(index) stringValue]];
    NSSet* params = [[DZConfigureData shareInstance] configureData][identify][kWizParallerChangedParamers];
    if ([params containsObject:kWizParallerText] && [paraller isKindOfClass:[UILabel class]]) {
        [(UILabel*)paraller setText:info[kWizParallerText]];
    }
    if ([params containsObject:kWizParallerRect]) {
        CGRect rect = CGRectFromString(info[kWizParallerRect]);
        paraller.frame = CGRectOffset(rect, 0, 0);
    }
    if ([params containsObject:kWizParallerAlpha]) {
        paraller.alpha = [info[kWizParallerAlpha] floatValue];
    }
    if ([params containsObject:kWizParallerRotation]) {
//        float cAngle =  [info[kWizParallerRotation] floatValue];
//        paraller.layer.transform = CATransform3DMakeRotation(DEGREES_TO_RADIANS(cAngle), 0, 0, 1);
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
