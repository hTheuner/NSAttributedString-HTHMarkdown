//
//  NSAttributedString+HTHMarkdown.m
//
//  Copyright (c) 2014 Heiko Theuner. All rights reserved.
//

#import "NSAttributedString+HTHMarkdown.h"

#import <UIKit/UIKit.h>

@implementation NSAttributedString (HTHMarkdown)

- (instancetype)initWithMarkdown:(NSString *)theMarkdown attributes:(NSDictionary *)theAttributes;
{
	if ([theMarkdown length] == 0) {
		return nil;
	}
	
	NSMutableAttributedString * mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:theMarkdown attributes:theAttributes];
	if (!mutableAttributedString) {
		return nil;
	}
	
	UIFont * font = theAttributes[NSFontAttributeName];
	if (!font) {
		font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
	}
	
	NSError * regularExpressionError;
	NSRegularExpression * regularExpression = [NSRegularExpression regularExpressionWithPattern:@"\\!\\([^)]+\\)" options:0 error:&regularExpressionError];
	
	if (regularExpressionError) {
		return nil;
	}
	
	NSUInteger offset = 0;
	NSArray * matches = [regularExpression matchesInString:theMarkdown options:0 range:NSMakeRange(0, [theMarkdown length])];
	
	for (NSTextCheckingResult * result in matches) {
		
		NSRange imageNamedRange = result.range;
		imageNamedRange.location += 2;
		imageNamedRange.length -= 3;
		
		NSString * imageNamed = [theMarkdown substringWithRange:imageNamedRange];
		UIImage * image = [UIImage imageNamed:imageNamed];
		if (!image) {
			continue;
		}
		
		NSTextAttachment * textAttachment = [[NSTextAttachment alloc] init];
		textAttachment.image = image;
		textAttachment.bounds = CGRectMake(0, floor((font.capHeight - textAttachment.image.size.height) / 2.f), textAttachment.image.size.width, textAttachment.image.size.height);
		
		NSAttributedString * attributedStringWithImage = [NSAttributedString attributedStringWithAttachment:textAttachment];
		
		NSRange charactersRange = result.range;
		charactersRange.location -= offset;
		
		[mutableAttributedString replaceCharactersInRange:charactersRange withAttributedString:attributedStringWithImage];
		
		offset += result.range.length -1;
	}
	return [[NSAttributedString alloc] initWithAttributedString:mutableAttributedString];
}

@end
