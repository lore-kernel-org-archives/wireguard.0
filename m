Return-Path: <SRS0=t67z=GH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49233C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 17:53:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FB502074A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 17:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FB502074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e16e93d0;
	Mon, 4 Jan 2021 17:42:30 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0522d917
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 17:42:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=QjuVOWyuo4r/UVFmrGegI3crGmCWKH6d5JQtnLPJwIP2EtxA3pD+WdbtQEaZ27mQSIWEjT1rUIQKIzF63hLn5i2KRSWoiuh+8WTQqtaAo1ngSn4vBHEPXOk8hiASS2Fb5vHfp0wAz0dGhPH915SS8NEjRCiuEIDZ/NJK2THIa80072lbEBx3pmhCvtXjF2lwUweF2QEmTWNi/aXHiItYZ4QtX01dQ7dpHtu581h4X80AXQJwOZZ12sWKwqxicJhsm8/Zk8lJ05OEhmU4RzeruQT0m8Qgop1ClqIQrI+wEU7r6qfvk2ELJMMUSR0Ya3BDQxGxsP0Vnu1E73AaaPatlQ==;
 s=purelymail2; d=msfjarvis.dev; v=1;
 bh=AkppmuqHRJPEkWvkggApTI/BWFlSpf/54CuaQwisCS0=; h=Received:From:To; 
DKIM-Signature: a=rsa-sha256;
 b=DTN245E/8jNLSSofMUUbsnpQWsnbrricK2WpmtrpgtnwSDVQvLaR+tmKm7VP6I3+cAhdZJW/VeLzp/u1JsCdC5biqB8sJeIFIGppUlvRFHAf4zwI0n0QdHNEwhX3cNf/5/eh4MwwxBmhBGWfkxJCHALZcMNISUSsSzZlGyqMz2wfYckbdDR4MsUgdPM2UwAWdYr+1NyKj0VO3vYA77ROOyvrK4IFCR/jEBfYrDV7AUNsOYjbI8Bhjpq8yLgLg5deQmnP7uShaiOgRPWeGN8huzO6WEwDzqPupjlI4Uiq+M2Pz8nyE4sLN+uY7zsclZ7nV0f9w6ZwrzHuQnmwwguHkA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=AkppmuqHRJPEkWvkggApTI/BWFlSpf/54CuaQwisCS0=;
 h=Feedback-ID:Received:From:To; 
Feedback-ID: 322:138:null:purelymail
X-Pm-Original-To: wireguard@lists.zx2c4.com
Received: by ip-172-30-0-247.ec2.internal (JAMES SMTP Server ) with ESMTPA ID
 -2079322213; Mon, 04 Jan 2021 17:53:12 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 04 Jan 2021 17:53:11 +0000
From: Harsh Shandilya <me@msfjarvis.dev>
To: Adam Irr <adam.irr@outlook.com>, Jason <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [PATCH] wg-quick: Android: Use ip link to set MTU
In-Reply-To: <DM5PR0701MB3670A1B8ADEF9BC7C8E06FEE92D30@DM5PR0701MB3670.namprd07.prod.outlook.com>
References: <DM5PR0701MB3670A1B8ADEF9BC7C8E06FEE92D30@DM5PR0701MB3670.namprd07.prod.outlook.com>
User-Agent: Purely Mail via Roundcube/1.4.7
Message-ID: <375e4f5117985cc3d71fbd786e5ab3f1@msfjarvis.dev>
X-Sender: me@msfjarvis.dev
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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

Hey Adam,

On 2021-01-03 05:59, Adam Irr wrote:
> The ndc command used didn't work on my Nvidia Shield (rooted with a
> custom-built kernel). The ip link command does work. I have only
> tested this on an Nvidia Shield (Android TV - Version 9.0 Pie).
> 
> I couldn't find a lot of documentation on ndc so it's possible my
> device/kernel is misconfigured. If you suspect this is the case, let
> me know.

You couldn't find documentation because there isn't any, it's 
effectively "private API" and Google has broken it time and again. It is 
rather curious that you're running into this issue though, since we've 
had the NDC code in place since before Android 9 came out and went 
through breaking changes in every cycle without these specific 
invocations failing. The last ndc related problem we had was with the 
Android 11 release, where a similar fix[1] was implemented.

I've Cc'ed Jason for reviewing this change, but I'm decidedly curious as 
to why just the Nvidia SHIELD seems to need it.

> 
> Signed-off-by: Adam Irr <adam.irr@outlook.com>
> ---
>  src/wg-quick/android.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/src/wg-quick/android.c b/src/wg-quick/android.c
> index 326efa9..941c7b8 100644
> --- a/src/wg-quick/android.c
> +++ b/src/wg-quick/android.c
> @@ -995,7 +995,7 @@ static void set_mtu(const char *iface, unsigned int 
> mtu)
>         int endpoint_mtu, next_mtu;
> 
>         if (mtu) {
> -               cndc("interface setmtu %s %u", iface, mtu);
> +               cmd("ip link set dev %s mtu %d", iface, mtu);
>                 return;
>         }
> 
> @@ -1016,7 +1016,7 @@ static void set_mtu(const char *iface, unsigned 
> int mtu)
>                         endpoint_mtu = next_mtu;
>         }
> 
> -       cndc("interface setmtu %s %d", iface, endpoint_mtu - 80);
> +       cmd("ip link set dev %s mtu %d", iface, endpoint_mtu - 80);
>  }
> 
>  static void add_route(const char *iface, unsigned int netid, const 
> char *route)
> --
> 2.25.1

Cheers,
Harsh

1: 
https://git.zx2c4.com/wireguard-tools/commit/?id=9a0d65e2afbd6e418c883e0de8555b4fac29f1d5
