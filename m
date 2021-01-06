Return-Path: <SRS0=fpOe=GM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF12BC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  9 Jan 2021 02:35:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4E1223998
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  9 Jan 2021 02:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4E1223998
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=53c70r.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b6cbdb6;
	Sat, 9 Jan 2021 02:35:51 +0000 (UTC)
Received: from 53c70r.de (53c70r.de [45.142.177.54])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 23433374
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 9 Jan 2021 02:35:50 +0000 (UTC)
Subject: Re: Wireguard not available for CentOS Stream
DKIM-Filter: OpenDKIM Filter v2.11.0 53c70r.de 2AEF7421409
To: Jonathan Aquilina <jaquilina@eagleeyet.net>
References: <a79af0c5-ad54-2b17-964b-9e7891064335@53c70r.de>
 <176cafeade8.27b6.fd5e59abeac6319e4fe4e8192ea7d08d@solidadmin.com>
 <CAHmME9pzOrvHX2bVcHVHh44_j1P_bYaz+o-wCnjnEgxoMeZCyA@mail.gmail.com>
 <CAH8yC8n-fC8MJxR7cA+otkqRyDZwhR7wz2Ni+-YTAgiKz7CRHA@mail.gmail.com>
 <VE1PR08MB5837188C79F58A014916E123A0D10@53c70r.de>
Cc: wireguard@lists.zx2c4.com
From: Silvan Nagl <mail@53c70r.de>
Message-ID: <64e80310-cbb6-d972-6257-bfba53eea52e@53c70r.de>
Date: Wed, 6 Jan 2021 10:32:26 +0100
In-Reply-To: <VE1PR08MB5837188C79F58A014916E123A0D10@53c70r.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

I'm kinda amazed by Fedora Server at this point.
+1 for recommendation.

On 1/5/21 12:25 PM, Jonathan Aquilina wrote:
> Hi,
>
> Is Fedora a rolling release so to speak? I remember they used to call fedora the bleeding edge distro not really geared for production environments is that still accurate. I have only used it as a work station desktop with KDE installed.
>
> Regards,
> Jonathan
>
> -----Original Message-----
> From: WireGuard <wireguard-bounces@lists.zx2c4.com> On Behalf Of Jeffrey Walton
> Sent: 04 January 2021 22:55
> To: Jason A. Donenfeld <Jason@zx2c4.com>
> Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
> Subject: Re: Wireguard not available for CentOS Stream
>
> On Mon, Jan 4, 2021 at 7:48 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>> On Mon, Jan 4, 2021 at 2:24 AM Joe Doss <joe@solidadmin.com> wrote:
>>> https://copr.fedorainfracloud.org/coprs/jdoss/wireguard/
>>>
>>> The official DKMS install method for CentOS has a Stream repo 
>>> enabled. It should work fine. Let us know if you have any issues.
>> It's actually presently broken. I've fixed it in the master branch with:
>> https://git.zx2c4.com/wireguard-linux-compat/commit/?id=f7f55464a156e1
>> 181fa76d9c7e2fc0d495f2357e
>>
>> But Red Hat still has not fixed other bugs that will enable our CI to 
>> continue, and I won't release for RHEL alone until the CI is green.
>> You can cherry pick that into your dkms package if you need. I wrote 
>> Red Hat a patch and sent it, but there's been no updated kernel yet.
>>
>> More generally, I'm on the fence about how much I actually want to 
>> support CentOS Stream. CentOS non-Stream is annoying, because it's 
>> developed behind closed doors and is extremely slow to fix things, but 
>> at least the changes are gradual and it's easy to keep up with, by 
>> virtue of rarely changing. In contrast, CentOS Stream is fast moving, 
>> and extremely unstable, with builds frequently breaking. This would be 
>> fine and I would prefer it, since it means we can in theory get things 
>> fixed reasonably fast, but actually, Stream is still developed behind 
>> closed doors, with no visibility about what's going on, no 
>> communication from RH on when fixes are coming out, no regular or 
>> reliable release schedule, no releases for months sometimes, and just 
>> a bugzilla blackbox that forces all reports to be private/secret. So,
>> unstable+secretive development makes developing for CentOS Stream
>> nearly as fun as developing for macOS, which is to say, not very fun.
> From an admin and developer perspective I find Fedora Server a real gem. Speaking from experience, I would much rather work on Fedora than CentOS or Red Hat.  Fedora Server comes with the latest stable tools and does not need things like Software Collections (SCL) to get a modern Apache, Python or PHP.
>
> Every year or so Fedora Server needs a DNF System Upgrade (https://docs.fedoraproject.org/en-US/quick-docs/dnf-system-upgrade/),
> which is like a Ubuntu dist-upgrade. I've not had one go bad since I started using it back around F12 or F15.
>
> If Wireguard needs to make a Red Hat-family recommendation, I think it would be wise to consider Fedora Server.
>
> Jeff
