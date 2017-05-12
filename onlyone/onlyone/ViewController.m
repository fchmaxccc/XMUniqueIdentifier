//
//  ViewController.m
//  onlyone
//
//  Created by xuming on 12/9/15.
//  Copyright © 2015 xuming. All rights reserved.
//

#import "ViewController.h"
#import "KeychainItemWrapper.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setKeyChainValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
-(void) setKeyChainValue
{
    KeychainItemWrapper *keyChainItem=[[KeychainItemWrapper alloc]initWithIdentifier:@"TestUUID" accessGroup:@"UWZY89M5DZ.com.nationsky.onlyone"];
    NSString *strUUID = [keyChainItem objectForKey:(id)kSecValueData];
    if (strUUID==nil||[strUUID isEqualToString:@""])
    {
        NSString * aa = [self gen_uuid];
//        B9EA712E-200B-47A0-AB8A-26916DB0D8FE
        [keyChainItem setObject:aa forKey:(id)kSecValueData];
    }
    
}

-(NSString *) gen_uuid
{
    CFUUIDRef uuid_ref=CFUUIDCreate(nil);
    CFStringRef uuid_string_ref=CFUUIDCreateString(nil, uuid_ref);
    CFRelease(uuid_ref);
    NSString *uuid=[NSString stringWithString:(__bridge NSString * _Nonnull)(uuid_string_ref)];
    CFRelease(uuid_string_ref);
    return uuid;
}
@end
