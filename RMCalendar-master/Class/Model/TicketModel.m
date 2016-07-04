//
//  TicketModel.m
//  RMCalendar
//
//  Created by 迟浩东 on 15/7/6.
//  Copyright (c) 2015年 迟浩东. All rights reserved.
//

#import "TicketModel.h"

@implementation TicketModel

+ (instancetype)ticketModleWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDict:dic];
}

- (instancetype)initWithDict:(NSDictionary *)dic{
    if (self = [super init]) {
        self.year = [dic[@"year"] integerValue];
        self.month = [dic[@"month"] integerValue];
        self.day = [dic[@"day"] integerValue];
        self.ticketCount = [dic[@"ticketCount"] integerValue];
        self.ticketPrice = [dic[@"ticketPrice"] floatValue];
    }
    return self;
}

@end
