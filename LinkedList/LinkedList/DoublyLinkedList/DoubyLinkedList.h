//
//  DoubyLinkedList.h
//  LinkedList
//
//  Created by huangjian on 2019/3/26.
//  Copyright © 2019年 huangjian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DoubyLinkedListNode : NSObject<NSCopying>
@property (nonatomic,copy)NSString *key;
@property (nonatomic,copy)NSString *value;
@property(nonatomic,strong,nullable)DoubyLinkedListNode *prevNode;
@property(nonatomic,strong,nullable)DoubyLinkedListNode *nextNode;

+(DoubyLinkedListNode *)nodeWithKey:(NSString *)key value:(NSString *)value;
@end

@interface DoubyLinkedList : NSObject

@end

NS_ASSUME_NONNULL_END
