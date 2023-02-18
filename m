Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9319C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 Feb 2023 20:54:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 168b016c;
	Sat, 18 Feb 2023 20:52:19 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:2:2:0:c8ff:fe68:bf1c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 97b18c23
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Feb 2023 20:52:14 +0000 (UTC)
Received: from blind.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 7457E20FC2
 for <wireguard@lists.zx2c4.com>; Sat, 18 Feb 2023 21:51:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1676753515;
 bh=Z1UO0r6+WvOggQrMg/HOHje/H4zWA3sGNwl4tLJZ0NI=;
 h=From:To:Subject:Date:From;
 b=Hcy+w+kUV/qRIR0YHCrB3deaknh3Wh6BCIstcSO+Rc5QpIczs/ZPzJjPAt+DFygwc
 ZjHxwVYD8qi8BpF75v4qtPKVHE0x25llDu48PM6P+cm+llQZxoAr5ZT40GgQHiwwp4
 QFnNWqeZ3zcmI0mbSFGd1CYRzD2GS264P6ZfCT3EidVgLU4Zy5nCCX+9chqJB8izNB
 hqxO9/zpo9UnVL5l3nrUYNAf1y7m3gbWk+PTYjjscWnpwKO6+GRx6Yg/1cRthr96KW
 nmtiNRKlXFV0nhd6ZbOsxcSYsHiHiPJ8xmY5Gi5dhuN3e2N0GRvL+SQ2oOFgCatVLn
 hhlWK6D37/oNg==
Received: by blind.localdomain (Postfix, from userid 1000)
 id 5729E13A11F1; Sat, 18 Feb 2023 21:41:12 +0100 (CET)
User-agent: mu4e 1.7.26; emacs 28.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Source IP incorrect on multi homed systems
Date: Sat, 18 Feb 2023 21:14:46 +0100
Message-ID: <87bklqd7vb.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


Dear group,

I was wondering how wireguard [Linux kernel] or wireguard-go [FreeBSD]
are supposed to decide which IP address to use for replying?

I have seen both on FreeBSD and Linux that wireguard seems to use the IP
address of the outgoing interface, i.e. the one with the route returning
to the sender. However in multi homed situations, this can be wrong,
let's take this example:

      19:57:24.607526 net1  In  IP 194.5.220.43.60770 > 147.78.195.254.51820: UDP, length 148
      19:57:24.608358 net2  Out IP 195.141.200.73.51820 > 194.5.220.43.60770: UDP, length 92

The initiator sends from 194.5.220.43 to the receiver 147.78.195.254.
Wireguard then replies with the source IP of 195.141.200.73 instead of
147.78.195.254.

As the node is multi homed, the packet might leave through any of its
uplinks and thus return with a random (unexpected) IP address and will
not pass NAT rules on firewalls and finally be dropped. F.i. in above
example the firewall drops the packet from 195.141.200.73, because there
is no session entry for that.

I have observed this behaviour both on Linux 6.1.11 as well as
wireguard-go 0.0.20220316_8,1 on FreeBSD and in both cases the
connection will break depending on which active interface is taken as
exit.

I would argue that wireguard should by default invert the IP
addresses, i.e. switch dst=src, src=dst and then reply with that,
instead of adapting an interface specific address, or is there a good
reason for the current behaviour?

Best regards,

Nico

--
Sustainable and modern Infrastructures by ungleich.ch
