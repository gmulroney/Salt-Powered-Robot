//
//  AudioLabel.m
//  Salt Powered Robot
//
//  Created by Garrett Mulroney on 5/19/17.
//  Copyright © 2017 Garrett Mulroney. All rights reserved.
//

#import "AudioLabel.h"

@implementation AudioLabel

- (instancetype)initWithTitle:(NSString*)audioTitle path:(NSURL*)path favorited:(BOOL)favorited objectId:(NSString*)objectId {
    if ((self = [super init]) != nil) {
        _audioPath = path;
        _audioTitle = audioTitle;
        _favorited = favorited;
        _objectId = objectId;
    }
    return self;
}

+ (instancetype)audioLabelWithTitle:(NSString *)audioTitle path:(NSURL *)path favorited:(BOOL)favorited objectId:(NSString *)objectId {
    return [[AudioLabel alloc] initWithTitle:audioTitle path:path favorited:favorited objectId:objectId];
}

@end
