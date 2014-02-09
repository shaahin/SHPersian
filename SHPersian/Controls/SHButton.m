//
//  SHButton.m
//  SHPersianSample
//
//  Created by Shahin on 2/8/14.
//  Copyright (c) 2014 Shaahin.us. All rights reserved.
//


#import "SHButton.h"

#import "SHPersian.h"


@implementation SHButton
@synthesize fontName = _fontName;
-(void) setValue:(id)value forKey:(NSString *)key
{
    if ([[key lowercaseString] isEqualToString:@"font"])
    {
        self.fontName = value;
        [self renderText];
    }
}
- (NSString *)fontName
{
    if(!_fontName)
        _fontName = DEFAULT_FONT_NAME;
    return _fontName;
}

- (void)setFontName:(NSString *)fontName
{
    _fontName = fontName;
    [self renderText];
}

- (void) renderText
{
    [self setTitle:[self.titleLabel.text persianizedString] forState:UIControlStateNormal];
    [self.titleLabel setFont:[UIFont fontWithName:self.fontName size:self.titleLabel.font.pointSize]];
}
- (void)awakeFromNib
{
    [self renderText];
}
- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:[title persianizedString] forState:state];
    [self.titleLabel setFont:[UIFont fontWithName:self.fontName size:self.titleLabel.font.pointSize]];
}
@end
