#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(KeyGenerator, NSObject)

RCT_EXTERN_METHOD(generateSymmetricKey:(NSInteger *)size
                  withOutputEncoding:(NSString *)outputEncoding
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
