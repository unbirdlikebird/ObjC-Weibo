//
//  NSString+EZString.m
//  DemoOfCategories
//
//  Created by Dianyi Jiang on 24/08/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "NSString+EZString.h"

@implementation NSString (EZString)

// Checking if String is Empty
-(BOOL)ez_isBlank {
    return ([[self ez_removeWhiteSpacesFromString] isEqualToString:@""]) ? YES : NO;
}

//Checking if String is empty or nil
-(BOOL)ez_isValid {
    return ([[self ez_removeWhiteSpacesFromString] isEqualToString:@""] || self == nil || [self isEqualToString:@"(null)"]) ? NO :YES;
}

//Checking if String is Chinese
-(BOOL)ez_isChinese {
    NSString *match=@"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

// Is Valid Email
- (BOOL)ez_isValidEmail {
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

// Is Valid Phone
- (BOOL)ez_isVAlidPhoneNumber {
    NSString *regex = @"[235689][0-9]{6}([0-9]{3})?";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

// Is Valid URL
- (BOOL)ez_isValidUrl {
    NSString *regex =@"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}

// remove white spaces from String
- (NSString *)ez_removeWhiteSpacesFromString {
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
}

// Counts number of Words in String
- (NSUInteger)ez_countNumberOfWords {
    NSScanner *scanner = [NSScanner scannerWithString:self];
    NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    NSUInteger count = 0;
    while ([scanner scanUpToCharactersFromSet: whiteSpace intoString: nil]) {
        count++;
    }
    
    return count;
}

// If string contains substring
- (BOOL)ez_isContainsString:(NSString *)subString {
    return ([self rangeOfString:subString].location == NSNotFound) ? NO : YES;
}

// Get Substring from particular location to given lenght
- (NSString*)ez_getSubstringFrom:(NSInteger)begin to:(NSInteger)end {
    NSRange r;
    r.location = begin;
    r.length = end - begin;
    return [self substringWithRange:r];
}

// Add substring to main String
- (NSString *)ez_addString:(NSString *)string {
    if(!string || string.length == 0) {
        return self;
    }
    return [self stringByAppendingString:string];
}

// Remove particular sub string from main string
-(NSString *)ez_removeSubString:(NSString *)subString {
    if ([self containsString:subString]) {
        NSRange range = [self rangeOfString:subString];
        return  [self stringByReplacingCharactersInRange:range withString:@""];
    }
    return self;
}

// If my string contains ony letters
- (BOOL)ez_isContainsOnlyLetters {
    NSCharacterSet *letterCharacterset = [[NSCharacterSet letterCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:letterCharacterset].location == NSNotFound);
}

// If my string contains only numbers
- (BOOL)ez_isContainsOnlyNumbers {
    NSCharacterSet *numbersCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    return ([self rangeOfCharacterFromSet:numbersCharacterSet].location == NSNotFound);
}

// If my string contains letters and numbers
- (BOOL)ez_isContainsOnlyNumbersAndLetters {
    NSCharacterSet *numAndLetterCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:numAndLetterCharSet].location == NSNotFound);
}

// Get String from array
+ (NSString *)ez_getStringFromArray:(NSArray *)array {
    return [array componentsJoinedByString:@" "];
}

// Convert Array from my String
- (NSArray *)ez_getArray {
    return [self componentsSeparatedByString:@" "];
}

// Get My Application Version number
+ (NSString *)ez_getMyApplicationVersion {
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [info objectForKey:@"CFBundleVersion"];
    return version;
}

// Get My Application name
+ (NSString *)ez_getMyApplicationName {
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *name = [info objectForKey:@"CFBundleDisplayName"];
    return name;
}

// Convert string to NSData
- (NSData *)ez_convertToData {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

// Get String from NSData
+ (NSString *)ez_getStringFromData:(NSData *)data {
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

// get a random string with designated length
+ (NSString*)ez_randomStringWithLength:(NSUInteger)length {
    NSInteger NUMBER_OF_CHARS = length;
    char data[NUMBER_OF_CHARS];
    for (int x=0 ;x < NUMBER_OF_CHARS;data[x++] = (char)('A' + (arc4random_uniform(26))))
    {
    }
    return  [[NSString alloc] initWithBytes:data length:NUMBER_OF_CHARS encoding:NSUTF8StringEncoding];
}

// Return JSON String
+ (NSString*)ez_getJSONSStringByJSONObject:(id)jsonObject {
    NSString *jsonString = nil;
    if ([NSJSONSerialization isValidJSONObject:jsonObject]) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:jsonObject options:NSJSONWritingPrettyPrinted error:nil];
        jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

@end
