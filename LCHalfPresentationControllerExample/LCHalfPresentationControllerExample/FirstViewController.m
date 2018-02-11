//
//  ViewController.m
//  LCHalfPresentationControllerExample
//
//  Created by lc-macbook pro on 2018/2/11.
//  Copyright © 2018年 http://www.cnblogs.com/saytome/. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "LCCustomPresentationController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonAction:(UIButton*)sender
{
    UIViewController *secondViewController = [[SecondViewController alloc]init];
    
    UINavigationController *secondNav = [[UINavigationController alloc]initWithRootViewController:secondViewController];
    
    // For presentations which will use a custom presentation controller,
    // it is possible for that presentation controller to also be the
    // transitioningDelegate.  This avoids introducing another object
    // or implementing <UIViewControllerTransitioningDelegate> in the
    // source view controller.
    //
    // transitioningDelegate does not hold a strong reference to its
    // destination object.  To prevent presentationController from being
    // released prior to calling -presentViewController:animated:completion:
    // the NS_VALID_UNTIL_END_OF_SCOPE attribute is appended to the declaration.
    LCCustomPresentationController *presentationController NS_VALID_UNTIL_END_OF_SCOPE;
    
    presentationController = [[LCCustomPresentationController alloc] initWithPresentedViewController:secondNav presentingViewController:self];
    
    secondNav.transitioningDelegate = presentationController;
    
    [self presentViewController:secondNav animated:YES completion:NULL];
}


@end
