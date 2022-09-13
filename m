Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEDAC6FA82
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Sep 2022 10:21:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 88a90f52;
	Wed, 28 Sep 2022 10:21:01 +0000 (UTC)
Received: from mail.linux-ng.de (srv.linux-ng.de [5.9.18.165])
 by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7aecfaee
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Sep 2022 19:37:33 +0000 (UTC)
Received: from cloud.linux-ng.de (srv.linux-ng.de [IPv6:2a01:4f8:160:92e6::2])
 by mail.linux-ng.de (Postfix) with ESMTPSA id 97D25937E23E
 for <wireguard@lists.zx2c4.com>; Tue, 13 Sep 2022 21:37:33 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 13 Sep 2022 19:37:33 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: RainLoop/1.16.0
From: marcel@linux-ng.de
Message-ID: <46fae16c62151cf55e7b357e8dc0df94@linux-ng.de>
Subject: Possible performance impact of queuing?
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 28 Sep 2022 10:20:52 +0000
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

Hi there,

I was just testing wireguard performance on a new server machine (with lo=
ts of cores) and got lower
performance than expected.
However a lot of kernel processes were spawned only using CPUs up to 20% =
(but not higher).
That got me thinking about a possible cause.

I remembered, that some time ago I noticed a similar behavior for dm-cryp=
t and while investigating
further I found this detailed analysis:
https://blog.cloudflare.com/speeding-up-linux-disk-encryption/
It showed, that the kernel internal queuing has a huge impact on throughp=
ut and latency (and
there's a fix/option for that in newer kernel releases, s. end of above b=
log article (search for
"merged")).

So I wondered if the wireguard code may face the same challenge?
I had a quick look at the code and to me (as a non kernel developer) it l=
ooks like it could be
worth a try, to adapt and benchmark the changes made for dm-crypt.

I hope someone with more knowledge about wireguard / kernel internals can=
 comment on that.
(I know wireguard is one of the fastest VPN solutions around, but what if=
 it could be even faster?
:-) )

Bye, Marcel
