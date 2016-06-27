//
//  Message.h
//  Pods
//
//  Created by Andrew Chung on 6/2/16.
//
//

#import <SKYKit/SKYKit.h>
#import "SKYChatRecord.h"

@class SKYMetadata;

@interface SKYMessage : SKYChatRecord

@property (strong, nonatomic)NSString* conversationId;
@property (strong, nonatomic)NSString* body;
@property (strong, nonatomic)NSDictionary* metadata;
@property (strong, nonatomic)NSDate* createdAt;

- (id)init;
- (NSInteger)getMsgType;
- (NSString *)getAssetRecordIDForImage;
- (NSString *)getAssetRecordIDForVoice;

@end
