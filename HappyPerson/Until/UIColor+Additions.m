//
//  UIColor+Additions.m
//  HappyPerson
//
//  Created by wei on 15/6/28.
//  Copyright (c) 2014 shuji. All rights reserved.
//

#import "UIColor+Additions.h"

@implementation UIColor (Additions)


UIColor *UIColorWithRGBFloatValue(float red,float green,float blue)
{
    return [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:1.f];
}

+ (UIColor *) colorWithHexString: (NSString *) stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor whiteColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor whiteColor];
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}


+ (UIColor *) colorWithDesignIndex:(int)index{
    
    static  NSArray *textColors = nil;
    
    // 源码：5=e3e3e3
    if (textColors == nil) {
     //                   0          1          2          3          4
        textColors=@[@"#FFFFFF",@"#444444",@"#666666",@"#999999",@"#CCCCCC",
     //                   5          6          7          8          9
                     @"#e3e3e3",@"#b3b3b3",@"#dadada",@"#676767",@"#303030",
     //                   10         11         12         13         14
                     @"#700608",@"#828282",@"#00c3f1",@"#ff6100",@"#eecc8d",
     //                   15         16         17          18      19
                     @"#a01e1e",@"#0060d0",@"#0074c7",@"#FF6100",@"#dcdcdc",
    //                     20       21          22          23        24
                     @"#ff6100",@"#444444",@"#666666",@"#818181",@"#bea76f",
   //                      25       26          27      28            29
                     @"#e0cd89",@"#b6b6b6",@"#4cc2ee",@"#2bbcff",@"f7f7f7",
                     //30             31         32      
                     @"#dcdcdc",@"#f4f4f4",@"#818181"];
        
    }
    
    if ( (index >= 0 && index < [textColors count]) == NO) {
        return [UIColor blackColor];
    }
    
    static NSMutableDictionary *colorContainer = nil;
    if (colorContainer == nil) {
        colorContainer = [NSMutableDictionary dictionary];
    }
    
    UIColor *retColor =  [colorContainer objectForKey:[NSNumber numberWithInt:index]];
    if (retColor == nil) {
        retColor = [UIColor colorWithHexString:textColors[index]];
        [colorContainer setObject:retColor forKey:[NSNumber numberWithInt:index]];
        return retColor;
    }else{
        return retColor;
    }

}



+ (BOOL) isTheSameColor:(UIColor*)color1 anotherColor:(UIColor*)color2
{
    if (CGColorEqualToColor(color1.CGColor, color2.CGColor)) {
         return YES;
    }
    else {
        return NO;
    }
 }
@end
