//
//  StoryTypeVC.m
//  HengStars
//
//  Created by hengfu on 16/5/23.
//  Copyright © 2016年 hengfu. All rights reserved.
//

#import "StoryTypeVC.h"
#import "HXPageControlView.h"
#import "StoryVC.h"
#import "UIColor+CreateImage.h"

@interface StoryTypeVC ()
@property(nonatomic, strong)HXPageControlView *titlePageControl;
@end

@implementation StoryTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setNavigationBar];
    self.title = @"恒星故事";
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //创建两个tableview
    //1、pageContolView
    //2、创建导航条视图
    [self creatNigationItemView];
    //3、创建手势
    UISwipeGestureRecognizer *leftGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipToLeftDirection:)];
    leftGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftGestureRecognizer];
    
    UISwipeGestureRecognizer *rightGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipToRightDirection:)];
    rightGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightGestureRecognizer];
    //4、添加子控制前
    [self createSubControllers];
    //5、子控制器和pegeControlView联动
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc
{
    self.titlePageControl = nil;
}


- (void)createSubControllers
{
    CGRect commonFrame = self.view.frame;
    
    //commonFrame.size.height = commonFrame.size.height - commonFrame.origin.y;
    CGFloat centerY = commonFrame.size.height/2+commonFrame.origin.y;
    
    StoryVC *focusedListController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"StoryVC"];

    //focusedListController.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:focusedListController];
    
    focusedListController.view.frame = commonFrame;
    
    [self.view addSubview:focusedListController.view];
    //第一个控制器的数据在初始化的时候加载
    //[focusedListController loadAllData:nil fromServer:nil];
    
    //    focusedListController.loadSeverDataCompletionHandler = ^(NSArray *data, BOOL haveNextPage,NSError *error)
    //    {
    //        if (!error) {
    //            [self showTipLableFromTopWithTitle:@"数据已更新"];
    //        }
    //    };
    
    StoryVC *followingPostListController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"StoryVC"];
    //HXTableViewController *followingPostListController = [[HXTableViewController alloc] init];
    //followingPostListController.view.backgroundColor = [UIColor grayColor];
    [self addChildViewController:followingPostListController];
    followingPostListController.view.frame = commonFrame;
    //followingPostListController.scrollViewDelegate = self;
    followingPostListController.view.center = CGPointMake(commonFrame.size.width * 3 / 2, centerY);
    [self transitionViewControllers];
}

-(void) creatNigationItemView
{
    HXPageControlView *titlePageControl = [[HXPageControlView alloc] initWithFrame:CGRectMake(0, 0, 180, 25) itemTitles:[NSArray arrayWithObjects:@"恒星播报",@"星语星声", nil] currentPage:0];
    titlePageControl.currentPage = 0;
    titlePageControl.selectedColor = [UIColor whiteColor];
    titlePageControl.unselectedColor = [UIColor blackColor];
    [titlePageControl setItemImages:[NSArray arrayWithObjects:[UIImage imageNamed:@"gushi_left"],[UIImage imageNamed:@"gushi_right"], nil]];
    __weak StoryTypeVC *weaklSelf = self;
    titlePageControl.didSelectedAtIndexBlock = ^(NSInteger index){
        
        //选择了做想要处理
        [weaklSelf transitionViewControllers];
    };
    [self.navigationItem setTitleView:titlePageControl];
    self.titlePageControl = titlePageControl;
    
}

#pragma mark - 视图切换逻辑

- (void)swipToLeftDirection:(UISwipeGestureRecognizer *)swip
{
    if (self.titlePageControl.currentPage < 1) {
        self.titlePageControl.currentPage += 1;
        [self transitionViewControllers];
    }
}

- (void)swipToRightDirection:(UISwipeGestureRecognizer *)swip
{
    if (self.titlePageControl.currentPage > 0) {
        self.titlePageControl.currentPage -= 1;
        [self transitionViewControllers];
    }
}
- (void)transitionViewControllers
{
    NSInteger currentPage = self.titlePageControl.currentPage;
    NSLog(@"currentPage:%ld",(long)currentPage);
    
    //    UIViewController *requestViewController = self.childViewControllers[currentPage];
    //    UIViewController *focusedTableController = self.childViewControllers[0];
    //UMComFeedTableViewController *recommentTableController = self.childViewControllers[1];
    //加载数据（切换的时候加载第二个控制器的数据）
    //    if (requestViewController.dataArray.count == 0 && requestViewController.isLoadFinish) {
    //        [requestViewController loadAllData:nil fromServer:nil];
    //    }
    [self transitionFromViewControllerAtIndex:self.titlePageControl.lastPage toViewControllerAtIndex:currentPage animations:nil completion:nil];
}


- (void)transitionFromViewControllerAtIndex:(NSInteger)fromIndex
                    toViewControllerAtIndex:(NSInteger)toIndex
                                 animations:(void (^ __nullable)(void))animations
                                 completion:(void (^ __nullable)(BOOL finished))completion
{
    [self transitionFromViewControllerAtIndex:fromIndex toViewControllerAtIndex:toIndex duration:0.25 options:UIViewAnimationOptionCurveEaseIn animations:animations completion:completion];
}

- (void)transitionFromViewControllerAtIndex:(NSInteger)fromIndex toViewControllerAtIndex:(NSInteger)toIndex duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^ __nullable)(void))animations completion:(void (^ __nullable)(BOOL finished))completion
{
    if (fromIndex >= self.childViewControllers.count || toIndex >= self.childViewControllers.count) {
        NSLog(@"index is beyond self.childViewControllers.count");
        return;
    }
    UIViewController *toViewController = self.childViewControllers[toIndex];
    CGRect currentFrame = toViewController.view.frame;
    currentFrame.size.height = self.view.frame.size.height - currentFrame.origin.y;
    if (currentFrame.size.height != toViewController.view.frame.size.height) {
        toViewController.view.frame = currentFrame;
    }
    CGPoint toCenter = toViewController.view.center;
    if (fromIndex == toIndex) {
        toCenter.x = self.view.frame.size.width/2;
        toViewController.view.center = toCenter;
        return;
    }
    if (toIndex > fromIndex) {
        if (toViewController.view.frame.origin.x <= 0) {
            toCenter.x = self.view.frame.size.width*3/2;
            toViewController.view.center = toCenter;
        }
    }else if(toIndex < fromIndex){
        if (toViewController.view.frame.origin.x >= 0) {
            toCenter.x = - self.view.frame.size.width*3/2;
            toViewController.view.center = toCenter;
        }
    }
    UIViewController *fromViewController = self.childViewControllers[fromIndex];
    __weak typeof(self) weakSelf = self;
    __block CGPoint fromCenter = fromViewController.view.center;
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:duration options:options animations:^{
        if (fromViewController == toViewController) {
            return ;
        }
        toViewController.view.center = CGPointMake(weakSelf.view.frame.size.width/2, toViewController.view.center.y);
        if (toIndex > fromIndex) {
            fromCenter.x = - weakSelf.view.frame.size.width*3/2;
        }else if(toIndex < fromIndex){
            fromCenter.x = weakSelf.view.frame.size.width*3/2;
        }
        fromViewController.view.center = fromCenter;
        if (animations) {
            animations();
        }
    } completion:completion];
}

@end
