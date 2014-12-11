#NSAttributedString-HTHMarkdown

A very simple category for adding markdown to an attributed string. Only markdown image syntax w/o tags is supported right now. Useful when you need to display an image and text inline with just one UILabel.

Example:
```
NSString *markdown = @"!(Icon Location) Berlin !(Icon Message) Message"; // 'Icon Location' is the image name in Images.xcassets
NSDictionary *textAttributes = @{ NSFontAttributeName : [UIFont systemFontOfSize:18.f]};
NSAttributedString *attributedText = [[NSAttributedString alloc] initWithMarkdown:markdown attributes:textAttributes];
```

Attributed Text in a UILabel:

![screen shot](https://cloud.githubusercontent.com/assets/773063/5390659/102b23a8-80c4-11e4-8a41-ed1062f113ee.png)
