//
//  RDetailViewController.m
//  OneApp
//
//  Created by lijunjie on 30/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "RDetailViewController.h"
#import "BImageStore.h"
@interface RDetailViewController () <UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate
,UIPopoverControllerDelegate>
@property (strong,nonatomic) UIPopoverController *imagePickerPopover;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateField;
@property (weak, nonatomic) IBOutlet UIImageView *aImageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

@implementation RDetailViewController

#pragma mark init

-(id) init {
    self = [super init];
    if(self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"DetailView";
    }
    
    return self;
}


-(id) initForNewItem:(BOOL) isNew
{
    self = [super initWithNibName:nil bundle:nil];
    if(self) {
        if(isNew) {
            UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(save:)];
            self.navigationItem.rightBarButtonItem = doneItem;
            UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
            
            self.navigationItem.leftBarButtonItem = cancelItem;
        }
    }
    
    return self;
}

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    @throw [NSException exceptionWithName:@"Wrong init method" reason:@"Use initForNewItem" userInfo:nil];
    return nil;
}
#pragma mark action


- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.delegate = self;
    
    
    if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ) {
        self.imagePickerPopover = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
        self.imagePickerPopover.delegate = self;
        
        [self.imagePickerPopover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }else {
        [self presentViewController:imagePicker  animated:YES completion:nil];

    }
}

-(void) popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
    self.imagePickerPopover = nil;
    
    
}

- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    [textField becomeFirstResponder];
    return YES;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    self.aImageView.image = image;
    [[BImageStore sharedStore] setImage:image forKey:self.item.itemKey];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark handle by myself

-(void) save:(id) sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

-(void) cancel:(id) sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


#pragma view show
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *iv = [[UIImageView alloc] initWithImage:nil];
    
    iv.contentMode = UIViewContentModeScaleAspectFit;
    
    iv.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:iv];
    
    self.aImageView = iv;
    
    NSDictionary *nameMap=@{@"imageView":self.aImageView,
                            @"dataLabel":self.dateField,
                            @"toolbar":self.toolbar
                            };
    
    NSArray *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imageView]-0-|" options:0 metrics:nil views:nameMap];

    NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[dataLabel]-[imageView]-[toolbar]" options:0 metrics:nil views:nameMap];
    
    [ self.view addConstraints:hConstraints ];
    [ self.view addConstraints:vConstraints];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    RItem *item = self.item;
    self.nameField.text = item._itemName;
    self.serialField.text = item._serialNumber;
    self.valueField.text = [ NSString stringWithFormat:@"%d",item._valueInDollars];
    UIImage *image = [[ BImageStore sharedStore] imageForKey:item.itemKey];
    if(image) {
        self.aImageView.image = image;
    }
    
    [self updateFonts];
    
    
    
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
    RItem *item = self.item;
    item._itemName = self.nameField.text;
    item._serialNumber = self.serialField.text;
    item._valueInDollars = [self.valueField.text intValue];
    
    
}

# pragma mark - font

-(void) updateFonts {
    UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.nameField.font = font;
    self.serialField.font = font;
    self.valueField.font = font;
    self.dateField.font =font;
    self.nameField.font=font;
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
