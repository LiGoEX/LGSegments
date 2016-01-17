# LGSegments

###简单的分段选择
点击按钮及滑动ScrollView均可以改变VC

###使用方法：

    - (void)viewDidLoad {
    [super viewDidLoad];
    //加载Segment
    [self setSegment];
    //加载ViewController
    [self addChildViewController];
    //加载ScrollView
    [self setContentScrollView];}

    -(void)setSegment {
    [self buttonList];
    //初始化
    LGSegment *segment = [[LGSegment alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - LG_scrollViewH - 50, self.view.frame.size.width, LG_segmentH)];
    segment.delegate = self;
    self.segment = segment;
    [self.view addSubview:segment];
    [self.buttonList addObject:segment.buttonList];
    self.LGLayer = segment.LGLayer;}

//加载3个ViewController

    -(void)addChildViewController{
    UIViewController * vc1 = [[UIViewController alloc]init];
    vc1.view.backgroundColor= [UIColor colorWithRed:80.0/255 green:227.0/255 blue:194.0/255 alpha:100];
    [self addChildViewController:vc1];
    UIViewController * vc2 = [[UIViewController alloc]init];
    vc2.view.backgroundColor= [UIColor colorWithRed:0.0/255 green:167.0/255 blue:210.0/255 alpha:100];
    [self addChildViewController:vc2];
    UIViewController * vc3 = [[UIViewController alloc]init];
    vc3.view.backgroundColor= [UIColor colorWithRed:249.0/255 green:123.0/255 blue:134.0/255 alpha:100];
    [self addChildViewController:vc3];}

####示例：
![image](https://github.com/LiGoEX/LGSegments/blob/master/LGSegment.gif)  
