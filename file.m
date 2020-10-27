#import <Foundation/Foundation.h>

//interface
@interface fileHandleClass : NSObject
- (void)removeFile;
- (void)newFileSizeFun;
@end

// implementation of class fileHandleClass
@implementation fileHandleClass
- (void)removeFile{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager removeItemAtPath:@"demo.txt" error:NULL] == YES){
        NSLog(@"File removed");
    }else{
        NSLog(@"File not found");
    }
}
- (void)newFileSizeFun{
    // get a size of file after removing file
    unsigned long NewfileSize = [[[NSFileManager defaultManager] attributesOfItemAtPath:@"demo.txt" error:nil] fileSize];
    NSLog(@"New File size is %i", NewfileSize);
}
@end

// struct
struct File{
   NSString *fileName;
   NSString *filePath;
   NSString *fileSize;
   NSString *dateCreated;
   NSString *dateModified;
};

// main method
int main (int argc, const char * argv[])
{
    // struct File specification
    struct File fileStruct;
    fileStruct.fileName = @"File Name : demo.txt";
    fileStruct.filePath = @"\nFile Path : gdb";
    fileStruct.fileSize = @"\nFile Size : 1 KB";
    fileStruct.dateCreated = @"\nDate Created : 19-10-2020";
    fileStruct.dateModified = @"\nDate Modified : 19-10-2020";
       
    // NSAutoreleasePool
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    fileHandleClass *fileClass = [[fileHandleClass alloc]init];
    NSString *path = @"demo.txt";
    NSFileManager *manager = [NSFileManager defaultManager];
  
    // creating file named "demo.txt"
    [manager createFileAtPath:path contents:nil attributes:nil];
   
    // check wheater file Exists or not
    if([manager fileExistsAtPath:path] == NO){
        NSLog(@"File Does not Exists");
    }else{
        NSLog(@"File Exists");
    }
       
    // Write into a file
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:@"demo.txt"];
    [fileHandle seekToEndOfFile];
    [fileHandle writeData:[fileStruct.fileName dataUsingEncoding:NSUTF8StringEncoding]];
    
    [fileHandle seekToEndOfFile];
    [fileHandle writeData:[fileStruct.filePath dataUsingEncoding:NSUTF8StringEncoding]];
       
    [fileHandle seekToEndOfFile];
    [fileHandle writeData:[fileStruct.fileSize dataUsingEncoding:NSUTF8StringEncoding]];
       
    [fileHandle seekToEndOfFile];
    [fileHandle writeData:[fileStruct.dateCreated dataUsingEncoding:NSUTF8StringEncoding]];
       
    [fileHandle seekToEndOfFile];
    [fileHandle writeData:[fileStruct.dateModified dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandle closeFile];
       
    //update to file
    NSFileHandle *file;
    NSMutableData *writingdatatofile;
    const char *writingchar = "\nthis is update text to file demo.txt";
    writingdatatofile = [NSMutableData dataWithBytes:writingchar length:strlen(writingchar)];
    file = [NSFileHandle fileHandleForUpdatingAtPath: @"demo.txt"];
    if (file == nil) //check file present or not.
    NSLog(@"Failed to open file");
    [file seekToEndOfFile];
    [file writeData: writingdatatofile];
    [file closeFile];
       
    //another update to file
    NSMutableData *writingdatatofile2;
    const char *writingchar2 = "\nthis is another update text to file demo.txt";
    writingdatatofile2 = [NSMutableData dataWithBytes:writingchar2 length:strlen(writingchar2)];
    file = [NSFileHandle fileHandleForUpdatingAtPath: @"demo.txt"];
    if (file == nil) //check file present or not.
    NSLog(@"Failed to open file");
    [file seekToEndOfFile];
    [file writeData: writingdatatofile2];
    [file closeFile];
       
    // Read a file
    NSString *fileContent = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"file content: \n%@", fileContent);
       
    // get a size of file
    unsigned long fileSize = [[[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil] fileSize];
    NSLog(@"size is %i", fileSize);
       
    // remove a file from directory
    // [fileClass removeFile];
    // [fileClass newFileSizeFun];
        
    [pool drain];
    return 0;
}
