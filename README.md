# AFStatHatClient

An AFHTTPClient subclass for reporting to StatHat!

## Instructions

#### Install
Available on CocoaPods, simply add to your Podfile:

```
pod "AFStatHatClient"
```

then do a 'pod install'

#### Code

EZ posting of counts and values are supported.

With returning success/failure blocks:

``` objective-c
AFStatHatClient* stathat = [[AFStatHatClient alloc] initWithEZKey:@"YOUR EZ KEY"];
[stathat postEZStat:@"Example" withCount:@1 success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"%@", responseObject);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"%@", error);
}];
```

Or simply:

``` objective-c
AFStatHatClient* stathat = [[AFStatHatClient alloc] initWithEZKey:@"YOUR EZ KEY"];
[stathat postEZStat:@"Example" withCount@1];
```

## Contact

PJ Gray

- http://github.com/pj4533
- http://twitter.com/pj4533
- pj@pj4533.com

## License

AFStatHatClient is available under the MIT license. See the LICENSE file for more info.

