//
//  NSString+Additions.m
//  HappyPerson
//
//  Created by wei on 15/6/28.
//  Copyright (c) 2014 shuji. All rights reserved.
//

#import "NSString+Additions.h"
#import <CommonCrypto/CommonDigest.h>
#import <CoreGraphics/CoreGraphics.h>



@implementation NSString (Additions)


+ (void)emptyStringConvert:(NSString **)string
{
    if (!(*string)) {
        *string = @"";
    }
}

- (BOOL) isEmpty{
    
    if ([self length] == 0) {
        return YES;
    } else if ([[self stringByTrimmingCharactersInSet:
                 [NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    } else if ([self isEqualToString:@"<nil>"]) {
        return YES;
    }
    return NO;
}

- (NSString *) intervalDayFromNow
{
    
    
    BOOL valid;
    
    NSString *tmpString = [self stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:tmpString];
    valid = [alphaNums isSupersetOfSet:inStringSet];
    if (!valid) {
        return self;
    }
    
    NSDateFormatter *dateFormatter = nil;
    
    
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
    }
    NSCalendar *calendar = nil;
    if (calendar == nil) {
        calendar = [NSCalendar currentCalendar];
    }
    
    
    NSDate *date =nil;
    
    if ([self rangeOfString:@"."].location!=NSNotFound) {
        date =  [NSDate dateWithTimeIntervalSince1970:[self longLongValue]];
    }else{
        date=  [NSDate dateWithTimeIntervalSince1970:[self longLongValue]/1000.0f];
    }
    
    NSUInteger unitFlags =  NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit | NSHourCalendarUnit |NSMinuteCalendarUnit;
    NSDateComponents *lastComponent = [calendar components:unitFlags fromDate:date];
    NSDateComponents *nowComponent = [calendar components:unitFlags fromDate:[NSDate date]];
    
    if (nowComponent.year > lastComponent.year || nowComponent.month > lastComponent.month
        || nowComponent.day - lastComponent.day >= 2 ) {
        dateFormatter.dateFormat = @"MM-dd HH:mm";
        return [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:date]];
    }
    
    if (nowComponent.day - lastComponent.day == 1) {
        dateFormatter.dateFormat = @"HH:mm";
        return [NSString stringWithFormat:@"昨天 %@", [dateFormatter stringFromDate:date]];
    }
    
    
    if ((nowComponent.hour - lastComponent.hour)*60 + (nowComponent.minute - lastComponent.minute) >= 30 ) {
        dateFormatter.dateFormat = @"HH:mm";
        return [NSString stringWithFormat:@"今天 %@", [dateFormatter stringFromDate:date]];
    }
    
    return @"刚刚";
}


+ (NSString *)serializeURL:(NSString *)baseURL params:(NSDictionary *)params
{
    NSURL* parsedURL = [NSURL URLWithString:baseURL];
    NSString* queryPrefix = parsedURL.query ? @"&" : @"?";
    NSMutableArray* pairs = [NSMutableArray array];
    for (NSString* key in [params keyEnumerator])
    {
        
        NSString* escaped_value = nil;
        escaped_value= (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes
        (
         NULL, /* allocator */
         (CFStringRef)[params objectForKey:key],
         NULL, /* charactersToLeaveUnescaped */
         (CFStringRef)@"!*'();:@&=+$,/?%#[]",
         kCFStringEncodingUTF8);
        
        [pairs addObject:[NSString stringWithFormat:@"%@=%@", key, escaped_value]];
    }
    NSString* query = [pairs componentsJoinedByString:@"&"];
    
    return [NSString stringWithFormat:@"%@%@%@", baseURL, queryPrefix, query];
}

+ (NSMutableDictionary *) explodeQueryStringToDictionary:(NSString *) queryString
{
    
    NSArray *firstExplode = [queryString componentsSeparatedByString:@"&"];
    NSArray *secondExplode;
    NSInteger count = [firstExplode count];
    NSMutableDictionary* returnDictionary = [NSMutableDictionary dictionaryWithCapacity:count];
    for (NSInteger i = 0; i < count; i++) {
        secondExplode =
        [(NSString*)[firstExplode objectAtIndex:i] componentsSeparatedByString:@"="];
        if ([secondExplode count] == 2) {
            [returnDictionary setObject:[secondExplode objectAtIndex:1]
                                 forKey:[secondExplode objectAtIndex:0]];
        }
    }
    return returnDictionary;
}

+ (NSString *)urlEnCode:(NSString *)url
{
    NSString* escaped_value = nil;
    escaped_value= (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes
    (
     NULL, /* allocator */
     (CFStringRef)(url),
     NULL, /* charactersToLeaveUnescaped */
     (CFStringRef)@"!*'();:@&=+$,/?%#[]",
     kCFStringEncodingUTF8);
    return escaped_value;
}

- (NSUInteger)getWeiboTextLength
{
	NSInteger index, textLength;
	NSInteger absSumLength = 0;
	CGFloat sumLength = 0;
	if (nil != self)
	{
		textLength = [self length];
		if (textLength > 0)
		{
			for (index = 0; index < textLength; index++)
			{
				unichar c = [self characterAtIndex:index];
				sumLength += [self getCharacterLength:c];
			}
			absSumLength = sumLength;
			if (sumLength - absSumLength > 0.001)
				return absSumLength + 1;
			else
				return absSumLength;
		}
		else {
			return 0;
		}
	}
	else {
		return 0;
	}
}

- (CGFloat)getCharacterLength:(unichar)c
{
	if (c >= 32 && c <= 128)
		return 0.5;
	else
		return 1;
}


- (NSString *) MD5String {
    
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    CC_MD5_Update(&md5, [self UTF8String], [self length]);
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    NSString *s = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                   digest[0], digest[1],
                   digest[2], digest[3],
                   digest[4], digest[5],
                   digest[6], digest[7],
                   digest[8], digest[9],
                   digest[10], digest[11],
                   digest[12], digest[13],
                   digest[14], digest[15]];
    
    return s;
    
}



@end
