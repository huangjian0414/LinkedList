//
//  ViewController.m
//  LinkedList
//
//  Created by huangjian on 2019/3/14.
//  Copyright © 2019年 huangjian. All rights reserved.
//

#import "ViewController.h"
#import "SinglyLinkedList/SinglyLinkedList.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //这里 没有考虑 key 相同的情况·
    
    [self  testSinglyLinkedList];
}
-(void)testSinglyLinkedList
{
    SinglyLinkedList *list=[[SinglyLinkedList alloc]init];
    [list insertNode:[SinglyLinkedListNode nodeWithKey:@"1" value:@"io1"]];
    [list insertNode:[SinglyLinkedListNode nodeWithKey:@"2" value:@"io2"]];
    [list insertNode:[SinglyLinkedListNode nodeWithKey:@"3" value:@"io3"]];
    [list insertNode:[SinglyLinkedListNode nodeWithKey:@"4" value:@"io2"]];
    [list insertNode:[SinglyLinkedListNode nodeWithKey:@"5" value:@"io3"]];
    [list readAllNode];

    [list insertNodeAtHead:[SinglyLinkedListNode nodeWithKey:@"0" value:@"io0"]];
    [list readAllNode];

    [list insertNodeBeforeNodeForKey:@"2" withNew:[SinglyLinkedListNode nodeWithKey:@"1.9" value:@"io1.9"]];
    [list readAllNode];

    [list insertNodeAfterNodeForKey:@"2" withNew:[SinglyLinkedListNode nodeWithKey:@"2.1" value:@"io2.1"]];
    [list readAllNode];

    [list bringNodeToHead:[list getNodeForKey:@"3"]];
    [list readAllNode];

    [list removeNode:[list getNodeForKey:@"1.9"]];
    [list readAllNode];
    
    [list reverse];
    [list readAllNode];
}

@end
