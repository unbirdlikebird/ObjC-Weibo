//
//  NSFileManager+EZFileManager.h
//  DemoOfCategories
//
//  Created by Dianyi Jiang on 24/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (EZFileManager)
/**
 *  获取Document目录
 */
+ (NSString *)ez_getDocumentPath;
/**
 *  获取Library目录
 */
+ (NSString *)ez_getLibraryPath;
/**
 *  获取Support目录
 */
+ (NSString*)ez_getSupportDirectory;
/**
 *  获取Cache目录
 */
+ (NSString *)ez_getCachePath;
/**
 *  获取tmp目录
 */
+ (NSString *)ez_getTmpPath;
/**
 *  获取工程中得文件路径
 */
+ (NSString *)ez_getResourceFilePath:(NSString *)filename type:(NSString*)ext;
/**
 *  获取当前路径下的所有文件
 */
+ (NSArray*)ez_getAllFilesInPath:(NSString*)path;
/**
 *  判断文件是否存在
 */
+ (BOOL)ez_isFileExist:(NSString *)filepath;
/**
 *  判断文件夹是否存在
 */
+ (BOOL)ez_isDirectoryExist:(NSString*)directorypath;
/**
 *  创建一个文件，文件存在或创建成功返回YES
 */
+ (BOOL)ez_createFileAtPath:(NSString*)parentPath name:(NSString*)FileName;
/**
 *  创建一个目录，目录存在或创建成功返回YES
 */
+ (BOOL)ez_createDirectoryAtPath:(NSString*)parentPath name:(NSString*)directoryName;
/**
 *  删除文件或文件夹
 */
+ (BOOL)ez_deleteFile:(NSString *)filepath;

@end
