//
//  AudioLabel.h
//  Salt Powered Robot
//
//  Created by Garrett Mulroney on 5/19/17.
//  Copyright © 2017 Garrett Mulroney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AudioLabel : NSObject

@property (nonatomic, strong) NSString* audioTitle;
@property (nonatomic, strong) NSURL* audioPath;
@property (nonatomic) BOOL favorited;
@property (nonatomic, strong) NSString* objectId;

+ (instancetype)audioLabelWithTitle:(NSString*)audioTitle path:(NSURL*)path favorited:(BOOL)favorited objectId:(NSString*)objectId;

@end
