Return-Path: <SRS0=nQDx=PZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131BAC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Nov 2021 09:47:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2037160E98
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Nov 2021 09:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2037160E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f944dbfd;
	Sat, 6 Nov 2021 09:47:18 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 33289973
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Nov 2021 09:47:17 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id s5so11172773pfg.2
 for <wireguard@lists.zx2c4.com>; Sat, 06 Nov 2021 02:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=hVESg36CRg0g/nrezjVY/6OWnQI+yGvL1TNpkclDBNI=;
 b=omC4SqNCWliJtskUwiqsAPQVXwo6800N56u3darAflNxG2TYq+0QGucZ8xGecjhiDG
 7bl4vCX5Qsvyw1F8mw/YOH90QOs1yUw5WR77vhX/fFh6EjrcUPzEr0w4Bxvc+bGLCwFC
 s4oB/OZjdP1qnfn8/M8rp+LZbO9v/ZyvNJPfNpwWbqTxE0x4EEBsr7gGkpOCBnAObPfb
 r4AYtLXLmUiFuLu7AKcmDMl1OiPrGQnXc2lOtLdFSOjD4RmrUtKh7/o1g+u2fOvAvfBm
 3GG1KYGHFFkkRBCY6yGlDMxY5GMb+Z7hmrUDUX6b1BYRRcBr7yVNdjc0nOddHJUOigkC
 g1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=hVESg36CRg0g/nrezjVY/6OWnQI+yGvL1TNpkclDBNI=;
 b=iKWR2wmGJhOqLTfIhwty9vHkP1KplfriVYp+G7b29DyBMolfejm6JfecUbxKTuL9Qq
 kIrAEEKN1m4IrR8ryvZsFFavjYgkgjJdzC1ivEdOtCX9uBrGIe8OUDEHRf3T1QXr0MUB
 RD6Gco/SqTS86+MQouLtuAAbUHApjI40L4QjvUNEgdvqotT8kC8tzHj5Yz9QBsyeqG4n
 FGp2SLQ30MSi1DrCufZzEzGCqt904VRHEzNaB7wtH8GxbXLdgAM6A963WAciTwBAil+Z
 s+/f2B1TJBbvddrhw/vMIsYr7Sq1+28Ow8wDx4TxgI2awmWCpn6r9oifXR0yCs2IzmMD
 +5eQ==
X-Gm-Message-State: AOAM530XvPr1HyFTl+XX6FlzyFjXpcaLxBmxkhJCAriwLM0ct+bhgjpX
 ImlLVP5jvCG/ZXntTkKDkm1563BEBPB4M4VnNXEpLg5gZVE=
X-Google-Smtp-Source: ABdhPJxy36V7xOhb+SYfii5scTxd/r6Y+Mg+6o8t/YK4rHj6tU9W/vvyqaCBQz5cFgrqCX3Mt22QURpxDavPcZ9rUb8=
X-Received: by 2002:a63:ff5f:: with SMTP id s31mr6661426pgk.189.1636192034843; 
 Sat, 06 Nov 2021 02:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211028071638.88001-1-stephen@slarew.net>
 <0e80daf1-b4c2-b177-28ca-79e6575a339c@baywinds.org>
 <ED3FB4B3-96AD-4B98-86EC-D9F7999A530F@slarew.net>
 <K25247-14.1635527002@spamhaus.org>
 <E3607380-8E46-42CC-80B5-BB38F206E9BC@slarew.net>
 <c700d141-5348-4ce5-9398-dfb281383607@www.fastmail.com>
In-Reply-To: <c700d141-5348-4ce5-9398-dfb281383607@www.fastmail.com>
From: Matty Driessen <mhp.driessen@gmail.com>
Date: Sat, 6 Nov 2021 10:47:03 +0100
Message-ID: <CAHsVW7PFws2zMQnAUDv0J+=_kxMqXD+V1SVExrZx9g1jaovCPg@mail.gmail.com>
Subject: Re: Split DNS for macOS
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hello Dave,

Thank you for this explanation and the challenges that come with split-DNS.

The biggest gripe I have with the current implementation in WireGuard
is that the search domain is not set as a global search domain when
using a split-tunnel. As you said the reason for this is "If you want
to fully capture all DNS traffic but also set some global search
domains, you can list both the empty string and non-empty strings in
`matchDomains`, and you'll get that behavior.".

When I use the same configuration file with the wg-quick utility the
search domain from the configuration file is set as a global search
domain. I think this is the case for all OS'es and should at least be
the case when using the WireGuard UI tool as well?

Regards,
Matty

On Sat, Nov 6, 2021 at 5:59 AM David Anderson <dave@natulte.net> wrote:
>
> On Fri, Oct 29, 2021, at 14:07, Stephen Larew wrote:
> > As I understand it, under some circumstances, the Tailscale macOS app a=
lso implements split DNS in roughly the same manner as done in my patch. Na=
mely, the tailscale app appears to use the Network Extension APIs to direct=
ly integrate with the macOS DNS resolution machinery. Perhaps the relevant =
difference is that tailscale approaches configuration differently (not base=
d on wg-quick) than the WireGuard macOS app.
>
> Hi, Tailscale person here.
>
> Yes, the Tailscale macOS app supports configuring either split DNS. It's =
situationally popular for things like "direct anything under amazonaws.com =
to the AWS VPC internal resolver on the other side of my tunnel", which mak=
es your AWS VMs and such magically resolve correctly without shoveling all =
your unrelated requests through AWS.
>
> The semantics of NEDNSSettings I've worked out so far:
>   * `searchDomains` sets interface-scoped search domains only, which appe=
ar to not be used at all for single-label DNS query expansion. IOW, it seem=
s to do mostly nothing - or at least, I've not discovered anything it affec=
ts.
>   * `matchDomains` specifies what DNS suffixes should be sent to your res=
olvers (specified in `servers`). Specifying a list of suffixes here impleme=
nts split-DNS. Specifying "" (the empty suffix, which matches all names) ca=
ptures all queries.
>   * `matchDomains` _also_ installs any non-empty string you specify in th=
e global search path.
>   * `matchDomainsNoSearch` lets you make `matchDomains` be just match dom=
ains, without modifying the global search path. You don't get more granular=
ity than that, either all `matchDomains` are search paths, or none.
>   * If you want to fully capture all DNS traffic but also set some global=
 search domains, you can list both the empty string and non-empty strings i=
n `matchDomains`, and you'll get that behavior.
>   * You only get a single set of resolver IPs. This means you can have ma=
ny DNS suffixes with `matchDomains`, but all of them will go to the pool of=
 `servers` you provided. You can't route foo.com to 1.2.3.4 and bar.com to =
2.3.4.5 without having another intermediate proxy to break things out furth=
er.
>   * Apple's DNS management service only installs the "default" resolver i=
nto the legacy /etc/resolv.conf, so a bunch of commandline tools inherited =
from BSD will be completely unaware of split DNS configurations, because th=
ey don't use whatever the "correct" resolution API is (I presume mach port =
something something).
>   * Apple doesn't have a public API for reading back the OS DNS settings,=
 because they don't want other applications poorly reimplementing the OS's =
algorithm for selecting among contributed configuration. There is presumabl=
y an undocumented API that scutil et al. can use to read things out, but I'=
ve not dug into that at all.
>
> Regarding upstreaming: OS-level DNS capabilities vary wildly across linux=
, apple and windows, and across versions of same (e.g. Windows 8+ can do sp=
lit DNS, Windows 7 cannot - but WSL/WSL2 can't on any version to date). I c=
an ramble at length about each OS if desired, but the bottom line is "send =
all DNS to these servers" is the only configuration that can be implemented=
 reliably on all of them.
>
> So, the question would be: do you want upstream WireGuard applications to=
 have consistent behavior on all platforms? If so, you have to either foreg=
o split DNS, or do a lot of work to polyfill missing features on each platf=
orm (Tailscale's attempt at this is https://github.com/tailscale/tailscale/=
tree/main/net/dns). Or expose the uneven feature surface to the user, and d=
elegate the pain of non-portability to them.
>
> - Dave
