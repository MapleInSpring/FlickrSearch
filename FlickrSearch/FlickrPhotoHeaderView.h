//
//  FlickrPhotoHeaderView.h
//  FlickrSearch
//
//  Created by Yifeng Hou on 26/2/14.
//  Copyright (c) 2014 GraceHou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlickrPhotoHeaderView : UICollectionReusableView

@property(weak) IBOutlet UIImageView *backgroundImageView;
@property(weak) IBOutlet UILabel *searchLabel;

-(void)setSearchText:(NSString *)text;

@end
