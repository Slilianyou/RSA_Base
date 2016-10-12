//
//  ViewController.m
//  RSA_Base
//
//  Created by ss-iOS-LLY on 16/10/11.
//  Copyright © 2016年 Paiwogou@syscanit.com. All rights reserved.
//

#import "ViewController.h"
//#import <Security/Security.h>
#import "RSAEncryptor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加密数据
    RSAEncryptor * rsa = [[RSAEncryptor alloc]init];
    NSLog(@"encryptor using rsa");
    NSString *publicKeyPath = [[NSBundle mainBundle]pathForResource:@"public_key" ofType:@"der"];
    NSLog(@"piblic key:%@",publicKeyPath);
    
    [rsa loadPublicKeyFromFile:publicKeyPath];
    
    NSString *securityText = @"hello ~";
    NSString *encryptedString = [rsa rsaEncryptString:securityText];
    NSLog(@"encrypted data:%@",encryptedString);
    //L2ijuloVZ78m9TMFT6WyyZyAc2OihsApm4KF2Z6Z/U9gH7bkmiqLCUGlU4WY8VpukDV+HhGeXGFMMYv85MORPqvXG6DD4R9eOlJkWbBXwxM1UDy1cJsps1wNfIGXc5BTRwdWgh99ewpkznUw4rX1Fq/uV7x2NcUNxm+EGQn9VWU=
    
    // 解密数据
    NSLog(@"decryptor using rsa");
    [rsa loadPrivateKeyFromFile:[[NSBundle mainBundle]pathForResource:@"private_key" ofType:@"p12"] password:@"lly4486"];
    NSString *decryptedString = [rsa rsaDecryptString:encryptedString];
    NSLog(@"decrypted data: %@",decryptedString);
     
}































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
