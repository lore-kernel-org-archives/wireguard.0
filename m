Return-Path: <SRS0=Zpbp=DI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840A8C4727C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 11:23:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BE15208B6
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 11:23:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=knockaert.nl header.i=@knockaert.nl header.b="GMZo80kL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BE15208B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=knockaert.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2900119a;
	Thu, 1 Oct 2020 10:51:32 +0000 (UTC)
Received: from mail.knockaert.nl (mail.knockaert.nl [2001:980:6492:1::4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7b84215d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Oct 2020 10:51:28 +0000 (UTC)
Received: from [169.254.225.18] (unknown
 [IPv6:2001:980:6492:1:182b:fa3c:670f:eae2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 (Authenticated sender: jknockaert@knockaert.nl)
 by mail.knockaert.nl (Postfix) with ESMTPSA id 989A75A019A;
 Thu,  1 Oct 2020 13:23:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=knockaert.nl;
 s=mail; t=1601551396;
 bh=7PNw0C4AQAO1vnTRAhGlowT528Svnbo3AsRvXeRxC9I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GMZo80kLVPoi7/HbJlLLXjxVQFZWg+OegM+DA2GBYqmTm5HaDVDjF/jr9UwAg6Tjn
 aJyPq7BZC0PXvMtnAANFR+w2Wcdu9brBu8nsi8cw7ROcYlasdyw/t/QRYosc+wDwKo
 umWBAp/t6D8Q3ABc+5ITTiNn3qktkQJNq0RfWWZs=
From: "Jasper Knockaert" <jasper@knockaert.nl>
To: "Laura Smith" <n5d9xq3ti233xiyif2vp@protonmail.ch>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Two small Wireguard frustrations on Mac & Apple iOS
Date: Thu, 01 Oct 2020 13:23:16 +0200
X-Mailer: MailMate (1.13.2r5673)
Message-ID: <036BBED1-14F9-42A9-8915-835F24A97926@knockaert.nl>
In-Reply-To: <RO0eYtp8TKtVxKltNMcmKXS8FhbJRiFU1fBuG8XmE3h8AtjY2_JlRSw_k29pm-3r70B_3pQHIF1nk252-3wHqVMlnbGbub2GiCU3DN7arLY=@protonmail.ch>
References: <RO0eYtp8TKtVxKltNMcmKXS8FhbJRiFU1fBuG8XmE3h8AtjY2_JlRSw_k29pm-3r70B_3pQHIF1nk252-3wHqVMlnbGbub2GiCU3DN7arLY=@protonmail.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.102.4 at green
X-Virus-Status: Clean
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

Hi

Just one other issue with the MacOS client. When you have multiple users 
on the same computer (say user A and user B) user A can import a 
WireGuard config in the client. Then another user B can see the config 
name, but cannot modify or connect because the required keys are in the 
Keychain of user A. So far all is fine. But user A may specify the 
config to connect on demand (basically upon login). Then when logging in 
as user B, WireGuard will still try to connect without having access to 
the connection settings (because they are stored in the keychain of user 
A). This causes an endless loop, which should be avoided.

Best

Jasper

On 23 Aug 2020, at 20:34, Laura Smith wrote:

> Hi,
>
> These aren't show-stoppers per-se, but it would be nice to see them 
> fixed and new clients pushed out via the App Store:
>
> (1) MacOS (10.15.6 but also observed on 10.15.5, not tested on 
> anything older)
>
> - Start with WG client in an operational state
> - Disconnect network (e.g. if on WiFI, turn off the WiFi in the menu 
> bar)
> - Sleep the machine
> - Wait- Wake the machine
> - Turn on Wifi
> - Note that WG client fails to re-establish connectivity (shows 
> connected, but no traffic flows until you deactivate/reactivate WG)
>
> (2) iOS (13.6.1, also observed on 13.6, not tested on anything older)
>
> After a period of time, seems to be a few days to a week, WG seems to 
> deactivate of its own accord (as if some sort of counter was reached 
> or something).  This does not appear to be correlated with network 
> connectivity (e.g. I can switch to airplane mode for an extended 
> period of time, then re-enable, and WG remains connected), so its 
> something else in the WG code (either itself or the way it interacts 
> with iOS).
>
> This is all a bit frustrating because you are unknowingly then using 
> an unencrypted connection.
>
> Perhaps WG should consider adding "retry" functionality (OpenVPN 
> client for iOS has such a feature, where you can tell it to retry for 
> a period of time or indefinitely) 
>
> Apart from that, WG is great ;-)
>
> Laura
