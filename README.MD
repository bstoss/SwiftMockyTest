setup project made some problems ..


1. be sure having latest mac os - now 12.3
2. be sure having latest xcode - now 13.3
3. install swiftymocky Package on test Target
- https://github.com/MakeAWishFoundation/SwiftyMocky 
- Select SwiftyMocky Package and Target Unit Tests
4. install CLI
> brew install mint
> mint install MakeAWishFoundation/SwiftyMocky
> mint install krzysztofzablocki/Sourcery@1.8.0
5. now do `swiftymocky init` in project folder
6. open generated Mockfile and replac after sourceryCommand: 
- null -> mint run krzysztofzablocki/Sourcery@1.8.0 sourcery
7. now run `swiftymocky setup`
8. now run `swiftymocky generate`
9. Move Mock.generated.swift file to project test area
10. Import SwiftyMocky in Testfile to use its functions