//
//  SHLabel.h
//  SHPersian Persian Library for iOS
//
//  Created by Shahin Katebi on 11/6/12.
//  Copyright (c) 2013 Shaahin.us. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHLabel : UILabel
@property (nonatomic) NSString *fontName;
@property (nonatomic) BOOL hasShadow;

- (float) actualHeight;
- (void) resizeToFitText;
@end
