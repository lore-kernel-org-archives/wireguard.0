Return-Path: <SRS0=CBQl=5I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5A0C10F26
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2020 05:19:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08DA520409
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2020 05:19:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="CuZ497ZG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08DA520409
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06f0ca4d;
	Mon, 23 Mar 2020 05:12:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1d1a1860
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2020 05:12:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 934286ca
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2020 05:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ExqT1A316Ah3mBXswLxfXSrHc9E=; b=CuZ497
 ZGlTrLWY1lLGeWs7YvCicAZq3Xr03qJ+XoUv+ynBE7ptVkMspUNSvdA5eG7Pxl+f
 Qa4drzvFaMGHVemRFKvJj+tx5EmcmoCyotiSPZj8EWJeEvD9qNsiBLjPAbBWv1nD
 LMt3h1F2jazwB2V9DiF0EDGZAJREIueqCFReI2OUuUj0j6Yh8YKQWFcRo5DnDuBX
 ioozh4Ts/34PWPyRv2GQNioxlPXKt0GTxgdM34Z/CX+2iyQ/rYaVbAEhgJs2FBo8
 laEX3pYkvLIYVtYhVY6do6baoKY1oqkKb9OaS81rNuzB7h5rX9RRUIfr31S71pu0
 thq5ofJLBFuKRCSQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ffbd67ef
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2020 05:12:23 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id t11so2101235ils.1
 for <wireguard@lists.zx2c4.com>; Sun, 22 Mar 2020 22:19:20 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0Uf3gXtOyZbJ1WNN7Y5iLp5QBRl4OAkR+j91pOrbr78OIzCJts
 oJvucf7qHhDXfZ7oyyEPdgEsU8QMIjI+RT1JGrw=
X-Google-Smtp-Source: ADFU+vu3B/y44pC6jc5vIwe/cxPafg26JnoYtESbPppa9fjzAOdyqv5b+IVdbw28O5U5iIYjM/KqqSHpMRvZgScliG0=
X-Received: by 2002:a92:358b:: with SMTP id c11mr18550920ilf.64.1584940759697; 
 Sun, 22 Mar 2020 22:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <7273dde5-290a-7657-1c4e-3397db01038b@electromail.org>
 <CAHmME9qd6-Q+XNPeC0xNg+1Dgrc71dwimJ2m5ES5YP_qDRmG=Q@mail.gmail.com>
 <CAHmME9r_DdK36d+Eh8_JwntDnVn_axHNPf93XcXikroPPoBjcw@mail.gmail.com>
 <CAA2ss9GtgnqXYC9ew6_RtA-VtyvVa2Bi3UUb1nUPH8gd7J-F4A@mail.gmail.com>
In-Reply-To: <CAA2ss9GtgnqXYC9ew6_RtA-VtyvVa2Bi3UUb1nUPH8gd7J-F4A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 22 Mar 2020 23:19:09 -0600
X-Gmail-Original-Message-ID: <CAHmME9qA_cjndBLzcENgboHdw6+pt5ac-jtY7YimT4622Suz6g@mail.gmail.com>
Message-ID: <CAHmME9qA_cjndBLzcENgboHdw6+pt5ac-jtY7YimT4622Suz6g@mail.gmail.com>
Subject: Re: using wireguard intents from tasker?
To: Eiji Tanioka <tanioka404@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Harsh Shandilya <msfjarvis@gmail.com>
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

On Sun, Mar 22, 2020 at 11:11 PM Eiji Tanioka <tanioka404@gmail.com> wrote:
> Which is more appropriate to provide translation for this feature,
> Crowdin or Patch?

Whichever you want is fine with me, but I think Harsh was trying to
get people to use this Crowdin platform. He's CC'd and can express his
preference.

Jason
