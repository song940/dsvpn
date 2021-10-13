const std = @import("std");
const builtin = @import("builtin");

pub fn build(b: *std.build.Builder) !void {
    var target = b.standardTargetOptions(.{});
    const mode = builtin.mode.ReleaseSmall;

    const dsvpn = b.addExecutable("dsvpn", null);
    dsvpn.setTarget(target);
    dsvpn.setBuildMode(mode);
    dsvpn.install();
    dsvpn.linkLibC();

    dsvpn.addIncludeDir("include");
    dsvpn.defineCMacro("_GNU_SOURCE", "1");
    dsvpn.addCSourceFiles(&.{ "src/charm.c", "src/os.c", "src/vpn.c" }, &.{});
}
