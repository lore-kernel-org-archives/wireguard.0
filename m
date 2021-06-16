Return-Path: <SRS0=aBj4=LM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174B2C48BDF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Jun 2021 15:24:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE72B613BD
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Jun 2021 15:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE72B613BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mullvad.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a438dbfd;
	Fri, 18 Jun 2021 15:24:18 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5caa38b4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jun 2021 13:25:52 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id s15so2645766edt.13
 for <wireguard@lists.zx2c4.com>; Wed, 16 Jun 2021 06:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=5dCXizjOTRXAeDSyD6C86/v6D3Z2qH3loQc6y9gecmc=;
 b=D1noSHvAy1/sVe7LSanvt73LwXFUZGX27Xxro2XIOAJfYXU2gDLejcygnCuOESFyUQ
 lfPD6TCIimraJVk+GlUJbjaOC1sbQEOnlUSebY9UCuqFyyJk4sut0eUFaLUXMKuf6b6S
 6top+eHJluukaAR9mez3KlFfM2K8NHd7mk0c+KUXz9jggRwkdo+B/5tDvDUoSBdudQ6i
 N9TEvjz1QDOaHhG/5kgCgI9DSJE5VCqE7vhiWGjStitCaGUpzVLPkMRvKb3wlnSChRvt
 0S95JOfHlEV1qODHXajuzagk1hytxbyrDRMMiRkr11eOPE8+vHHz6DxIuUPt1Kgpak8e
 +WOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=5dCXizjOTRXAeDSyD6C86/v6D3Z2qH3loQc6y9gecmc=;
 b=aBK3jX5CvlVkxtNTF5mC8NP5NCa6XTdEdqFdXNs/oCzwshpDQLD550DS/h//gBM27o
 RdQLNSRoKDMCEg9DbSTMvdY46KRrd9q5nBWfgMNqbhxutFyKBfeAPfYQiX6sLD06uhx/
 M9eKBkxjz4rWNWxejCncnu+74Ul4j5pa3fcEaDF+LuQx2eUleD//vGqTX+WchhWZ3631
 bITuHgCJpSByTFMwCUIQGsG52Ze2q03aS8xDu6bc97BvG//lJ1aJthHYomdkV4qP13gq
 H0zTDWExpenaT5tByXwWAwmvJxxftkiF+cC76TJXWoTWag/WRxk9RIILvD4qnnLSjLgI
 JfeA==
X-Gm-Message-State: AOAM533luMP7b7YRqNryEdKaHS3p259k+hGABQO7bOs+0Le+hckYpfOT
 U4ukJLoHPKbSRaB1fEjk9XYXCtbSgGb92Q==
X-Google-Smtp-Source: ABdhPJzEoV6sRg3oeuB582/NheDinSY4eMCM1u4MRceMvTO3DUMd9eYsbMYiQQ4KuhVPnwWo43vvuQ==
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr2122720edc.319.1623849951844; 
 Wed, 16 Jun 2021 06:25:51 -0700 (PDT)
Received: from smtpclient.apple (87.119.154.76.ipv4.telemach.net.
 [87.119.154.76])
 by smtp.gmail.com with ESMTPSA id m16sm1607175ejr.74.2021.06.16.06.25.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Jun 2021 06:25:50 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: WireGuard is broken on iOS 15 beta
From: Andrej Mihajlov <and@mullvad.net>
In-Reply-To: <CAHmME9pKnJouF-Vf20y+1w_TUs1vj1bpOggd+dgm8epfN+8-MA@mail.gmail.com>
Date: Wed, 16 Jun 2021 15:25:47 +0200
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A28ECC96-A28E-425E-90E3-E3C4D1B2E3E2@mullvad.net>
References: <760B19F6-17E7-4276-B2E2-DFE07AB19323@mullvad.net>
 <CAHmME9pKnJouF-Vf20y+1w_TUs1vj1bpOggd+dgm8epfN+8-MA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Mailman-Approved-At: Fri, 18 Jun 2021 15:24:16 +0000
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

It was less about performance but more about security. Just wanted to =
share some good news!

A little bit of background story:

There was an article a little while ago that highlighted a traffic leak, =
when connections established before the VPN would continue going through =
the primary interface outside of the tunnel:=20
https://protonvpn.com/blog/apple-ios-vulnerability-disclosure/

Then at some point around iOS 14.2, Apple introduced a kill-switch to =
address that issue (via VPN configuration flag).=20

However it never really worked with WireGuard as the tunnel would always =
fail to establish the connection with peers. There is a thread on Apple =
forums with some of Apple engineers trying to figure out what=E2=80=99s =
going on:
https://developer.apple.com/forums/thread/653116


Now it=E2=80=99s too early to say, but I just ran WireGuard with kill =
switch enabled on iOS 15 beta and the tunnel is magically up and =
running, which was still broken on iOS 14.3. I am going to test it on =
iOS 14.4 today too. So it looks like Apple did something to fix their =
SDK to make the kill switch work.

Potential low effort improvement for WG, in practice it looks as such:

let protocolConfig =3D NETunnelProviderProtocol()
if #available(iOS 15.0, *) {
    protocolConfig.includeAllNetworks =3D true // kill-switch
    protocolConfig.excludeLocalNetworks =3D true // enable LAN =
networking
}

Cheers,
Andrej

> On 10 Jun 2021, at 13:51, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> Patches with a proper performance comparison of the two techniques in
> the description would be appreciated.
>=20
> Thanks,
> Jason

