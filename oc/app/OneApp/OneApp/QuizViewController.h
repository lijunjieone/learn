//
//  QuizViewController.h
//  OneApp
//
//  Created by lijunjie on 29/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic,copy) NSArray *questions;
@property (nonatomic,copy) NSArray *answers;

@property (nonatomic,weak) IBOutlet UILabel *questionLabel;
@property (nonatomic,weak) IBOutlet UILabel *answerLabel;


@end
