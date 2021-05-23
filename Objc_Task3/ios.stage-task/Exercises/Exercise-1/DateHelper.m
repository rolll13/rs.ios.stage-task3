#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (0 < monthNumber && monthNumber <= 12) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        NSString *month = [[dateFormatter monthSymbols] objectAtIndex:monthNumber - 1];
        return month;
    }
    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    return [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[dateFormatter dateFromString:date]];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"EE";
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    NSLog(@"%@", [dateFormatter stringFromDate:date]);
    return [dateFormatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger week = [calendar component:NSCalendarUnitWeekOfYear fromDate:date];
    NSInteger thisWeek = [calendar component:NSCalendarUnitWeekOfYear fromDate:[NSDate now]];
    if (week == thisWeek){
        return YES;
    }
    return NO;
}

@end
