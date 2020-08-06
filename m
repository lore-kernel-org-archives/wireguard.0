Return-Path: <SRS0=Qc6R=BQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C202C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Aug 2020 13:48:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A864023128
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Aug 2020 13:48:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQZiGKmr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A864023128
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38c4b879;
	Thu, 6 Aug 2020 13:23:05 +0000 (UTC)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c2e7f6d8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 Aug 2020 13:23:02 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id m7so12790578qki.12
 for <wireguard@lists.zx2c4.com>; Thu, 06 Aug 2020 06:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JOqrYaQxtuXSqOqAUy0o8qc1WhUMADDWfxPAWpVLu5E=;
 b=IQZiGKmrxhLeeAut8jbgWMEP+UAvRYVmdR2gEeyNi5Sl7KfwkvsHknj4oeZPlT/siD
 NuQps9UvojEk5gikkNt625ahi3n7ruksSLkLJ7JMy7sXSL+y4gDzWFi8JeOAULzdA6zQ
 6BknpcTFW6Tn+wHaUBAacPm355vF/unHbsizQGRYS0tJBvrTpjMJ99Wpvi/2vqZhYzwP
 REGGj+H7VHOnRNRxYYwP/GS3+rn/UcBWx52GzeViJ7mXxkvouzhqiMKw2az1ATXlvmLQ
 JM+pthNkxNZwnbd1MM4RWNPRa28lbEoPkuaut+F516U7g9HrC8GYZ3GhIl4tJXS5KOcy
 FIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JOqrYaQxtuXSqOqAUy0o8qc1WhUMADDWfxPAWpVLu5E=;
 b=uj/F2X0YqMt5LqFHWjqRNbIeK7GP/mJA7ILQ6y7t4mDTuleWnaNJa832Uf7nLy8jin
 sTCcfQXsXvtDwoWvF60v+Rh/hxCgohWsrvbiL8G6EWyp+JPiBjVKqrvnXrO7H6fdA0i7
 gmL2TfUSGmeeMA+vWYJctrhYEDoss90b0ku61zCttuYGPi1R/5t947bgA+ap7Kda/MBd
 Nktu5aI89DZMca6MKs+h7AMxB9KV2VtYxdKgXK/9bGmuwyWk8pxdYminiSb5mSgDNmMP
 OmHSwphrtVbfOCU4po6i1Iob+1uvacPnSJfpVIi3JxFvNb41PnNq05Q4ViGgs5cbeFOG
 DfgA==
X-Gm-Message-State: AOAM531Jjb1WJvze8rwd3tI1ABU3V3h7cdQHoaZOfvLql9rTp0MHHu4N
 kLvcGveP/gBBMMe/B5ehVeGP/UlXSvtUAFfkuEA=
X-Google-Smtp-Source: ABdhPJzarnRcVjyviUM7f4Gk5Q19DCc/N+igoC1UEDyG+maa4peanJQICdiEHHNuS032wmioQtDH+tb/pAVXE1s4fjU=
X-Received: by 2002:a37:aacb:: with SMTP id t194mr8939703qke.317.1596721657919; 
 Thu, 06 Aug 2020 06:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAO8prk+D0zuzExJ9KcD5xJT1tGiVVHQO1Bs3ExBoUy7=Y0mhoQ@mail.gmail.com>
 <AM0PR07MB614721A4B6B17011C3DFF7C0964D0@AM0PR07MB6147.eurprd07.prod.outlook.com>
 <CADn-QaMEbXB9T9xMz3QQ0rFOKSGnR0mTgEtydAUrYoPJgULaSQ@mail.gmail.com>
 <01080173c3ec3af0-1dd63a48-4c02-42b8-b52b-0b0b65366ff9-000000@ap-southeast-2.amazonses.com>
In-Reply-To: <01080173c3ec3af0-1dd63a48-4c02-42b8-b52b-0b0b65366ff9-000000@ap-southeast-2.amazonses.com>
From: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
Date: Thu, 6 Aug 2020 15:47:25 +0200
Message-ID: <CADn-QaMR04GkUWY0=WV7-5epLcdWWx72+Sq1nkkKMFL48D5T8g@mail.gmail.com>
Subject: Re: WireGuard macOS App doesn't set system default DNS
To: Shulhan <ms@kilabit.info>
Cc: Gijs Conijn <egc112@msn.com>, wireguard@lists.zx2c4.com
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

Hello Shulhan

Am Do., 6. Aug. 2020 um 15:18 Uhr schrieb Shulhan <ms@kilabit.info>:
>
> > On 3 Aug 2020, at 19.14, Alexander Skwar <alexanders.mailinglists+nospa=
m@gmail.com> wrote:
> >
> > Hello Erik,
> >
> > yes, I know that the DNS is private. This is why I have that on my macO=
S
> > configuration:
> >
> > # =E2=80=A6
> > AllowedIPs =3D 10.136.16.0/22, 169.254.169.253/32
> > # =E2=80=A6
> >
>
> Did you set DNS servers manually in "Advanced" section? If yes, try to cl=
ear it.

No, I haven't set DNS servers in the Advanced section.

> I use macOS too and everything works fine.

Hm. Using the script from https://github.com/myspaghetti/macos-virtualbox/
I created a macOS running in a VirtualBox as a VM. In this VM, I installed
WireGuard and imported my config. The issue could be reproduced.

To make it clear: nothing else, besides WireGuard and the bloat ware from
Apple was installed and the issue exists. This rules out that there is any
conflicting software installed or any bad configuration on my side. It just
leaves macOS and WireGuard.

On my normal (non-VM) system (where I have the same issues), I also
have OpenVPN and the system built-in VPN (IPsec) installed and configured
to use (not so on the VM). These tools are able to set the DNS. So this
also rules out that there's an issue with macOS.

FWIW, "wg-quick" (wireguard-tools) is able to set DNS (but fails to properl=
y
revert, if multiple tunnels had been brought up at the same time - but that=
's
a different issue).

> Did the DNS server 10.136.16.2 is the same VM as WireGuard server?

No, it's not. And it's not limited to 10.136.16.2 as DNS server, WireGuard
also doesn't set it to e.g. 1.1.1.1 or 5.132.191.104 (OpenNIC). It only set=
s
it, when AllowedIPs=3D0.0.0.0/0.

My configuration (where WireGuard does NOT set DNS):

[Interface]
PrivateKey =3D ...=3D
Address =3D 172.31.0.3/24
DNS =3D 5.132.191.104

[Peer]
PublicKey =3D ...=3D
AllowedIPs =3D 10.136.16.0/22
Endpoint =3D wg.....ch:51820

That WireGuard does NOT set the DNS is also visible in the output of
the "dig" command. Eg.:

alex@Alexanders-MacBook-Pro ~ % dig ct.de

; <<>> DiG 9.10.6 <<>> ct.de
...
;; SERVER: 192.168.43.2#53(192.168.43.2)
...

(192.168.43.2 is the IP of my router; it shows that the default wasn't
changed.)

When I use AllowedIPs=3D0.0.0.0/0, the dig output has this line:

;; SERVER: 1.1.1.1#53(1.1.1.1)

Ie. 1.1.1.1 was used as the IP of system DNS.

Thanks again,

Alexander
