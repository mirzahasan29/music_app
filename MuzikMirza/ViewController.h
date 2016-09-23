//
//  ViewController.h
//  MuzikMirza
//
//  Created by Mirza Rishad Hasan on 7/23/16.
//  Copyright © 2016 Mirza Rishad Hasan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *testImage;

@property (weak, nonatomic) IBOutlet UITextField *songText;



@property (weak, nonatomic) IBOutlet UITableView *songTable;


@property(nonatomic, strong) UITapGestureRecognizer *gesture;


@end

