//
//  NSFileManager+EZFileManager.m
//  DemoOfCategories
//
//  Created by Dianyi Jiang on 24/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "NSFileManager+EZFileManager.h"

@implementation NSFileManager (EZFileManager)

//获取Document目录
+ (NSString *)ez_getDocumentPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return ([paths count] > 0 ? [paths lastObject] : @"undefined");
}
//获取Library目录
+ (NSString *)ez_getLibraryPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return ([paths count] > 0 ? [paths lastObject] : @"undefined");
}

+ (NSString*)ez_getSupportDirectory {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *supportUrl = [fileManager URLForDirectory:NSApplicationSupportDirectory
                                            inDomain:NSUserDomainMask
                                   appropriateForURL:nil
                                              create:YES
                                               error:NULL];
    
    return [supportUrl path];
}

//获取Cache目录
+ (NSString *)ez_getCachePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return ([paths count] > 0 ? [paths lastObject] : @"undefined");
}

//获取tmp目录
+ (NSString *)ez_getTmpPath {
    return NSTemporaryDirectory();
}

+ (NSArray*)ez_getAllFilesInPath:(NSString*)path {
    NSError *error = nil;
    NSArray *fileList = [[NSArray alloc] init];
    //fileList便是包含有该文件夹下所有文件的文件名及文件夹名的数组
    fileList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:&error];
    if (error || fileList.count==0) {
        return nil;
    }
    return fileList;
}

+ (NSString *)ez_getResourceFilePath:(NSString *)filename type:(NSString*)ext {
    return [[NSBundle mainBundle] pathForResource:filename ofType:ext];
}

+ (BOOL)ez_isFileExist:(NSString *)filepath {
    return [[NSFileManager defaultManager] fileExistsAtPath:filepath];
}

+ (BOOL)ez_isDirectoryExist:(NSString*)directoryPath{
    BOOL isDirectory = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    return isDirectory;
}

//创建一个文件
+ (BOOL)ez_createFileAtPath:(NSString*)parentPath name:(NSString*)FileName {
    
    NSString* dir = [parentPath stringByAppendingPathComponent:FileName];
    if ([[self class] ez_isFileExist:dir]) {
        return YES;
    }
    return [[NSFileManager defaultManager]createFileAtPath:dir contents:nil attributes:nil];
}

//创建一个目录
+ (BOOL)ez_createDirectoryAtPath:(NSString*)parentPath name:(NSString*)directoryName {
    
    NSString* directory = [parentPath stringByAppendingPathComponent:directoryName];
    if ([[self class] ez_isDirectoryExist:directory]) {
        return YES;
    }
    NSError* error;
    return [[NSFileManager defaultManager]createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:&error];
}

+ (BOOL)ez_deleteFile:(NSString *)filepath {
    return [[NSFileManager defaultManager] removeItemAtPath:filepath error:nil];
}

@end
