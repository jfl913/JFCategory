//
//  UIImageView+JFAdd.m
//  JFCategory
//
//  Created by junfeng.li on 2018/3/8.
//

#import "UIImageView+JFAdd.h"
#import <objc/runtime.h>

@interface UIImage (CornerRadius)

@property (nonatomic, assign) BOOL jf_hasCornerRadius;

@end

@implementation UIImage (JFAdd)

- (BOOL)jf_hasCornerRadius {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setJf_hasCornerRadius:(BOOL)jf_hasCornerRadius {
    objc_setAssociatedObject(self, @selector(jf_hasCornerRadius), @(jf_hasCornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@interface JFImageViewObserver: NSObject

@property (nonatomic, assign) UIImageView *originImageView;
@property (nonatomic, strong) UIImage *originImage;
@property (nonatomic, assign) CGFloat cornerRadius;

- (instancetype)initWithImageView:(UIImageView *)imageView;

@end

@implementation JFImageViewObserver

- (instancetype)initWithImageView:(UIImageView *)imageView {
    if (self = [super init]) {
        self.originImageView = imageView;
        
        [self.originImageView addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
        [self.originImageView addObserver:self forKeyPath:@"contentMode" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"image"]) {
        UIImage *newImage = change[@"new"];
        
        if (![newImage isKindOfClass:[UIImage class]] || newImage.jf_hasCornerRadius) {
            return;
        }
        [self updateImageView];
    }
    
    if ([keyPath isEqualToString:@"contentMode"]) {
        self.originImageView.image = self.originImage;
    }
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    if (_cornerRadius == cornerRadius) {
        return;
    }
    
    _cornerRadius = cornerRadius;
    if (_cornerRadius > 0) {
        [self updateImageView];
    }
}

- (void)updateImageView {
    self.originImage = self.originImageView.image;
    
    if (!self.originImage) {
        return;
    }
    
    UIImage *roundedImage = nil;
    UIGraphicsBeginImageContextWithOptions(self.originImageView.bounds.size, NO, [UIScreen mainScreen].scale);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    if (currentContext) {
        CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:self.originImageView.bounds cornerRadius:self.cornerRadius].CGPath;
        CGContextAddPath(currentContext, path);
        CGContextClip(currentContext);
        [self.originImageView.layer renderInContext:currentContext];
        roundedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    if (roundedImage && [roundedImage isKindOfClass:[UIImage class]]) {
        roundedImage.jf_hasCornerRadius = YES;
        self.originImageView.image = roundedImage;
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateImageView];
        });
    }
}

- (void)dealloc {
    [self.originImageView removeObserver:self forKeyPath:@"image"];
    [self.originImageView removeObserver:self forKeyPath:@"contentMode"];
}

@end

@implementation UIImageView (JFAdd)

- (CGFloat)jf_cornerRadius {
    return [self imageViewObserver].cornerRadius;
}

- (void)setJf_cornerRadius:(CGFloat)jf_cornerRadius {
    [self imageViewObserver].cornerRadius = jf_cornerRadius;
}

- (JFImageViewObserver *)imageViewObserver {
    JFImageViewObserver *observer = objc_getAssociatedObject(self, _cmd);
    if (!observer) {
        observer = [[JFImageViewObserver alloc] initWithImageView:self];
        objc_setAssociatedObject(self, @selector(imageViewObserver), observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return observer;
}

@end


