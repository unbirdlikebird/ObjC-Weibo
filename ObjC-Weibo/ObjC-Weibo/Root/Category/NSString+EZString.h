//
//  NSString+EZString.h
//  DemoOfCategories
//
//  Created by Dianyi Jiang on 24/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (EZString)
/**
 *  判断字符串是否为空
 */
-(BOOL)ez_isBlank;
/**
 *  判断字符串是否为有效的字符
 */
-(BOOL)ez_isValid;
/**
 *  判断字符串是否为有效email
 */
- (BOOL)ez_isValidEmail;
/**
 *  判断字符串是否为电话号码
 */
- (BOOL)ez_isVAlidPhoneNumber;
/**
 *  判断字符串是否为有效网址
 */
- (BOOL)ez_isValidUrl;
/**
 *  判断字符串是否包含指定字符
 */
- (BOOL)ez_isContainsString:(NSString *)subString;
/**
 *  判断字符串是否为纯字母
 */
- (BOOL)ez_isContainsOnlyLetters;
/**
 *  判断字符串是否为纯数字
 */
- (BOOL)ez_isContainsOnlyNumbers;
/**
 *  判断字符串是否为字母和数字组合
 */
- (BOOL)ez_isContainsOnlyNumbersAndLetters;
/**
 *  删除字符串中的空格和换行符
 */
- (NSString *)ez_removeWhiteSpacesFromString;
/**
 *  计算字符串中的单词个数
 */
- (NSUInteger)ez_countNumberOfWords;
/**
 *  获取指定位置的字符串
 */
- (NSString*)ez_getSubstringFrom:(NSInteger)begin to:(NSInteger)end;
/**
 *  删除指定字符串
 */
- (NSString *)ez_removeSubString:(NSString *)subString;
/**
 *  获取程序版本号
 */
+ (NSString *)ez_getMyApplicationVersion;
/**
 *  获取程序名称
 */
+ (NSString *)ez_getMyApplicationName;
/**
 *  string转换为data
 */
- (NSData *)ez_convertToData;
/**
 *  data转换为string
 */
+ (NSString *)ez_getStringFromData:(NSData *)data;
/**
 *  计算文字SIZE
 */
- (CGSize)ez_sizeWithFont:(UIFont *)font;
/**
 *  计算文字SIZE
 */
- (CGSize)ez_sizeWithFont:(UIFont *)font withMaxWidth:(CGFloat)maxWidth;
/**
 *  转换成JSon string
 */
+ (NSString*)ez_getJSONSStringByJSONObject:(id)jsonObject;

@end
