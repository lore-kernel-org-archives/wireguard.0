Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2541C00307
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:06:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AFF02081B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:06:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=national.shitposting.agency header.i=@national.shitposting.agency header.b="Goj3Yqrp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AFF02081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=national.shitposting.agency
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cd22d68;
	Fri, 6 Sep 2019 19:06:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 185f61ad
 for <wireguard@lists.zx2c4.com>; Sun, 1 Sep 2019 17:22:34 +0000 (UTC)
Received: from cock.li (cock.li [IPv6:2a06:1700:0:b::c0cc])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9302ee1e
 for <wireguard@lists.zx2c4.com>; Sun, 1 Sep 2019 17:22:34 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=national.shitposting.agency; s=mail; t=1567358552;
 bh=lD8OkWvXBPqovO1KNoedr/4uhCV4jwMhRrsJPZAbxlM=;
 h=Date:From:To:Subject:From;
 b=Goj3YqrpYrtWNctIRDxY35t95yGz4fp0JHZCfNOEo8AOty8uL4weXoW6tziWcvS45
 +ji52C1BjrE0D1PHr5UgmUcbPwEARTYdVShnxe7N2H9RIyQkPL4BFdk2jJUd9WOJz3
 Oj091jWJJyX1CpJevHiCUBgisQ+Cd/Qq0Bcp6GX7ereGp4AXnCxhuwhtYxhPuLRpcI
 L1b32VSpsowze5ofaGSGmEEHA1EHZuyNB9w00DhhgsSu5sFd9rQb42h8fLJrJiFjqA
 wylJVBMyHNAfWhRlEn5lZfkRdtKq/bCh4fbyknVvVAjythVE/O/9tpvFsqR4l9uS0+
 eDcTHmxx7lO4Q==
Date: Sun, 01 Sep 2019 20:22:31 +0300
From: mindless@national.shitposting.agency
To: wireguard@lists.zx2c4.com
Subject: Unprivileged WireGuard
Message-ID: <d349608308ce017c4a7d0321389e294a@national.shitposting.agency>
X-Sender: mindless@national.shitposting.agency
User-Agent: Roundcube Webmail/1.3.6
X-Mailman-Approved-At: Fri, 06 Sep 2019 21:06:10 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Lately I've been fiddling around with namespaces and I thought that
it would be great to have an ability to create wireguard interfaces 
without
requiring CAP_NET_ADMIN.

In Linux, any user can unshare into a new user namespace and
gain all capabilities there and simultaneously the user can unshare into 
a
new network namespace, thus gaining an ability to create any network 
interface
in the newly created namespace. The only problem we are facing now is 
that
since we are in the new network namespace, we can't reach the outside 
network
via physical/whatever interfaces the initial network namespace had.

The problem is trivially solved when using any TUN-based implementation 
(such as
wireguard-go): create UDP socket for wireguard traffic in the initial 
network
namespace and then don't close the resulting file descriptor while 
unsharing,
after unsharing use this socket for sending and receiving encapsulated 
traffic.
Binding and listening on non-privilged ports is allowed for all users.

However, for the kernel implementation this problem is unsolvable 
because it
creates sockets in kernel by itself. I guess, one could pass the 
socket's fd
number via netlink, the kernel module would then look it up in the 
task_struct
of the netlink peer and then use this socket for initialization. But 
there is
no way to invalidate the socket fd in the userspace so we have to count 
on user
to not to use it in any way after having sent it via netlink.

Is this a viable solution? Forgive me if I'm spewing nonsense, I have 
never
touched kernel code in any way.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
