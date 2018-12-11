Return-Path: <SRS0=sRyP=OU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D75CC07E85
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Dec 2018 06:19:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A96222082F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Dec 2018 06:19:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mindcast.org header.i=@mindcast.org header.b="JtP8l84h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A96222082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mindcast.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86b5a354;
	Tue, 11 Dec 2018 06:10:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e941928e
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Dec 2018 06:10:38 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db24d281
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Dec 2018 06:10:38 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id u18so9856993lff.10
 for <wireguard@lists.zx2c4.com>; Mon, 10 Dec 2018 22:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mindcast.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AJxEiKW2Jtb3H2SF3qYBt59gsHOjKlWuqn0NdUa0r98=;
 b=JtP8l84h0NCFI9iwROmfLvADl/6OtUxZ+2davecsc3rtp3yrBviJdiFlG58MwdSua0
 nJuEUG1TGsdyIpz5vzK5FvvZLXih5tjR5OOzVmTpBvcjbdCFG/xw4DU7g00g/xi7v2ye
 pWd7UoO7p6IPcxcmR5T/cIkuOqTb+ePqf4Bck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AJxEiKW2Jtb3H2SF3qYBt59gsHOjKlWuqn0NdUa0r98=;
 b=KBOUYq5sDc6EbLRE0+lvPjkLS/Ncu4USA/RdLRu2o1fatzVq8lPpDh6wzyjUyG1o+W
 R2af6yNeqn/MtrDlKifKApZzgi5MJi+vDY3/6EttM0yu0lxQYRNwbvyzkytptBznBnlr
 25rXM0FqQ2ohuH3LsfrENzyGYtWhaKDo5kjypYvpheYbDWbFJ/8AhpIYJIX2cfzve8dA
 lCCBKCr5stZvh5RbOwUBZCdind+IYw3BBiZzkYUQs408oS+73WNEtevQVYP4HdxrSicq
 6//DByW+BLXaEstCv+1p5yF8NCWjl9wavW8jNGtujNp15x+Er8lOEEErb/W3Uz0A6H48
 nXpg==
X-Gm-Message-State: AA+aEWai4Dgodvx9M1fUeB1jfFPH6hj7Lpx8ljvY7/xGJPwIjtxifJmv
 51oAbf+YMOxbQYHHjKi/P9g5X1YvMzp2eWcAIUgFW929WZQ=
X-Google-Smtp-Source: AFSGD/Uk5LtgEijiRIut/jT2FQJqXEg9314siGaRd5URIuQSUUR9cCUk/NR+sg1iCmFBndPwzTxgLm5/Zr8n5lEicro=
X-Received: by 2002:a19:4e59:: with SMTP id c86mr8944466lfb.132.1544509161915; 
 Mon, 10 Dec 2018 22:19:21 -0800 (PST)
MIME-Version: 1.0
References: <CALv=V9Gv6apdWJ9P-80zf9bgByd=c3QqPhRHuw6o0_OaH0=W6g@mail.gmail.com>
 <CAHmME9rQPtrSuqHmtRVTGj4N38P806Sph0=q8vXRF8tu8uruiQ@mail.gmail.com>
 <CAHmME9qh+3sR-YL0OVJ4+t+qmutU0j=mJM==5L3QQAZ5Ux4mJA@mail.gmail.com>
 <CAHmME9qVH0sZyEbSuE3mXJ12Lz8zJMPZ43ZRDYQA6n4CmjADrg@mail.gmail.com>
 <CALv=V9HhyzsGrJbi95EQMsk=XKk_WMcwTXtg+VwjJOp=qSJC=Q@mail.gmail.com>
In-Reply-To: <CALv=V9HhyzsGrJbi95EQMsk=XKk_WMcwTXtg+VwjJOp=qSJC=Q@mail.gmail.com>
From: "Berk D. Demir" <bdd@mindcast.org>
Date: Mon, 10 Dec 2018 22:18:55 -0800
Message-ID: <CALv=V9HAyYqDUi9J7LX1GKoWdwL0KvOukmK5B8GD=JO4xpVSOw@mail.gmail.com>
Subject: Re: wireguard-go on android crashes due seccomp enforcement of
 sys_inotify_init
To: Jason@zx2c4.com
Cc: wireguard@lists.zx2c4.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Confirming the fix.
Thanks again!
On Mon, Dec 10, 2018 at 5:53 PM Berk D. Demir <bdd@mindcast.org> wrote:
>
> Thank you for this stellar stewardship.
>
> Will confirm fix in this thread once I get the latest build.
>
> On Mon, Dec 10, 2018 at 17:48 Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>
>> Hi Berk,
>>
>> The fixed version should now be rolling out on the Play Store,
>> probably available within an hour, and eventually in F-Droid too
>> whenever their build infra kicks in. Thanks again for reporting the
>> bug.
>>
>> Regards,
>> Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
