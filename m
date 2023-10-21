Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072AAC3DA6E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 05:25:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19753fbe;
	Wed, 20 Dec 2023 04:59:01 +0000 (UTC)
Received: from LUCIFER.DED1.NET (lucifer.ded1.net [101.99.66.85])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2341ebab
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Oct 2023 01:30:02 +0000 (UTC)
Message-ID: <df215452-cc26-4f1b-9e5a-690632b00ac0@bsd.my>
Date: Sat, 21 Oct 2023 09:29:56 +0800
MIME-Version: 1.0
Content-Language: en-US
To: wireguard@lists.zx2c4.com
From: Darryl Yeoh <drl@bsd.my>
Subject: AllowedIPs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 20 Dec 2023 04:58:44 +0000
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
Reply-To: drl@bsd.my
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi lists,

I've a Debian 11 box in my LAN set up as a WG client. When I set:

AllowedIPs 0.0.0.0/0, ::/0


everything works.


However when I set:

AllowedIPs 0.0.0.0/1, 128.0.0.0/1, ::/1, 8000::/1


nothing works. Like ping/dig/curl just hangs until I hit Ctrl+c to 
return to prompt.


When I test this config on my Android phone, it works with both of the 
AllowedIPs.

Seems odd. Any ideas ?


Regards,

-Darryl

