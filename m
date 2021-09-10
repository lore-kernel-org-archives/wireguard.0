Return-Path: <SRS0=byHU=OA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6924AC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 Sep 2021 20:56:51 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7695F611B0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 Sep 2021 20:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7695F611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=meshify.app
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9d23807;
	Fri, 10 Sep 2021 20:56:48 +0000 (UTC)
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [2607:f8b0:4864:20::f2e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d04eeacb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Sep 2021 20:56:45 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id s16so2142980qvt.13
 for <wireguard@lists.zx2c4.com>; Fri, 10 Sep 2021 13:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=meshify-app.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=10Va0E0BQ/W2Y9EhiqPM7BX+TDcCM4m0aQDgWWEyQFU=;
 b=KvPrKUIyYwwmHOciKf4T1JuSGqOwnGik5MkwqgtYaycZ6rZznlXYfVeoW0bL1Kyhs6
 rHd1RaAeJYZBNsMV5ZZpGczFrvp30BRTYBy5DanuQ5ukH4mdBTpaB0FIj8I4Up41Yw77
 uflUfOqA4yVOHpFIRnEIw7/b32D8EZh5UrxfZKPngkZeu0Q1cy7QsjWyYoAGyXrQLvv4
 KckG46u7yPwZIZ60797grUfEmku8OtG4YEJvMyN3leRWYX7XHToZKOmlcUmjIjRBip8P
 6LWXt89MUf9CXmjUCpuO3pIHFa3dOF0jw+QC2bt35YoYxzgAwk+WWnW20kuoom5RN4HW
 U7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=10Va0E0BQ/W2Y9EhiqPM7BX+TDcCM4m0aQDgWWEyQFU=;
 b=v/EWxlx6VfSKltSMq/V5VPlez72hMrC0ZhHcbxRC+LOxyXYMDiHtAXRJPvD0C5PGiG
 UnQnu7fps4Sfx2C5Q/i8EZdf6yFlf1svwGzSolzydWlMnKIxJK3ufGQ+LmRPzqEfy0dN
 hA0ShVhbCIxJdWMWJnemtKpaa0j6e9KDv5BVveHC2MUf6Na71LAkcW9upOVPSiOzqP8d
 JFllO6UueRm6VudZSKj+fxCMpFJrf1R1luOXykfevbn5aJQ5BNB08icoz9T+9wcIAN6L
 A6QDnzaqQ4ar1w64uoBn8I4Lqphm86irkMoTZRTLN6MhQUseWecE3+8D+rQfvBiU53Kf
 KVpw==
X-Gm-Message-State: AOAM5316qhvjd3bugyfRaKFKS+S3sJynBZr6XnHFdefPdMLrUnECCJdG
 hWNsGK2jqI3tuYiAtE3lVa6QGsEgrGGni41b0ns5svRcn5KYfA==
X-Google-Smtp-Source: ABdhPJycgqriBfaBE3rV/HHY6dCQLpSex8oIkM9NFe+MOuCboerEaJtOXUBoRVBH5lyd93S/lJV1YLrGYs31SgU4weA=
X-Received: by 2002:a05:6214:723:: with SMTP id
 c3mr10561700qvz.60.1631307403959; 
 Fri, 10 Sep 2021 13:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <00042bf6-4e8c-8638-380d-6774b37f96c2@blackberry.com>
 <CAHmME9qXieNWU_Y5rz1eDM9Bh=YjBPaeQFTrsXr4PKHyh1ePRA@mail.gmail.com>
 <310f3386-a488-9e28-2f10-3f867ece0f53@blackberry.com>
 <CAMeHLtxw939uNJcN=UZAR9wM10pB2xYOu2K_X++Z8LsfPCAmNw@mail.gmail.com>
 <c84c5f5f-6c47-e109-7592-cd7353761657@blackberry.com>
In-Reply-To: <c84c5f5f-6c47-e109-7592-cd7353761657@blackberry.com>
From: Alan Graham <alan@meshify.app>
Date: Fri, 10 Sep 2021 13:56:31 -0700
Message-ID: <CAMeHLtwY4Gia=+tkKRYUE4HTz4RGvqwTVSuaxqw9LpVg0yrKTg@mail.gmail.com>
Subject: Re: Wintun NeighborDiscoverySupported
To: Brad Spencer <bspencer@blackberry.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

I mainly reached the conclusion that it's not growing indefinitely by
looking at the results in the arp table.  There weren't duplicates or
other errors which might suggest the arp table wasn't working
properly.  I believe it is, in that it should be aging out entries,
etc.  I also stopped and restarted the wireguard service and it
cleared the cache as it should.

I also noticed the Powershell Cmdlet used the wrong filter parameters
when trying to set NeighborDiscoverySupported, as you did.  My
expectation would be to get an error invalid parameter like with
NeighborUnreachabilityDetection, not that the filter returned zero
results because it used the wrong query.

Best regards,
Alan Graham


On Fri, Sep 10, 2021 at 10:19 AM Brad Spencer <bspencer@blackberry.com> wrote:
>
> On 2021-09-09 5:23 p.m., Alan Graham wrote:
> > Adding the 0.0.0.0/0 (or ":::") to the config is what is causing some
> > growth of the arp table, but it is not growing indefinitely.  After
> > looking around for SupportsNeighborDiscovery and finding nothing, I
> > decided to check the repro.  When not routing all traffic through an
> > interface the arp cache is basically static:
>
> Thanks for looking into this, too.
>
> I also suspect having the gateway set like this is probably necessary
> for Windows to start adding ARP entries.  How were you able to determine
> that it is also sufficient?  My guess is that if it is possible to
> indicate to Windows that the interface does not support neighbour
> discovery in general, doing so likely prevents ARP entries regardless of
> the gateway values.
>
> BTW, how did you determine that it does not grow indefinitely?
>
> > So I tend to agree with Jason that this is "harmless" and shouldn't
> > cause any serious problems.  It would be nice for Microsoft to fix
> > Set-NetIPInterface, it looks like a bug that SupportsNeighborDiscovery
> > can't be set.
>
> One "harm" might be that the OS keeping an easy-to-query list of all
> (recent?) destinations in the ARP table, which could be undesirable.
>
> I'm not sure it's a bug, per se.  It seems by design that you cannot
> change the value of SupportsNeighborDiscovery after the interface is
> created.  The documentation for SetIpInterfaceEntry()[1] says:
>
> > The MaxReassemblySize, MinRouterAdvertisementInterval,
> > MaxRouterAdvertisementInterval , Connected, SupportsWakeUpPatterns,
> > SupportsNeighborDiscovery, SupportsRouterDiscovery, ReachableTime,
> > TransmitOffload, and ReceiveOffload members of the MIB_IPINTERFACE_ROW
> > structure pointed to by the Row are ignored when the
> > SetIpInterfaceEntry function is called. These members are set by the
> > network stack and cannot be changed using the SetIpInterfaceEntry
> > function.
>
> I noticed that the Cmdlet in PowerShell seems to treat the
> -NeighborDiscoverySupported option as an input filter vs. a value that
> you can set.  While this surprised me, it is at least consistent with
> the Win32 API docs.
>
> 1.
> https://docs.microsoft.com/en-us/windows/win32/api/netioapi/nf-netioapi-setipinterfaceentry#remarks
>
>
> --
> Brad Spencer
>
