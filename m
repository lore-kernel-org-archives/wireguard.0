Return-Path: neumann@cgws.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8504dae
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 May 2018 22:04:44 +0000 (UTC)
Received: from mail.dabax.net (mail.dabax.net [88.99.12.75])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e8cefc0
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 May 2018 22:04:44 +0000 (UTC)
From: Axel Neumann <neumann@cgws.de>
Subject: WG: Need for HW-clock independent timestamps
To: wireguard@lists.zx2c4.com
Message-ID: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
Date: Sat, 12 May 2018 00:07:34 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Reply-To: neumann@cgws.de
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

We have the following chicken-egg problem:
We are using WG on openwrt devices which do not have a hardware clock so
that time is resetted after each reboot.
Because internet access shall be routed via WG tunnels the internet and
network-time services (NTP) is not available unless WG works properly.
But, guess, to reconnect, WG needs a greater time than before it
rebooted :-(

I heard that a suggested solution is to periodically save the current
time to filesystem and then fix it during boot based on the last saved
one. But all embedded devices use flash memory with a limited amount
(about 10^5) of write cycles before they become unstable which would
destroy the flash within weeks.

Any ideas how to circumvent this problem?

As a remark, BMX7 is doing it the following way:
Instead of using timestamps to protect against replay attacks the
approach is to use just an always increasing integer (sqn), for each new
signature (from the WG white paper I understand that that should be
possible). Sqn Jumps, as long as they are just increasing the sqn, are fine.
Now, to save the sqn over reboot it is read from filesystem as
current_sqn during boot and immediately saved as
save_sqn=current_sqn+100000 and then only be re-saved (again as new
current_sqn+100000) when the last used current_sqn equals the last saved
save_sqn. This way, jumps of at most 100000 occur only in case of node
reboots. But as such jumps are harmless anyway its ok. And with a
48-bit-timestamp field it would still survive 28^9 reboots till the
timestamp reaches end-of-life. Of course the 100000 is debatable as I do
not know how much DH-based connection attempts may happen over a day or
week. But given that no more than one sqn save occurs in average per day
the flash lifetime could already be increased significantly.

Best regards
/Axel
