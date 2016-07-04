//
//  LDZAVPlayerHelper.m
//  LDZMoviewPlayer_Xib
//
//  Created by rongxun02 on 15/12/10.
//  Copyright © 2015年 DongZe. All rights reserved.
//

#import "LDZAVPlayerHelper.h"

@interface LDZAVPlayerHelper ()
{
    AVPlayer *player;
}
@end

@implementation LDZAVPlayerHelper

- (AVPlayer *)getAVPlayer {
    if (player) {
        return player;
    }
    return nil;
}

- (void)initAVPlayerWithAVPlayerItem:(AVPlayerItem *)item {
    player = [[AVPlayer alloc] initWithPlayerItem:item];
}
- (void)setAVPlayerVolume:(float)volume {
    [player setVolume:volume];
}
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com