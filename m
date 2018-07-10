Return-Path: stunnel@attglobal.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 508c127b
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 22:12:49 +0000 (UTC)
Received: from dnvrco-cmomta02.email.rr.com (dnvrco-outbound-snat.email.rr.com
 [107.14.73.232])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ae52e9f
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 22:12:49 +0000 (UTC)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Eddie <stunnel@attglobal.net>
Subject: Should wg-quick with SaveConfig accumulate IPv6 link-local addresses
Message-ID: <2e6b4759-1acd-ddd3-2471-14ce932ac82a@attglobal.net>
Date: Tue, 10 Jul 2018 15:20:09 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Reply-To: stunnel@attglobal.net
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Not sure if this is intended behaviour, or not.

Every time I start an interface using wg-quick with the SaveConfig = 
true it reloads all the previous, saved, IPv6 link-local addresses plus 
generates a new one.  So the first time the interface is started there 
is 1 link-local address.  The next time, 2.  Then 3. Then 4, etc. etc.

Cheers.
