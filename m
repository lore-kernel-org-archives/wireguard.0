Return-Path: <SRS0=2ZxM=FW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56207C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Dec 2020 09:19:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68A3E23A7B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Dec 2020 09:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68A3E23A7B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed2bce39;
	Fri, 18 Dec 2020 09:10:45 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c141c69b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Dec 2020 09:10:43 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf0ad7a0
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Dec 2020 09:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :in-reply-to:references:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=DkqJPqjIydFb
 FO18VgTFz2cmuhk=; b=kTYHLhUK74WfCK1Y0Nwxrr3k+VL+KYFX6mOk92PfzFXH
 J62kcv1rbuTGMq2DWoc+u+HVooS1gEroJ3q3xaUCqCensnLmfUMj67m9gGN1rty/
 CRoOZsz7UmTAl8QjyH1qCvmrSc0Yfn88OPIc+bJ74JK74ZuR0/2T9+A8L7vs9m6n
 h9W/rBzz8A6set2qPVA5GPvYSEXHXH9JwWTm5cRVUzfTAqW8a/ATYG5mpm2+deVI
 xepFUOtvOqiMq8yOvy7jg2LfCTOz6isSRxB1Cr48vkYhpwsAk9nxIgCNiW3kH94h
 zZPsv28lCgdo4xxprG4qR8vc5kbv1OZgF3T9iht4PA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 943d30f5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Dec 2020 09:11:29 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id k78so1306380ybf.12
 for <wireguard@lists.zx2c4.com>; Fri, 18 Dec 2020 01:19:20 -0800 (PST)
X-Gm-Message-State: AOAM533bp1au3hkHWb+vMpbcp4aQiJ5eHP3maMpAuQ1RP34y4m9LcXzP
 Q7jtOvINiHZoCeKzLVnxa/S2vnv0E3hoboOgCpY=
X-Google-Smtp-Source: ABdhPJxNJKmEmJb7UumRDanjB4CrpeYViKIxeevUml59VrwgcjOZR2Uo8s75k0hzp82hl2UWP0SZ+HWrNbLh7yEymy4=
X-Received: by 2002:a25:bb81:: with SMTP id y1mr4868320ybg.456.1608283160368; 
 Fri, 18 Dec 2020 01:19:20 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:6c2:b029:30:3e8e:4ce2 with HTTP; Fri, 18 Dec 2020
 01:19:20 -0800 (PST)
In-Reply-To: <CAA6-MF8ZZ1eD+7wTfgzuGaiw8JPM+WiivJ0CxBja3-GZ=GXMaA@mail.gmail.com>
References: <A9F23E70-C8AA-4C54-99E4-63E2E40FE0FA@glenn.id.au>
 <CAHmME9pzNQeEdDnvu8mXFnYHgNibuqSLi5viAtYjDrF0wbEMoQ@mail.gmail.com>
 <CAHmME9qCRWXMVjuz6g6M0wMvhj9v90sTkHNOFCr+Jht-rUNFoQ@mail.gmail.com>
 <CAA6-MF8ZZ1eD+7wTfgzuGaiw8JPM+WiivJ0CxBja3-GZ=GXMaA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 18 Dec 2020 10:19:20 +0100
X-Gmail-Original-Message-ID: <CAHmME9o8VcMiDwCCkOmke25uRFHKSh1Enri4bJ6te014nkPjkA@mail.gmail.com>
Message-ID: <CAHmME9o8VcMiDwCCkOmke25uRFHKSh1Enri4bJ6te014nkPjkA@mail.gmail.com>
Subject: Re: WireGuard on macOS stopped working after 1.0.10 update
To: Janne Johansson <icepic.dz@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On 12/18/20, Janne Johansson <icepic.dz@gmail.com> wrote:
> Den tors 17 dec. 2020 kl 22:56 skrev Jason A. Donenfeld <Jason@zx2c4.com>=
:
>> The macOS update went through, and version 1.0.11 is now available
>> from the App Store. In my tests, this fixes the issue, but some
>> confirmation from list subscribers is always helpful.
>
> So I held off updating until 1.0.11 was out (even though I already used t=
o
> have a DNS =3D entry in the [Interface] section),
> but to my surprise I could not form a tunnel with my old configs. The gui
> says "I sent 186 bytes" (number not necessarily correct)
> and tcpdump showed I sent a packet to remote, it sent one back and after
> that tcpdump goes silent.
>
> The wg gui logs just went:
>
> 2020-12-18 08:48:52.045 [NET] peer(RQkh=E2=80=A6JERY) - Failed to send ha=
ndshake
> initiation no bind
> 2020-12-18 08:48:57.297 [NET] peer(RQkh=E2=80=A6JERY) - Handshake did not=
 complete
> after 5 seconds, retrying (try 2)
> 2020-12-18 08:48:57.297 [NET] peer(RQkh=E2=80=A6JERY) - Sending handshake
> initiation
> 2020-12-18 08:48:57.298 [NET] peer(RQkh=E2=80=A6JERY) - Failed to send ha=
ndshake
> initiation no bind
> 2020-12-18 08:49:02.546 [NET] peer(RQkh=E2=80=A6JERY) - Sending handshake
> initiation
> 2020-12-18 08:49:02.547 [NET] peer(RQkh=E2=80=A6JERY) - Failed to send ha=
ndshake
> initiation no bind
>
> So I tried removing my DNS entry, and now it works. So you seem to have
> made it the opposite in 1.0.11, now one can't have DNS in the [Interface]
> section, or the tunnel will not start.
> I run my own resolver on 127.0.0.1 for now, so I can work around it, but
> this seems very weird too.

Please send the complete logs along with the (redacted) configuration
file that caused the issue. I need to be able to reproduce the issue
in order to evaluate it.
