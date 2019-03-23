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
@property(nonatomic,strong,nullable)SinglyLinkedListNode *nextNode;

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

//根据key获取node
-(SinglyLinkedListNode *)getNodeForKey:(NSString *)key;

//获取头节点
-(SinglyLinkedListNode *)getHeadNode;

//获取尾节点
-(SinglyLinkedListNode *)getLastNode;

//获取长度
-(NSInteger)getLength;

//是否为空
-(BOOL)isEmpty;

//反转
- (void)reverse;

//读取所有的节点
- (void)readAllNode;
@end

NS_ASSUME_NONNULL_END
