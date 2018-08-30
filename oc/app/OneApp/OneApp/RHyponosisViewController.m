//
//  RHyponosisViewController.m
//  OneApp
//
//  Created by lijunjie on 29/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "RHyponosisViewController.h"
#import "RHypnosisView.h"

@interface RHyponosisViewController () <UITextFieldDelegate>

@end

@implementation RHyponosisViewController

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.tabBarItem.title = @"Hypnotize";
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",@"RHyponosisView view show");

    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@",@"RHyponosisView view appear");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadView
{
    RHypnosisView *backgroundView = [[RHypnosisView alloc] init];
    
    CGRect textFieldRect = CGRectMake(40,70,240,30);
    UITextField *textField = [[UITextField alloc ] initWithFrame:textFieldRect ];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    
    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    self.view = backgroundView;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    NSLog(@"%@",@"click return key");
    [self drawHypnoticMessage:textField.text];
    textField.text=@"";
    [textField resignFirstResponder];
    
    return YES;
}

- (void) drawHypnoticMessage:(NSString *) message {
    for(int i=0;i<20;i++) {
        UILabel *messageLabel = [[ UILabel alloc ] init];
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor blueColor];
        messageLabel.text = message;
        
        [messageLabel sizeToFit];
        
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random()%width;
        
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random()%height;
    
        CGRect frame=messageLabel.frame;
        frame.origin = CGPointMake(x,y);
        messageLabel.frame = frame;
        
        [self.view addSubview:messageLabel];

    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
