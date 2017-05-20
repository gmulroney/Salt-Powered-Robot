//
//  AudioCell.m
//  Salt Powered Robot
//
//  Created by Garrett Mulroney on 5/19/17.
//  Copyright © 2017 Garrett Mulroney. All rights reserved.
//

#import "AudioCell.h"
#import "AudioLabel.h"
#import <AudioToolbox/AudioToolbox.h>

static UIImage* filledImage;
static UIImage* emptyImage;

@implementation AudioCell {
    IBOutlet UILabel* mainLabel;
    IBOutlet UIButton* favoriteButton;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    if (!filledImage)
        filledImage = [UIImage imageNamed:@"ic_favorite_white_48pt"];
    if (!emptyImage)
        emptyImage = [UIImage imageNamed:@"ic_favorite_border_white_48pt"];
    if (self.audioLabel) {
        [mainLabel setText:self.audioLabel.audioTitle];
        if (self.audioLabel.favorited) {
            [favoriteButton setImage:filledImage forState:UIControlStateNormal];
        } else {
            [favoriteButton setImage:emptyImage forState:UIControlStateNormal];
        }
    }
}

- (void)setAudioLabel:(AudioLabel *)audioLabel {
    if (audioLabel != _audioLabel) {
        _audioLabel = audioLabel;
        if (mainLabel) {
            [mainLabel setText:self.audioLabel.audioTitle];
        }
        if (favoriteButton) {
            if (!filledImage)
                filledImage = [UIImage imageNamed:@"ic_favorite_white_48pt"];
            if (!emptyImage)
                emptyImage = [UIImage imageNamed:@"ic_favorite_border_white_48pt"];
            if (self.audioLabel.favorited) {
                [favoriteButton setImage:filledImage forState:UIControlStateNormal];
            } else {
                [favoriteButton setImage:emptyImage forState:UIControlStateNormal];
            }
        }
    }
}

- (IBAction)didTapButton:(id)sender {
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)self.audioLabel.audioPath, &soundID);
    AudioServicesPlaySystemSound(soundID);
}

- (IBAction)didTapFavorite:(id)sender {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [self.audioLabel setFavorited:!self.audioLabel.favorited];
    if (self.audioLabel.favorited) {
        [favoriteButton setImage:filledImage forState:UIControlStateNormal];
    } else {
        [favoriteButton setImage:emptyImage forState:UIControlStateNormal];
    }
    [defaults setObject:[NSNumber numberWithBool:self.audioLabel.favorited] forKey:self.audioLabel.objectId];
    [defaults synchronize];
}

@end
