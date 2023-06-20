const std = @import("std");


// 实现一个http server
// pub fn makeHttpServer() !void{
//     var allocator = std.heap.page_allocator;
//     var server = std.http.Server.init(allocator);
//     defer server.deinit();

//     var handler = fn (request: *std.http.Request, response: *std.http.Response) !void {
//         try response.status(200, "OK");
//         try response.putHeader("Content-Type", "text/plain");
//         try response.putHeader("Content-Length", "13");
//         try response.writeAll("Hello, world!\n");
//     };

//     try server.setHandler("GET", "/", .{ .callback = handler });
//     try server.listen(":8080");
//     std.debug.print("listening on :8080\n", .{});
//     try server.start();
// }


// 实现一个http client
// pub fn makeHttpClient() !void{
//     var allocator = std.heap.page_allocator;
//     var client = std.http.Method.requestHasBody(allocator)
//     const response = try request.send();

//     std.debug.print("Status Code: {d}\n", .{response.statusCode});
//     std.debug.print("Content-Type: {s}\n", .{response.getHeader("Content-Type")});
//     std.debug.print("Content-Length: {d}\n", .{response.getHeaderInt("Content-Length")});
//     std.debug.print("Body:\n{s}", .{response.body()});
// }


pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});
    std.debug.print("xxxxx{*}", .{"yyyyy"});

    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("Run `zig build test` to run the tests.\n", .{});

    try bw.flush(); // don't forget to flush!



    // makeHttpClient();
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
