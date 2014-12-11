//
//  NSAttributedString+HTHMarkdown.h
//
//  Copyright (c) 2014 Heiko Theuner. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * A class category for Markdown in attributed strings.
 */
@interface NSAttributedString (HTHMarkdown)

/**
 * Only supports markdown for images (from the bundle) w/o alt text
 *
 * @param theMarkdown e.g. @"here is my clock !(Icon Clock)", "Icon Clock" is the image name in Image.xcassets
 * @param theAttributes Don't forget to set @{ NSFontAttributeName : [UIFont ...] }
 * @return Returns an NSAttributedString object initialized with the characters of aString and the attributes of attributes.
 */
- (instancetype)initWithMarkdown:(NSString *)theMarkdown attributes:(NSDictionary *)theAttributes;

@end
