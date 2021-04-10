Return-Path: <SRS0=07kU=JH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47027C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 15:46:06 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B6F7611AF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 15:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B6F7611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 119f259d;
	Sat, 10 Apr 2021 15:43:57 +0000 (UTC)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [2607:f8b0:4864:20::832])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 70b8c25f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Apr 2021 15:43:55 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id s2so6569844qtx.10
 for <wireguard@lists.zx2c4.com>; Sat, 10 Apr 2021 08:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:mime-version:subject:from:in-reply-to
 :date:cc:message-id:references:to;
 bh=8ktKhVs82z04upb/83vkinNb1/YH0Py4ksRvPWtO8kE=;
 b=gTpf40TFABeQsJrDMCcl9hXv/4gSUNrZLw43mAUm7hoeKTHpX+mpA3hsEA4E4SM/bk
 eyOkXMaYIHq21AsfESZsWjM8lUVAuGkqkGQnHLD7sBf2WuhthINHWdxbmEfDSvTLWzim
 VZWb9ZfeXcG5ijxnXrl2i0TD1sqiPAKoQoGJskFDC8rtvWJDfXRniTbnMzNde8WoSNQ+
 2wpa7piGJKdVeLxdicq1vqc1VLBshX9Y7CgeTuw1XGQoQ2NIj4rbu2hKHOUohlHei9Rl
 KAbvaHsvQT7cMR0dMD1UcHzEJ+NpOls+ocaea1PgWk73ZE8DUmFMciqPvaDl21COR5Ux
 bbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:mime-version:subject
 :from:in-reply-to:date:cc:message-id:references:to;
 bh=8ktKhVs82z04upb/83vkinNb1/YH0Py4ksRvPWtO8kE=;
 b=IbWVo9d1zr720j1ts2JJNR6hcmfbNmiOe0LeH7svvsVAulNzjisWi2KA/kLUgbCHnu
 iDKpvWNVTcFBW7KnNg9CQ1pLMcjIoKp1NHtzfAtDlq8r78NySJxRp8bamG01DJ4XsFDX
 1Zek+/lp5Tm1QkRdzDMEiM4IiciYzOlSal6CxyTQvG7ahbOXqQZDqvJ8KVKlYRkS7N2G
 5B9zoThOArJR72UhB6J+7M18wP66nASX+wUZsjaHuzoMCFLsQzkgK8YUQTajgWxqkpPg
 RHL4R3PSAotJPnGKGgfuj4PjAeAwZh0kRkiWRDukqnLfFJcRu0Tk0k18ut694tT3lJeG
 9Deg==
X-Gm-Message-State: AOAM530r8lZvZfun3SsFlBPv6RAFKEaGNXJ/X+WR44BlL0TDNNMF23aD
 U9ur+qxfSOUssXKZRZ6jM+v8Ng+zYTBcsw==
X-Google-Smtp-Source: ABdhPJzmMe5SgE4rN3MDWnleUkSQRk504QjYWlbap0lw1Tj2Z8uF3+Rwhtim6FKulLAdC/S7Rp+itA==
X-Received: by 2002:ac8:45d7:: with SMTP id e23mr12136164qto.137.1618069434528; 
 Sat, 10 Apr 2021 08:43:54 -0700 (PDT)
Received: from [192.168.1.200] (cm-170-253-149-251.maxxsouthbb.net.
 [170.253.149.251])
 by smtp.gmail.com with ESMTPSA id q65sm4227685qkb.51.2021.04.10.08.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Apr 2021 08:43:53 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: T-Mobile 4G/5G CGNAT vs WireGuard tunnel jitter
From: Mo Balaa <buddybalaa@gmail.com>
In-Reply-To: <0BDB7408-22AC-4643-975E-1B5AC3AFADD9@lonnie.abelbeck.com>
Date: Sat, 10 Apr 2021 10:43:51 -0500
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-Id: <378472A1-D6C5-428C-96FE-AC05897826C8@gmail.com>
References: <0BDB7408-22AC-4643-975E-1B5AC3AFADD9@lonnie.abelbeck.com>
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
X-Mailer: iPhone Mail (18D52)
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

Thanks for sharing, I have also been running WG tunnels over T-Mobile home i=
nternet and haven=E2=80=99t seen any of the jitter you are reporting.=20

Did you try the same tests (outbound) without running them via WG?
Which modem do you have? How many signal bars are you getting? Also, what do=
es an non-tunneled speed test report?

Cheers=20


> On Apr 10, 2021, at 10:31, Lonnie Abelbeck <lists@lonnie.abelbeck.com> wro=
te:
>=20
> =EF=BB=BFGreetings,
>=20
> I have been testing the T-Mobile Home Internet (4G/5G fixed wireless) serv=
ice to a Linode VM via WireGuard.
>=20
> The TMHI service uses CGNAT plus an additional NAT in their modem/gateway w=
ith a MTU of 1420, so WireGuard is configured with a 1340 MTU.
>=20
> Everything works, but I thought I would share some jitter results that rea=
ders here might find interesting.
>=20
> [gw-lan WGIP:10.4.1.1] -- [TMHI modem/gateway] -- 4G/5G/CGNAT -- [linode W=
GIP:10.4.1.10]
>=20
> gw-lan ~ # mtr -wn -c 30 -s 1340 10.4.1.10
> ...
> HOST: gw-lan      Loss%   Snt   Last   Avg  Best  Wrst StDev
>  1.|-- 10.4.1.10  0.0%    30   88.7  88.9  77.2  99.2   5.4
>=20
> Looks to be as expected, in the direction of the CGNAT, now the other dire=
ction, against the grain of the CGNAT ...
>=20
> linode ~ # mtr -wn -c 30 -s 1340 10.4.1.1
> ...
> HOST: linode     Loss%   Snt   Last   Avg  Best  Wrst StDev
>  1.|-- 10.4.1.1  0.0%    30  206.1 243.5  73.8 393.9  97.9
>=20
> Huge jitter, and is very reproducible.  But no packet loss.
>=20
> Further investigation shows for low traffic rates (linode->gw-lan) the jit=
ter over WireGuard is huge, here are some UDP iperf3 tests showing how the j=
itter goes down as the traffic rate is increased.
>=20
> linode ~ # iperf3 -c 10.4.1.1 -u -b 5k -t 30
> ...
> [ ID] Interval           Transfer     Bitrate         Jitter    Lost/Total=
 Datagrams
> [  5]   0.00-30.25  sec  18.9 KBytes  5.11 Kbits/sec  68.428 ms  0/15 (0%)=
  receiver
>=20
> linode ~ # iperf3 -c 10.4.1.1 -u -b 10k -t 30
> ...
> [ ID] Interval           Transfer     Bitrate         Jitter    Lost/Total=
 Datagrams
> [  5]   0.00-30.30  sec  37.7 KBytes  10.2 Kbits/sec  82.411 ms  0/30 (0%)=
  receiver
>=20
> linode ~ # iperf3 -c 10.4.1.1 -u -b 50k -t 30
> ...
> [ ID] Interval           Transfer     Bitrate         Jitter    Lost/Total=
 Datagrams
> [  5]   0.00-30.14  sec   184 KBytes  49.9 Kbits/sec  7.532 ms  0/146 (0%)=
  receiver
>=20
> linode ~ # iperf3 -c 10.4.1.1 -u -b 100k -t 30
> ...
> [ ID] Interval           Transfer     Bitrate         Jitter    Lost/Total=
 Datagrams
> [  5]   0.00-30.10  sec   367 KBytes   100 Kbits/sec  4.182 ms  0/292 (0%)=
  receiver
>=20
> linode ~ # iperf3 -c 10.4.1.1 -u -b 500k -t 30
> ...
> [ ID] Interval           Transfer     Bitrate         Jitter    Lost/Total=
 Datagrams
> [  5]   0.00-30.11  sec  1.79 MBytes   498 Kbits/sec  1.308 ms  0/1456 (0%=
)  receiver
>=20
>=20
> So using VoIP a higher bitrate CODEC is actually better w.r.t jitter.
>=20
> Hope others find this interesting.
>=20
> Lonnie
>=20
