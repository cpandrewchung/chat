//
//  Message.m
//  Pods
//
//  Created by Andrew Chung on 6/2/16.
//
//

#import "SKYMessage.h"
#import "SKYRecord.h"

@implementation SKYMessage

- (id)init{
    return [SKYRecord recordWithRecordType:@"message"];
}

- (void)setConversationId:(NSString *)conversationId{
    self[@"conversation_id"] = conversationId;
}

- (NSString *)conversationId{
    return self[@"conversation_id"];
}

- (void)setBody:(NSString *)body{
    self[@"body"] = body;
}

- (NSString *)body{
    return self[@"body"];
}

- (void)setMetadata:(NSDictionary *)metadata{
    self[@"metadata"] = metadata;
}

- (NSDictionary *)metadata{
    return self[@"metadata"];
}

- (NSDate *)createdAt{
    return self.creationDate;
}

- (NSInteger)getMsgType{
    if ([self.metadata valueForKey:@"message-image"] ){
        return 0;
    }
    else if([self.metadata valueForKey:@"message-voice"] ) {
        return 1;
    }
    return 2;
}

- (BOOL)hasMetaData{
    if ([self.metadata valueForKey:@"message-image"] ||[self.metadata valueForKey:@"message-voice"] ) {
        return true;
    }
    else{
        return false;
    }
}

- (NSString *)getAssetRecordIDForImage{
    NSString *recordID = @"";
    NSString *metaDataString = [self.metadata valueForKey:@"message-image"];
//    NSArray *splitString = [metaDataString componentsSeparatedByString:@"-message-image"];
//    if (splitString.count > 0) {
//        recordID = [splitString objectAtIndex:0];
//    }
    return metaDataString;
}

- (NSString *)getAssetRecordIDForVoice{
    NSString *recordID = @"";
    NSString *metaDataString = [self.metadata valueForKey:@"message-voice"];
    NSArray *splitString = [metaDataString componentsSeparatedByString:@"-message-voice"];
    if (splitString.count > 0) {
        recordID = [splitString objectAtIndex:0];
    }
    return recordID;
}

@end
