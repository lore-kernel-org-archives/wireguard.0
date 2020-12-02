Return-Path: <SRS0=K6Kf=FG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72820C64E7C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Dec 2020 18:16:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ACD8205F4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Dec 2020 18:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ACD8205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=tailscale.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22482ba2;
	Wed, 2 Dec 2020 18:10:01 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8464d490
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Dec 2020 14:11:03 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id z1so3923146ljn.4
 for <wireguard@lists.zx2c4.com>; Wed, 02 Dec 2020 06:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tailscale.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ghmrq4yePq3OvfFuJt7bD4d0qOcT5Lf4eNYZhV2gijY=;
 b=AJB1FwOCIejsaj21dwlaNk7CucfaeJ6Dn8dYugkilBOmrVZRSFeSWH2qsgPp0Xnf3/
 lCMRw/YJYRrQHjW7V2CkWGoUZhVb7L3Dm3j/LxBNpFKeXOMXU2aKXz+s17xOxtGxo7Vl
 hMxpToEvxIA1r/JnjthLg6FrgBrQRHyt5PkkRHKyCYUQ3l/lVBlDOcVG/TjAB/ECVzJQ
 k8G0isiIPa6JJCuLoyCUikOJnJUW5Bc0MuE6BTihNwVFo22BJcflK1gjnPhbqGD9lRZU
 X04jAEtPIa5hGWlNKDoBdE48Ko4dfKp3/47yZpeuZ7CE6kDd15copZEttNjf/6WTFoFQ
 evDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ghmrq4yePq3OvfFuJt7bD4d0qOcT5Lf4eNYZhV2gijY=;
 b=SgvbmV5v9O3HhrZeklCCrEY0ZUn7LFI+Gk/S4RQQIifyQUoMbA+I938KYRKJqKOkwB
 dP61u0cWoDn9iAvahAm1dwmEqxzG9LCvNh661xEY7EChja02v9jsZfgnY8kkmGG2Qfuw
 yvO5dO6xXXbFTL7+mCh6DuqV2StbylhvY1B8kQoarojg98VCPxd4FSpyHHMua2yc04EY
 c7yydF+2lXOdRt3oD6UuDbT4cQXn1BIza9ahlP9AQnLDpAySMSUggZvh6cMAJGWQI8hb
 nnTy12P18yKjFfs4vLvibriIyNUH767++AVigEgJn4TZIKpTWXGYpzmjY0NSfcAcEI4f
 NCDQ==
X-Gm-Message-State: AOAM531v/S03HEc6okrggAtBiSIJlePICnNpllr5WmrlK+LkjZ+CKFhu
 loJAqZPMVdNyIiCEikQQqzHkHlYNWzhvAHTNnTWxHA==
X-Google-Smtp-Source: ABdhPJw2E1U2DMQ9L+GYVOcJ4MUvg9b13Cc+7IzKTjF7K5q70Xm7sltngIse1IXDhGj1bqk/ZsKZ6N4VZJUoSh0NrHc=
X-Received: by 2002:a05:651c:3cf:: with SMTP id
 f15mr1284122ljp.118.1606918656313; 
 Wed, 02 Dec 2020 06:17:36 -0800 (PST)
MIME-Version: 1.0
References: <9f61c27c-3cae-3283-30e0-ce99fe73a305@al2klimov.de>
 <1d429a71-415e-2623-e0b5-34cca394ae9c@astro.ucla.edu>
In-Reply-To: <1d429a71-415e-2623-e0b5-34cca394ae9c@astro.ucla.edu>
From: David Crawshaw <crawshaw@tailscale.com>
Date: Wed, 2 Dec 2020 09:17:25 -0500
Message-ID: <CANdrats9wwABmNEnP4SVQPZF5KitahcAQitWR1-_8GV9pSCwoA@mail.gmail.com>
Subject: Re: MacOS: DNS setting has no effect if the tunnel is not the default
 gw
To: Chris Johnson <johnsonc@astro.ucla.edu>
Cc: wireguard@lists.zx2c4.com, 
 "Alexander A. Klimov" <grandmaster@al2klimov.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 02 Dec 2020 19:09:59 +0100
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

On Wed, Dec 2, 2020 at 8:48 AM Chris Johnson <johnsonc@astro.ucla.edu> wrote:
>
> I am now running into this problem. I'm still running Mojave (10.14.6),
> if that makes any difference.
>
> If AllowedIPs is everything, then /etc/resolv.conf is modified with the
> remote DNS server.
> If AllowedIPs is a remote private network(s), then /etc/resolv.conf
> remains untouched, and DNS is local ISP.
>
> Did you ever find a solution or workaround? I do not want all of my
> traffic to go through this tunnel, but I *do* want DNS to resolve for
> those private subnet hosts.

I believe this behavior has changed in macOS 11 (Big Sur), and
resolv.conf is updated even if you don't set a default route through
the tunnel. I could not find any Apple API that can change this on
earlier versions of macOS.


> Cheers,
>
> Chris
>
> On 2020/10/31 07:38, Alexander A. Klimov wrote:
> > Hello there!
> >
> > I have two almost identical tunnels. The only difference:
> >
> > -AllowedIPs=0.0.0.0/0, ::/0
> > +AllowedIPs=192.168.234.153/32, 64:ff9b::192.168.234.153/128,
> > 192.168.234.186/32, 64:ff9b::192.168.234.186/128
> >
> > The first one's setting DNS=192.168.234.153 has an effect, the second
> > one's not.
> >
> > Has anyone seen this problem, too?
> > Does anyone even know how to workaround it?
> >
> > Best,
> > AK
