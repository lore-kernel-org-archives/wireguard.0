Return-Path: <SRS0=OOGf=LI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85A1C48BE6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Jun 2021 07:53:46 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA83261289
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Jun 2021 07:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA83261289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a9b54b8;
	Mon, 14 Jun 2021 07:51:33 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 45a28063
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Jun 2021 07:51:31 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id ce15so15027264ejb.4
 for <wireguard@lists.zx2c4.com>; Mon, 14 Jun 2021 00:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=uTWnWG4Ar80Ad+qpkm/noTBoE2DA24wS7NjLW0STf8k=;
 b=kH0/uwIPiwy02s15n4s9RoshyVm1H6D0qjY0Z6O8ZlmH3vqwhEYPg++QFGBnL73+xn
 aSyz2Hs9ujLgH8HpT8moKrj42KP40oBbwuS/skDBzv1M0FwiIy6ZgVl53YSrFnNPVSKN
 xSRufddBADn3a2YGWtC2PcaWh/gSHiK8Jp+CVbtC7SE9Zbq6wdfMQWmwcSOfqkrdX3vW
 kEfhDSkd/2Y2TbgKZldeQiUexu3goaGMkN/iQN+QqieNMSOw3w4WcTb81ntdB4jIlUnE
 R287kenoI4uNQomKKOyVmDZ6TGLj3ljugaxq/7xILda0L89ujttzkOBxLboHwbjLL0fh
 cSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=uTWnWG4Ar80Ad+qpkm/noTBoE2DA24wS7NjLW0STf8k=;
 b=N51OhXT1j8zwpF1nRmBg6PmYVyy7ooWWJdB2PQWWpfP+Rnx5+d0zGxpkmItbifptsB
 rMuC7/4DFI8Nbeex53GnY82po9j8xXsV4EkAE7JIcqCfO0urri8kwvH2NQQ9AoEJVuxV
 Eqk9yo3hPaAdaUYFuXBiUYNE67YmtVEQEPFZEN44wG27OQM023rv3OqK5qZy5L9nlRqM
 UgYlAZMTQnNhg2dEFnxuS0VWn40HUYBPeGbaShRqezbnYcuuucZ6IGvxhcYc0QsmL3fi
 seg/7xKfP51BD4tHRNLVDUXAFVzoVCZqZ1NSlHks0aRAOqz19QHrwl3ZDw/uonk28k+A
 JTcQ==
X-Gm-Message-State: AOAM532ALxR7DApdflZ1YuZBTDv1tt1qQTlW48FSyAUrYJIdCI5/40Yv
 2V8vDtv9HXBwacBeAbSw/HhlVsep+G3gTC/s14W9FLSpg+0=
X-Google-Smtp-Source: ABdhPJxzJFf5hOMbUrkY9yahJVcWWhmX0OAvcolGzyEYzVWiwls3g+5JWcv1c6C97LPFdzLQJ9itb3Iou22Z8Ma1aqI=
X-Received: by 2002:a17:906:e01:: with SMTP id
 l1mr14236448eji.280.1623657090792; 
 Mon, 14 Jun 2021 00:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAF+AZZXLYQtMA7j2ks2uk3SO5NnvSEW3VJ6zxwFG3SUGB736Ew@mail.gmail.com>
In-Reply-To: <CAF+AZZXLYQtMA7j2ks2uk3SO5NnvSEW3VJ6zxwFG3SUGB736Ew@mail.gmail.com>
From: Dimitar Vassilev <dimitar.vassilev@gmail.com>
Date: Mon, 14 Jun 2021 10:51:19 +0300
Message-ID: <CAF+AZZW2MLDxwp_9Bom-ZN4aBQWJVXScsqRdsxoMBcZZcu5dbg@mail.gmail.com>
Subject: Re: openwrt interface does not have a public key after upgrade from
 librecmc 1.4.8 to openwrt 21.02-rc2 to openwrt 21.02-rc2 ath79
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

=D0=9D=D0=B0 =D0=BF=D1=82, 11.06.2021 =D0=B3. =D0=B2 9:23 =D1=87. Dimitar V=
assilev
<dimitar.vassilev@gmail.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0:
>
> Greetings,
> I upgraded an WNDR3800 from librecmc 1.4.8/ath71 to openwrt 21.02-rc2
> ath79 and reapplied the librecmc 1.4.8 configuration. I'm seeing now
> the interface configuration in the CLI and in Luci with all the keys,
> but when I click on Status->Wireguard I get a message interface does
> not have a public key.
> I did have a look on
> https://forum.openwrt.org/t/wireguard-interface-does-not-have-a-public-ke=
y/37549
> and the other threads, but even when after applying the work-arounds
> for DNS rebind protection still the same. My Luci is using self-signed
> certs as well.
> Any clues where to look further? I will be testing the device today to
> see how it really works. I do have some overlapping IP ranges in the
> configs that make me reluctant to test how site A machine works as a
> client of site B, while the actual site A is running remotely over the
> VPN.
> Thanks,
> Dimitar

For the record - this is a cosmetics issue in my case. Once I put the
uplink cable all came good. Disconnecting the VPN interface to avoid
greater worries also helps [tm]
Thanks,
Dimitar
