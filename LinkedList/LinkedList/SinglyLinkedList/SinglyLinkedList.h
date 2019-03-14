//
//  SinglyLinkedList.h
//  LinkedList
//
//  Created by huangjian on 2019/3/14.
//  Copyright © 2019年 huangjian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SinglyLinkedListNode : NSObject<NSCopying>
@property (nonatomic,copy)NSString *key;
@property (nonatomic,copy)NSString *value;
@property(nonatomic,strong)SinglyLinkedListNode *nextNode;

+(SinglyLinkedListNode *)nodeWithKey:(NSString *)key value:(NSString *)value;
@end

@interface SinglyLinkedList : NSObject
//添加一个节点
-(void)insertNode:(SinglyLinkedListNode *)node;

//首部添加一个节点
-(void)insertNodeAtHead:(SinglyLinkedListNode *)node;

//在某一个节点前加一个节点
- (void)insertNodeBeforeNodeForKey:(NSString *)key withNew:(SinglyLinkedListNode *)newNode;

//在某一个节点后加一个节点
- (void)insertNodeAfterNodeForKey:(NSString *)key withNew:(SinglyLinkedListNode *)newNode;

//将某个节点移到首部
-(void)bringNodeToHead:(SinglyLinkedListNode *)node;

//删除某个节点
-(void)removeNode:(SinglyLinkedListNode *)node;
@end

NS_ASSUME_NONNULL_END
