Return-Path: saschagrunert@icloud.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f1ab09d
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Feb 2017 11:47:49 +0000 (UTC)
Received: from st11p01im-asmtp002.me.com (st11p01im-asmtp002.me.com
 [17.172.204.152])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9df70743
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Feb 2017 11:47:49 +0000 (UTC)
Received: from process-dkim-sign-daemon.st11p01im-asmtp002.me.com by
 st11p01im-asmtp002.me.com
 (Oracle Communications Messaging Server 7.0.5.38.0 64bit (built Feb 26 2016))
 id <0OLQ00V0039K8800@st11p01im-asmtp002.me.com> for wireguard@lists.zx2c4.com;
 Tue, 21 Feb 2017 11:48:31 +0000 (GMT)
Received: from icloud.com ([127.0.0.1]) by st11p01im-asmtp002.me.com
 (Oracle Communications Messaging Server 7.0.5.38.0 64bit (built Feb 26 2016))
 with ESMTPSA id <0OLQ00GET3GR5410@st11p01im-asmtp002.me.com> for
 wireguard@lists.zx2c4.com; Tue, 21 Feb 2017 11:48:29 +0000 (GMT)
From: Sascha Grunert <saschagrunert@icloud.com>
Content-type: text/plain; charset=us-ascii
MIME-version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: [ANNOUNCE] WireGuard in Rust development started
Message-id: <EC598EA9-99F4-4355-BD47-E4BB88E77251@icloud.com>
Date: Tue, 21 Feb 2017 12:48:26 +0100
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

It is great to hear that we can start with the development of the Rust =
version of WireGuard!

The repository can be found here: https://git.zx2c4.com/wireguard-rs/
A GitHub mirror does also exist: =
https://github.com/WireGuard/wireguard-rs

I suggest do use the mailing list and the GitHub features for issue =
handling and discussions.

What do we have for now: I added some initial implementation example =
which uses tokio.rs
(https://tokio.rs) and a custom device handling. You can try it out by =
doing:

```
$ cargo test
$ nc -u 127.0.0.1 8080
Hello world
```

For testing purposes it creates a dummy interface in /tmp where the =
incoming traffic will be
redirected to this interface. Incoming traffic from this interface =
should be sent to the client.

As next steps we can make the server working and add device handling for =
other platforms as
well. :)

Best regards,
Sascha
