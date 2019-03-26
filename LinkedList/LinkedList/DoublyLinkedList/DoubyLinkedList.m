//
//  DoubyLinkedList.m
//  LinkedList
//
//  Created by huangjian on 2019/3/26.
//  Copyright © 2019年 huangjian. All rights reserved.
//

#import "DoubyLinkedList.h"

@implementation DoubyLinkedListNode
+(DoubyLinkedListNode *)nodeWithKey:(NSString *)key value:(NSString *)value
{
    DoubyLinkedListNode *node=[[DoubyLinkedListNode alloc]init];
    node.key=key;
    node.value=value;
    return node;
}

-(id)copyWithZone:(NSZone *)zone
{
    DoubyLinkedListNode *node=[[DoubyLinkedListNode allocWithZone:zone]init];
    node.key=self.key;
    node.value=self.value;
    node.prevNode=self.prevNode;
    node.nextNode=self.nextNode;
    return node;
}
@end

@implementation DoubyLinkedList

@end
