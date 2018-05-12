#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define NETWORK_ERROR 10086110
@interface Fruits_Wl_Animal_Request_Plant : NSObject
+ (void)Fruits_Wl_Animal_Request_Plant:(NSString *_Nullable)url ret:(void (^_Nullable)(NSURLResponse* _Nullable response, NSData* _Nullable data, NSError* _Nullable connectionError)) handler;
+ (void)Fruits_setHttp_Animal_Headers_Plant:(NSMutableURLRequest *_Nullable*_Nullable)request;
+ (NSString *_Nullable)Fruits_Decoding_Animal_GB32_Plant:(NSData *_Nullable)data;
+ (void)Fruits_NetWork_Animal_Monitor_Plant;
@end
