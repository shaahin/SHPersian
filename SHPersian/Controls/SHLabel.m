//
//  SHLabel.m
//  SHPersian Persian Library for iOS
//
//  Created by Shahin Katebi on 11/6/12.
//  Copyright (c) 2013 Shaahin.us. All rights reserved.
//


#import "SHLabel.h"
#import "SHPersian.h"

@implementation SHLabel
@synthesize fontName = _fontName;
@synthesize hasShadow = _hasShadow;

-(void) setValue:(id)value forKey:(NSString *)key
{
    if ([[key lowercaseString] isEqualToString:@"font"])
    {
        self.fontName = value;
        [self renderText];
    }
    if ([[key lowercaseString] isEqualToString:@"shadow"])
    {
        self.hasShadow = [value boolValue];
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
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void) renderText
{
    self.font = [UIFont fontWithName:self.fontName size:self.font.pointSize];
}
- (void)awakeFromNib
{
    self.text = [self.text persianizedString];
    [self renderText];
}

-(void)setText:(NSString *)text
{
    [super setText:[text persianizedString]];
    [self renderText];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    if(self.hasShadow)
    {
        // Drawing code
        CGSize myShadowOffset = CGSizeMake(0, 0);

        CGContextRef myContext = UIGraphicsGetCurrentContext();
        CGContextSaveGState(myContext);
        CGColorRef myColor = [self.shadowColor CGColor];
        CGContextSetShadowWithColor (myContext, myShadowOffset, 5, myColor);
        [super drawTextInRect:rect];

        CGColorRelease(myColor);
        CGContextRestoreGState(myContext);
    }else
        [super drawRect:rect];
}

- (float)actualHeight
{
    CGSize size = [self sizeThatFits:CGSizeMake(self.frame.size.width, FLT_MAX)];
    return size.height;
}
- (void)resizeToFitText
{
    CGRect rect = self.frame;
    rect.size.height = [self actualHeight];
    self.frame = rect;
}
@end
