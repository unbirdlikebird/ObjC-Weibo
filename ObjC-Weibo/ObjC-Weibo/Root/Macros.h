
#import "ObjC-Weibo.h"
#import "Constants.h"

#pragma mark - Log
//Debug log
#ifdef DEBUG
#define DBGLog(fmt, ...)    NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#define DBGLogRect(rect)    DBGLog(@"%s x=%f, y=%f, w=%f, h=%f", #rect, rect.origin.x, rect.origin.y,rect.size.width, rect.size.height)
#define DBGLogPoint(pt)     DBGLog(@"%s x=%f, y=%f", #pt, pt.x, pt.y)
#define DBGLogSize(size)    DBGLog(@"%s w=%f, h=%f", #size, size.width, size.height)
#define DBGLogColor(_COLOR) DBGLog(@"%s h=%f, s=%f, v=%f", #_COLOR, _COLOR.hue, _COLOR.saturation, _COLOR.value)
#define DBGLogSuperViews(_VIEW) { for (UIView* view = _VIEW; view; view = view.superview) { GBLog(@"%@", view); } }
#define DBGLogSubViews(_VIEW) { for (UIView* view in [_VIEW subviews]) { DBGLog(@"%@", view); } }
#else
#define DBGLogLog(...)
#define DBGLogLogRect(rect)
#define DBGLogLogPoint(pt)
#define DBGLogLogSize(size)
#define DBGLogLogColor(_COLOR)
#define DBGLogLogSuperViews(_VIEW)
#define DBGLogLogSubViews(_VIEW)
#endif

//Log with UIAlertView
#ifdef DEBUG
#define AlertLog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define AlertLog(...)
#endif
//mark
#define MARK    NSLog(@"\nMARK: %s, %d", __PRETTY_FUNCTION__, __LINE__)

//Device Information
#pragma mark - Device Information
#define isiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define isSimulator (NSNotFound != [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location)
#define NAVIGTIONBAR_HEIGHT 44
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//System Information
#pragma mark - System Information
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

//Functions
#pragma mark - Some Functions
#define USER_DEFAULT                [NSUserDefaults standardUserDefaults];
#define NOTIFICATION_CENTER         [NSNotificationCenter defaultCenter]
#define IMAGE_CACHE                 [SDImageCache sharedImageCache]
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGBRANDOM RGBCOLOR(arc4random() % 255, arc4random() % 255, arc4random() % 255)
#define LOCALSTRING(x, ...) NSLocalizedString(x, nil)
// rgb converter（hex->dec）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define FONT(x) [UIFont systemFontOfSize:x]

//documents structure of application
#define APP_DOCUMENT                [NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define APP_LIBRARY                 [NSSearchPathForDirectoriesInDomains (NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define APP_CACHES_PATH             [NSSearchPathForDirectoriesInDomains (NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define APP_USERINFO_PATH           userInfoPath()

//block
#pragma mark - Snippet
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;

// show Alert
#define alertContent(content) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" \
message:content \
delegate:nil   \
cancelButtonTitle:@"确定" \
otherButtonTitles:nil];  \
[alert show];  \


//singleton
//
//  SynthesizeSingleton.h
//  CocoaWithLove
//
//  Created by Matt Gallagher on 20/10/08.
//  Copyright 2009 Matt Gallagher. All rights reserved.
//
//  Permission is given to use this source code file without charge in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//
#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
}