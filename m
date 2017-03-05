Return-Path: saschagrunert@icloud.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63a21264
 for <wireguard@lists.zx2c4.com>; Sun, 5 Mar 2017 11:39:46 +0000 (UTC)
Received: from st11p01im-asmtp002.me.com (st11p01im-asmtp002.me.com
 [17.172.204.152])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11ab4fee
 for <wireguard@lists.zx2c4.com>; Sun, 5 Mar 2017 11:39:46 +0000 (UTC)
Received: from process-dkim-sign-daemon.st11p01im-asmtp002.me.com by
 st11p01im-asmtp002.me.com
 (Oracle Communications Messaging Server 7.0.5.38.0 64bit (built Feb 26 2016))
 id <0OMC00600B06J900@st11p01im-asmtp002.me.com> for wireguard@lists.zx2c4.com;
 Sun, 05 Mar 2017 11:42:04 +0000 (GMT)
Received: from icloud.com ([127.0.0.1]) by st11p01im-asmtp002.me.com
 (Oracle Communications Messaging Server 7.0.5.38.0 64bit (built Feb 26 2016))
 with ESMTPSA id <0OMC00PIYB61Z530@st11p01im-asmtp002.me.com> for
 wireguard@lists.zx2c4.com; Sun, 05 Mar 2017 11:42:04 +0000 (GMT)
From: Sascha Grunert <saschagrunert@icloud.com>
Content-type: text/plain; charset=us-ascii
MIME-version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Rust implementation status
Message-id: <E63B612D-BFAA-48FE-A352-25B4C11B8E05@icloud.com>
Date: Sun, 05 Mar 2017 12:42:00 +0100
To: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey folks,

I want to call for participation of the Rust userspace implementation of =
WireGuard. The template for the initial implementation was this: =
https://www.wireguard.io/xplatform/ and can be found here: =
https://git.zx2c4.com/wireguard-rs/.

What works for now:

- A main working executable (`cargo run -- -h`) which parses the command =
line parameters via the `clap` crate
- General debug and tracing support via the `log` crate
- Daemonizing support
- The wireguard library which creates a local socket and waits for =
incoming connections (reference implementation)

What needs to be done in the next steps:

- The actual parsing of the incoming message and writing them to the =
wireguard device (see `TODO`)
- Higher test coverage via unit testing
- A plan how to use the tokio.rs futures with the current implementation
- Wider operating system (Windows) support for the current =
implementation
- Get rid of the unsafe code

I tried to use as much idiomatic Rust (like using the `nix` crate and =
Rust vectors instead of raw pointers) as possible for now. So what do =
you think?

Best regards,
Sascha=
