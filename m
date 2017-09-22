Return-Path: yszhou4tech@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 768b7386
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 12:31:13 +0000 (UTC)
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
 [209.85.161.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1106a495
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 12:31:13 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id v72so674989ywa.3
 for <wireguard@lists.zx2c4.com>; Fri, 22 Sep 2017 05:58:43 -0700 (PDT)
MIME-Version: 1.0
From: Yousong Zhou <yszhou4tech@gmail.com>
Date: Fri, 22 Sep 2017 20:58:22 +0800
Message-ID: <CAECwjAgRyK0T3vtBUzR1P-d--vdEDS=Jj-nFWHx1=7ivEd6Zvw@mail.gmail.com>
Subject: Flood ping can cause oom when handshake fails
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi, I have encountered a few issues when running WireGuard on VoCore:
a small ramips device with 16MB flash and 32MB ram
(https://wiki.openwrt.org/toh/vocore/vocore).

  root@LEDE:/# uname -a
  Linux LEDE 4.9.49 #0 Fri Sep 15 05:14:29 2017 mips GNU/Linux
  root@LEDE:/# opkg list-installed | grep -i wireguard
  kmod-wireguard - 4.9.49+0.0.20170907-1
  luci-app-wireguard - git-17.259.19938-f36f198-1
  luci-proto-wireguard - git-17.259.19938-f36f198-1
  wireguard - 0.0.20170907-1
  wireguard-tools - 0.0.20170907-1
  root@LEDE:/# wg show
  interface: air
    public key: eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
    private key: (hidden)
    listening port: 21841

  peer: ffffffffffffffffffffffffffffffffffffffffffff
    endpoint: iiiiiiiiiiii:ppppp
    allowed ips: 0.0.0.0/0
    latest handshake: 4 minutes, 35 seconds ago
    transfer: 520 B received, 872 B sent

WAN is a wired vlan interface: eth0.1 bearing the default route.
Traffics will be marked by iptable rules and routed through wireguard
interface with simple policy routing rules.  The setup works quite
well on another ar71xx-based device (in case it matters, the wan
interface is a regular device eth1).

The first issue is that occasionally wireguard failed to send
handshake initiation packets to the remote.  I got to this conclusion
by two observations
 - Tearing down then bringing up ("ifup air") the local wireguard
device did not trigger the update of "latest handshake" timestamp on
the remote
 - Wireguard packets can be captured on eth0.1 but not on the remote

The second issue is that when handshake fails, flood ping traffic that
was expected to be forwarded through the wireguard interface can cause
oom and hang the device to death.  There is a [kworker] process taking
up high cpu usage.

WireGuard is a very nice and convenient solution.  If there are any
further steps/info required to debug this, I am all ready ;)

                yousong
