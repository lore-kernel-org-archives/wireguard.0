Return-Path: <SRS0=XdmQ=GI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50802C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 13:06:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 512D422240
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 13:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 512D422240
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=53c70r.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e24950a;
	Tue, 5 Jan 2021 12:55:25 +0000 (UTC)
Received: from 53c70r.de (53c70r.de [2a03:4000:4a:b7f::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4cec2f09
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jan 2021 12:55:22 +0000 (UTC)
Subject: Re: Wireguard not available for CentOS Stream
DKIM-Filter: OpenDKIM Filter v2.11.0 53c70r.de 489914077D89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=53c70r.de;
 s=default; t=1609851980;
 bh=iO9wKBs7Exo54PA8d7DUyhDA4LGKCgWIz+/NwHGhHkw=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=R94nWOQtcHhhXeFmpvxpit5m1YYUSLXi0zjOGgBpJUniue5ku7hLKvnWMPE506u2T
 bbVJ8ukdmtYOmbScSn4FX5Q9EZV05awqjsHvh3F/TyxYqn/yAQ08jQRRqaHIeadAl+
 fqrYr+Sb6eKH/Z14ZO4OYHEv8+fzvSTG2t7TwT3U=
To: noloader@gmail.com
References: <a79af0c5-ad54-2b17-964b-9e7891064335@53c70r.de>
 <176cafeade8.27b6.fd5e59abeac6319e4fe4e8192ea7d08d@solidadmin.com>
 <CAHmME9pzOrvHX2bVcHVHh44_j1P_bYaz+o-wCnjnEgxoMeZCyA@mail.gmail.com>
 <CAH8yC8n-fC8MJxR7cA+otkqRyDZwhR7wz2Ni+-YTAgiKz7CRHA@53c70r.de>
Cc: wireguard@lists.zx2c4.com
From: Silvan Nagl <mail@53c70r.de>
Message-ID: <aca7e86f-0c1b-a2c1-7508-67650c5f8806@53c70r.de>
Date: Tue, 5 Jan 2021 14:06:14 +0100
In-Reply-To: <CAH8yC8n-fC8MJxR7cA+otkqRyDZwhR7wz2Ni+-YTAgiKz7CRHA@53c70r.de>
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

Thank you for this information.
Since Stream is more or less like a very old Fedora version now I am
convinced using Fedora Server wont be that bad at all.

Gonna test it soon.

On 1/4/21 10:55 PM, Jeffrey Walton wrote:
> On Mon, Jan 4, 2021 at 7:48 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>> On Mon, Jan 4, 2021 at 2:24 AM Joe Doss <joe@solidadmin.com> wrote:
>>> https://copr.fedorainfracloud.org/coprs/jdoss/wireguard/
>>>
>>> The official DKMS install method for CentOS has a Stream repo enabled. It
>>> should work fine. Let us know if you have any issues.
>> It's actually presently broken. I've fixed it in the master branch with:
>> https://git.zx2c4.com/wireguard-linux-compat/commit/?id=f7f55464a156e1181fa76d9c7e2fc0d495f2357e
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
> From an admin and developer perspective I find Fedora Server a real
> gem. Speaking from experience, I would much rather work on Fedora than
> CentOS or Red Hat.  Fedora Server comes with the latest stable tools
> and does not need things like Software Collections (SCL) to get a
> modern Apache, Python or PHP.
>
> Every year or so Fedora Server needs a DNF System Upgrade
> (https://docs.fedoraproject.org/en-US/quick-docs/dnf-system-upgrade/),
> which is like a Ubuntu dist-upgrade. I've not had one go bad since I
> started using it back around F12 or F15.
>
> If Wireguard needs to make a Red Hat-family recommendation, I think it
> would be wise to consider Fedora Server.
>
> Jeff
