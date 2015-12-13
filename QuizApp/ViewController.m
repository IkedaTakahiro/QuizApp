//
//  ViewController.m
//  QuizApp
//
//  Created by 池田享浩 on 2015/12/10.
//  Copyright (c) 2015年 takahiro ikeda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSInteger count;//問題数管理
    NSInteger tensuu;//点数管理
    NSInteger bousi;//ボタン動作管理
    UITextView *mondai;
    UITextView *kaisetu2;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    count = 1;
    [self setinitialize];
    }

//初期化　初期画面
-(void)setinitialize{
    tensuu = 0;
    bousi = 0;
    self.kekka.text = nil;
    //self.kaisetu.text = nil;
    self.questionNo.text = @"第1問";
    //self.mondai.text = @"test";
    //self.mondai.editable = NO;
    
    mondai = [[UITextView alloc] initWithFrame:CGRectMake(30,90,250,150)];
    mondai.text = @"ルフィに麦わら帽子をくれたのは、四皇のひとり「シャンクス」である。";
    mondai.font = [UIFont systemFontOfSize:12.0];
    mondai.backgroundColor = [UIColor whiteColor];
    mondai.editable = NO;
    [self.view addSubview:mondai];
    
    kaisetu2 = [[UITextView alloc] initWithFrame:CGRectMake(193,385,100,45)];
    kaisetu2.font = [UIFont systemFontOfSize:12.0];
    kaisetu2.backgroundColor = [UIColor clearColor];
    kaisetu2.editable = NO;
    [self.view addSubview:kaisetu2];
}

//まるボタンの処理
-(IBAction)mbutton:(id)sender{
    if(bousi == 0){
    bousi++;
    }
    if (bousi == 1) {
        
    switch(count){
        case 1:
            [self seikai];
            tensuu++;
            bousi = 2;
            break;
        case 2:
            [self huseikai];
            bousi = 2;
            break;
        case 3:
            [self seikai];
            tensuu++;
            bousi = 2;
            break;
        case 4:
            [self seikai];
            tensuu++;
            bousi = 2;
            break;
        case 5:
            [self huseikai];
            bousi = 2;
            break;
        default:
            break;
    }
        
    }
}

//ばつボタンの処理
-(IBAction)bbutton:(id)sender{
    if(bousi == 0){
    bousi++;
    }
    if(bousi == 1){
    switch(count){
        case 1:
            [self huseikai];
            bousi = 2;
            break;
        case 2:
            [self seikai];
            tensuu++;
            bousi = 2;
            break;
        case 3:
            [self huseikai];
            bousi = 2;
            break;
        case 4:
            [self huseikai];
            bousi = 2;
            break;
        case 5:
            [self seikai];
            tensuu++;
            bousi = 2;
            break;
        default:
            break;
    }
    }
}

//nextボタンの処理
-(IBAction)nextbutton:(id)sender{
    
    if (bousi == 2){
    count++;
    }
    
    if(count == 8){
        count = 1;
        [self setinitialize];
    }
    
    if(count == 7){
        self.questionNo.text = nil;
        mondai.text = @"おつかされまです。終了です。もう一度はじめからできます。";
    }
    
   if(count == 6) {
        self.questionNo.text= @"成績発表！！";
        NSString *kekkahappyou = [NSString stringWithFormat:@"第5問中%ld問正解",(long)tensuu];
        mondai.text = kekkahappyou;
        self.backgroundImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"default.png"]];
    } else if(count <=5 ){
    bousi =0;
    NSString *mondaititle = [NSString stringWithFormat:@"第%ld問",(long)count];
    self.questionNo.text= mondaititle;
    self.backgroundImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"default.png"]];
    }
    self.kekka.text = nil;
    kaisetu2.text =nil;
    [self nakami];
    
}

//正解の場合の表示
-(void)seikai{
     self.backgroundImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"seikai.png"]];
     self.kekka.text =@"正解!";
    kaisetu2.text = @"次の問題へ!";
}

//不正解の場合の表示
-(void)huseikai{
     self.backgroundImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"huseikai.png"]];
     self.kekka.text = @"残念!";
     switch(count){
          case 1:
             kaisetu2.text = @"次こそ正解!";
            break;
         case 2:
             kaisetu2.text = @"3000万ベリーです。";
             break;
         case 3:
             kaisetu2.text = @"次こそ正解!";
             break;
         case 4:
             kaisetu2.text = @"次こそ正解!";
             break;
         case 5:
             kaisetu2.text = @"5月５日です。";
             break;
        default:
             break;
    }
}

//問題文第２問目から５問目
-(void)nakami{
    switch(count){
        case 2:
            mondai.text = @"ルフィの最初の懸賞金は、２０００万ベリーである。";
            break;
        case 3:
            mondai.text = @"ルフィの食べた悪魔の実は、ゴムゴムの実である。";
            break;
        case 4:
            mondai.text = @"ルフィの父親は、ドラゴンである。";
            break;
        case 5:
            mondai.text = @"ルフィの誕生日は、7月7日である。";
            break;
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
