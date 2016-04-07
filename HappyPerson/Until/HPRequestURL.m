//
//  HPRequestURL.m
//  HappyPerson
//
//  Created by wei on 15/11/20.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "HPRequestURL.h"

@implementation HPRequestURL

+(HPRequestURL *)sharedInstance
{
    static HPRequestURL *hprequestURLInstance;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        hprequestURLInstance = [[HPRequestURL alloc] init];
    });
    
    return hprequestURLInstance;
}

-(NSString *)famousProductURL
{
    return @"http://api.meituan.com/group/v1/deal/activity/1?__skck=40aaaf01c2fc4801b9c059efcd7aa146&__skcy=eyRlEd1JEIirIhkqnwSxnrTw9YU%3D&__skno=267880FF-0CF9-4F68-9F0F-B483D3A6AFFE&__skts=1447913678.631224&__skua=0029e6311bdd6535c4abcb50ace7c646&__vhost=api.mobile.meituan.com&ci=1&client=iphone&movieBundleVersion=100&msid=DE83CFCE-4BD9-4F7F-947E-45E90AD5B5E62015-11-19-14-14850&ptId=iphone_5.7.1&utm_campaign=AgroupBgroupFab_mingdiangexinghua0707__b__b___ab_dealzhanshi__c__c1___ab_i550poi_xxyl__b__b___ab_gxhceshi__nostrategy__leftflow___ab_pindao_xiuxianyule0920__b__b___ab_gxtest__gd__leftflow___ab_waimaiwending__b__b___ab_pindaochangsha__a__leftflow___ab_gxh_82__nostrategy__leftflow___ab_pindaoqugexinghua0708__i__i___ab_groupcontext__b__b___i_group_5_2_deallist_poitype__d__d___ab_pindaoshenyang__a__leftflow___ab_homemodlelisttest0822__c__c2___ab_i550poi_lr__d__e___a20141120nanning__m1__leftflow___b1junglehomepagecatesort__b__leftflow___ab_chunceshishuju__b__b&utm_content=669CC3A2F0D4F6377A178123801080BC12F78D9446479D73A850D9BA2BE1EDE7&utm_medium=iphone&utm_source=AppStore&utm_term=5.7.1&uuid=669CC3A2F0D4F6377A178123801080BC12F78D9446479D73A850D9BA2BE1EDE7&version_name=5.7.1";
}

-(NSString *)userNewPreferenceURL
{
    return @"http://api.meituan.com/group/v1/deal/topic/discount/city/1?__skck=40aaaf01c2fc4801b9c059efcd7aa146&__skcy=26dqFzZKhTy3wO%2B5X9Nv5XXIi9A%3D&__skno=65A52339-88AC-428F-A094-0EEF04A02F97&__skts=1447913679.973996&__skua=0029e6311bdd6535c4abcb50ace7c646&__vhost=api.mobile.meituan.com&ci=1&client=iphone&movieBundleVersion=100&msid=DE83CFCE-4BD9-4F7F-947E-45E90AD5B5E62015-11-19-14-14850&utm_campaign=AgroupBgroupFab_mingdiangexinghua0707__b__b___ab_dealzhanshi__c__c1___ab_i550poi_xxyl__b__b___ab_gxhceshi__nostrategy__leftflow___ab_pindao_xiuxianyule0920__b__b___ab_gxtest__gd__leftflow___ab_waimaiwending__b__b___ab_pindaochangsha__a__leftflow___ab_gxh_82__nostrategy__leftflow___ab_pindaoqugexinghua0708__i__i___ab_groupcontext__b__b___i_group_5_2_deallist_poitype__d__d___ab_pindaoshenyang__a__leftflow___ab_homemodlelisttest0822__c__c2___ab_i550poi_lr__d__e___a20141120nanning__m1__leftflow___b1junglehomepagecatesort__b__leftflow___ab_chunceshishuju__b__b&utm_content=669CC3A2F0D4F6377A178123801080BC12F78D9446479D73A850D9BA2BE1EDE7&utm_medium=iphone&utm_source=AppStore&utm_term=5.7.1&uuid=669CC3A2F0D4F6377A178123801080BC12F78D9446479D73A850D9BA2BE1EDE7&version_name=5.7.1";
}

-(NSString *)fanLifeURL
{
    return @"http://api.meituan.com/group/v1/deal/topic/elaborate/city/1?__skck=40aaaf01c2fc4801b9c059efcd7aa146&__skcy=e5n8PcrIcfNRpiWWW6TWCdt7k9w%3D&__skno=ACFCFBBF-6903-4F23-AA5C-12892BDA113B&__skts=1447913679.984198&__skua=0029e6311bdd6535c4abcb50ace7c646&__vhost=api.mobile.meituan.com&ci=1&client=iphone&movieBundleVersion=100&msid=DE83CFCE-4BD9-4F7F-947E-45E90AD5B5E62015-11-19-14-14850&utm_campaign=AgroupBgroupFab_mingdiangexinghua0707__b__b___ab_dealzhanshi__c__c1___ab_i550poi_xxyl__b__b___ab_gxhceshi__nostrategy__leftflow___ab_pindao_xiuxianyule0920__b__b___ab_gxtest__gd__leftflow___ab_waimaiwending__b__b___ab_pindaochangsha__a__leftflow___ab_gxh_82__nostrategy__leftflow___ab_pindaoqugexinghua0708__i__i___ab_groupcontext__b__b___i_group_5_2_deallist_poitype__d__d___ab_pindaoshenyang__a__leftflow___ab_homemodlelisttest0822__c__c2___ab_i550poi_lr__d__e___a20141120nanning__m1__leftflow___b1junglehomepagecatesort__b__leftflow___ab_chunceshishuju__b__b&utm_content=669CC3A2F0D4F6377A178123801080BC12F78D9446479D73A850D9BA2BE1EDE7&utm_medium=iphone&utm_source=AppStore&utm_term=5.7.1&uuid=669CC3A2F0D4F6377A178123801080BC12F78D9446479D73A850D9BA2BE1EDE7&version_name=5.7.1";
}

-(NSString *)performanceURL
{
    return @"http://api.meituan.com/group/v1/deal/topic/beautiful/city/1?__skck=40aaaf01c2fc4801b9c059efcd7aa146&__skcy=Ceupa2g8QdHRjkBe3Y56ux6rj9c%3D&__skno=9CCBF24B-010D-4765-BF00-1337ED587338&__skts=1447913680.167001&__skua=0029e6311bdd6535c4abcb50ace7c646&__vhost=api.mobile.meituan.com&ci=1&client=iphone&movieBundleVersion=100&msid=DE83CFCE-4BD9-4F7F-947E-45E90AD5B5E62015-11-19-14-14850&utm_campaign=AgroupBgroupFab_mingdiangexinghua0707__b__b___ab_dealzhanshi__c__c1___ab_i550poi_xxyl__b__b___ab_gxhceshi__nostrategy__leftflow___ab_pindao_xiuxianyule0920__b__b___ab_gxtest__gd__leftflow___ab_waimaiwending__b__b___ab_pindaochangsha__a__leftflow___ab_gxh_82__nostrategy__leftflow___ab_pindaoqugexinghua0708__i__i___ab_groupcontext__b__b___i_group_5_2_deallist_poitype__d__d___ab_pindaoshenyang__a__leftflow___ab_homemodlelisttest0822__c__c2___ab_i550poi_lr__d__e___a20141120nanning__m1__leftflow___b1junglehomepagecatesort__b__leftflow___ab_chunceshishuju__b__b&utm_content=669CC3A2F0D4F6377A178123801080BC12F78D9446479D73A850D9BA2BE1EDE7&utm_medium=iphone&utm_source=AppStore&utm_term=5.7.1&uuid=669CC3A2F0D4F6377A178123801080BC12F78D9446479D73A850D9BA2BE1EDE7&version_name=5.7.1";
}

-(NSString *)hotLineUpURL
{
    return @"http://api.meituan.com/group/v1/itemportal/position/39.931619,116.443821?__skck=40aaaf01c2fc4801b9c059efcd7aa146&__skcy=pQtHKv42U3DQdHfnMcOa3fJYQY4%3D&__skno=910DB408-BFAA-4D0D-AFD4-F7A287A1CCC8&__skts=1447917044.365392&__skua=0029e6311bdd6535c4abcb50ace7c646&__vhost=api.mobile.meituan.com&ci=1&cityId=1&client=iphone&movieBundleVersion=100&msid=DE83CFCE-4BD9-4F7F-947E-45E90AD5B5E62015-11-19-14-14850&utm_campaign=AgroupBgroupFab_mingdiangexinghua0707__b__b___ab_dealzhanshi__c__c1___ab_i550poi_xxyl__b__b___ab_gxhceshi__nostrategy__leftflow___ab_pindao_xiuxianyule0920__b__b___ab_i550poi_shfw__b__b___ab_gxtest__gd__leftflow___ab_waimaiwending__b__b___ab_pindaochangsha__a__leftflow___ab_gxh_82__nostrategy__leftflow___ab_pindaoqugexinghua0708__i__i___ab_groupcontext__b__b___i_group_5_2_deallist_poitype__d__d___ab_pindaoshenyang__a__leftflow___ab_homemodlelisttest0822__c__c2___ab_i550poi_lr__d__e___a20141120nanning__m1__leftflow___b1junglehomepagecatesort__b__leftflow___ab_chunceshishuju__b__b&utm_content=669CC3A2F0D4F6377A178123801080BC12F78D9446479D73A850D9BA2BE1EDE7&utm_medium=iphone&utm_source=AppStore&utm_term=5.7.1&uuid=669CC3A2F0D4F6377A178123801080BC12F78D9446479D73A850D9BA2BE1EDE7&version_name=5.7.1";
}

-(NSString *)recommandURL
{
    return @"http://api.meituan.com/group/v1/recommend/homepage/city/1?__skck=40aaaf01c2fc4801b9c059efcd7aa146&__skcy=GmxelO%2FZzUF8uYRCKKVbEXtylM4%3D&__skno=F6948306-5696-4BAE-8B76-EB204F95AD40&__skts=1447986682.942768&__skua=0029e6311bdd6535c4abcb50ace7c646&__vhost=api.mobile.meituan.com&ci=1&client=iphone&limit=40&movieBundleVersion=100&msid=DE83CFCE-4BD9-4F7F-947E-45E90AD5B5E62015-11-20-10-23289&offset=0&position=40.083495%2C116.369017&utm_campaign=AgroupBgroupFab_mingdiangexinghua0707__b__b___ab_dealzhanshi__c__c1___ab_i550poi_xxyl__b__b___ab_gxhceshi__nostrategy__leftflow___ab_pindao_xiuxianyule0920__b__b___ab_i550poi_shfw__b__b___ab_gxtest__gd__leftflow___ab_waimaiwending__b__b___ab_pindaochangsha__a__leftflow___ab_gxh_82__nostrategy__leftflow___ab_pindaoqugexinghua0708__i__i___ab_groupcontext__b__b___i_group_5_2_deallist_poitype__d__d___ab_pindaoshenyang__a__leftflow___ab_homemodlelisttest0822__c__c2___ab_i550poi_lr__d__e___a20141120nanning__m1__leftflow___b1junglehomepagecatesort__b__leftflow___ab_chunceshishuju__b__b&utm_content=669CC3A2F0D4F6377A178123801080BC12F78D9446479D73A850D9BA2BE1EDE7&utm_medium=iphone&utm_source=AppStore&utm_term=5.7.1&uuid=669CC3A2F0D4F6377A178123801080BC12F78D9446479D73A850D9BA2BE1EDE7&version_name=5.7.1";
}


@end
