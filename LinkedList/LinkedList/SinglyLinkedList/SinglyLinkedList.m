//
//  SinglyLinkedList.m
//  LinkedList
//
//  Created by huangjian on 2019/3/14.
//  Copyright © 2019年 huangjian. All rights reserved.
//

#import "SinglyLinkedList.h"

@implementation SinglyLinkedListNode
+(SinglyLinkedListNode *)nodeWithKey:(NSString *)key value:(NSString *)value
{
    SinglyLinkedListNode *node=[[SinglyLinkedListNode alloc]init];
    node.key=key;
    node.value=value;
    return node;
}

-(id)copyWithZone:(NSZone *)zone
{
    SinglyLinkedListNode *node=[[SinglyLinkedListNode allocWithZone:zone]init];
    node.key=self.key;
    node.value=self.value;
    node.nextNode=self.nextNode;
    return node;
}
@end

@interface SinglyLinkedList ()
@property(nonatomic,strong)SinglyLinkedListNode *headNode;
@property(nonatomic,strong)NSMutableDictionary *nodeDict;
@end
@implementation SinglyLinkedList
-(NSMutableDictionary *)nodeDict
{
    if (!_nodeDict) {
        _nodeDict=[NSMutableDictionary  dictionary];
    }
    return _nodeDict;
}

-(void)insertNode:(SinglyLinkedListNode *)node
{
    if (!node||!node.key||node.key.length==0) {
        return;
    }
    if ([self isExistsWith:node]) {
        return;
    }
    [self.nodeDict setObject:node forKey:node.key];
    if (!_headNode) {
        _headNode=node;
        return ;
    }
    SinglyLinkedListNode *last=[self getLastNode];
    last.nextNode=node;
}
-(void)insertNodeAtHead:(SinglyLinkedListNode *)node
{
    if (!node||node.key.length==0) {
        return;
    }
    if ([self isExistsWith:node]) {
        return;
    }
    [self.nodeDict setObject:node forKey:node.key];
    if (_headNode) {
        node.nextNode=_headNode;
        _headNode=node;
    }else
    {
        _headNode=node;
    }
}
- (void)insertNodeBeforeNodeForKey:(NSString *)key withNew:(SinglyLinkedListNode *)newNode
{
    if (!newNode||newNode.key.length==0||key.length==0) {
        return;
    }
    if ([self isExistsWith:newNode]) {
        return;
    }
    SinglyLinkedListNode *node=[self.nodeDict objectForKey:key];
    if (node) {
        [self.nodeDict setObject:newNode forKey:newNode.key];
        SinglyLinkedListNode *beforeNode=[self getNodeBeforeNode:node];
        if (beforeNode) {
            newNode.nextNode=node;
            beforeNode.nextNode=newNode;
        }else
        {
            newNode.nextNode=node;
            self.headNode = newNode;
        }
    }
}
- (void)insertNodeAfterNodeForKey:(NSString *)key withNew:(SinglyLinkedListNode *)newNode
{
    if (!newNode||newNode.key.length==0||key.length==0) {
        return;
    }
    if ([self isExistsWith:newNode]) {
        return;
    }
    SinglyLinkedListNode *node=[self.nodeDict objectForKey:key];
    if (node) {
        [self.nodeDict setObject:newNode forKey:newNode.key];
        newNode.nextNode=node.nextNode;
        node.nextNode=newNode;
    }
}

-(void)bringNodeToHead:(SinglyLinkedListNode *)node
{
    if (![self isExistsWith:node]) {
        return;
    }
    if ([node isEqual:self.headNode]) {
        return;
    }
    SinglyLinkedListNode *beforeNode = [self getNodeBeforeNode:node];
    beforeNode.nextNode=node.nextNode;
    node.nextNode=self.headNode;
    self.headNode=node;
}

-(void)removeNode:(SinglyLinkedListNode *)node
{
    if (![self isExistsWith:node]) {
        return;
    }
    [self.nodeDict removeObjectForKey:node.key];
    SinglyLinkedListNode *beforeNode = [self getNodeBeforeNode:node];
    if (node.nextNode) {
        if (beforeNode) {
            beforeNode.nextNode=node.nextNode;
        }else
        {
            self.headNode=node.nextNode;
        }
    }else
    {
        if (beforeNode) {
            beforeNode.nextNode=node.nextNode;
        }else
        {
            self.headNode=node.nextNode;
        }
    }
}

//根据key获取node
-(SinglyLinkedListNode *)getNodeForKey:(NSString *)key
{
    if (!key) {
        return nil;
    }
    SinglyLinkedListNode *node=[self.nodeDict objectForKey:key];
    
    return node;
}

//获取头节点
-(SinglyLinkedListNode *)getHeadNode
{
    
    return _headNode;
}
//获取长度
-(NSInteger)getLength
{
    SinglyLinkedListNode *no = _headNode;
    NSInteger count=_headNode?1:0;
    while (no) {
        if (no.nextNode) {
            no=no.nextNode;
            count++;
        }else
        {
            no=nil;
        }
    }
    return count;
}
-(BOOL)isEmpty
{
    return _headNode==nil;
}

//反转
- (void)reverse
{
    SinglyLinkedListNode *prev = nil;
    SinglyLinkedListNode *current = _headNode;
    SinglyLinkedListNode *next = nil;
    
    while (current) {
        next = current.nextNode;
        current.nextNode = prev;
        prev = current;
        current = next;
    }
    _headNode = prev;
}

//读取所有的节点
- (void)readAllNode
{
    SinglyLinkedListNode *node = _headNode;
    while (node) {
        NSLog(@"-- key -- %@, value -- %@", node.key, node.value);
        node = node.nextNode;
    }
    NSLog(@"\r\n================================================================================\r\n");
}

//获取某节点的前一个节点
-(SinglyLinkedListNode *)getNodeBeforeNode:(SinglyLinkedListNode*)node
{
    SinglyLinkedListNode *beforeNode = nil;
    SinglyLinkedListNode *no = _headNode;
    while (no) {
        if ([no.nextNode isEqual:node]) {
            beforeNode = no;
            break;
        } else {
            no = no.nextNode;
        }
    }
    return beforeNode;
}

//获取最后一个节点
-(SinglyLinkedListNode *)getLastNode
{
    SinglyLinkedListNode *node = _headNode;
    while (node.nextNode) {
        node = node.nextNode;
    }
    return node;
}
//节点是否存在
-(BOOL)isExistsWith:(SinglyLinkedListNode *)node
{
    SinglyLinkedListNode *no=self.headNode;
    while (no) {
        if ([no isEqual:node]) {
            return YES;
        }
        no = no.nextNode;
    }
    return NO;
}
@end
