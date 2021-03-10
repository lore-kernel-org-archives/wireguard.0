Return-Path: <SRS0=iDgY=II=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8801C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Mar 2021 12:15:34 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7A4664FE5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Mar 2021 12:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7A4664FE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wandera.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bdfb0a28;
	Wed, 10 Mar 2021 12:13:20 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fa75b3b5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Mar 2021 12:13:19 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id 7so23087923wrz.0
 for <wireguard@lists.zx2c4.com>; Wed, 10 Mar 2021 04:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wandera.com; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc:message-id:references
 :to:content-transfer-encoding;
 bh=b6v1qS3RyHPea3egf1UgkUS5edcQ1e0RbKNURX3EHCg=;
 b=IqCZEUtYc05t6bKnA5IDBYcuh4rYPwrofrtnMyNbmeP1jqyV4dotiz/sNiMakOdLw3
 4UiRFrbRh6qpgQoMfly/tdIEhzKXyFkENYvS9umTyROzXBRiR0fZ2HKXfn6HaGifjLdx
 +YkV6aHCG9dYmREneqMKrkhUz5i7sPUF/LDFlXDEKiVCfkLcPYpPhyWqPKhUgFFuRxkE
 Gn5BNOPcVNZiV0+/BmDeXhEpSDJmkRLRaOtShhsxhXKhwTzDGjQeYhS0tJV5TKDosagp
 TiKw8ZdjOR85mZv+Fsbm+k8qVG3CMgOVdLbjEmrCQrC7Z3eYh2kG/kgvwBl6ibMQ+R7T
 BPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :message-id:references:to:content-transfer-encoding;
 bh=b6v1qS3RyHPea3egf1UgkUS5edcQ1e0RbKNURX3EHCg=;
 b=lqJ8FmFzAZ3UIftEOFensX4aNcV1Ve+6RcllL2QZIWptTzldPB+rg4i0CrkWOu6Z/y
 MRajaDc0+j0jVr6GwvU0qh6J96fJdgYf9xKPKvDT0iFXAsRojUxkgV+rzdaYDgPjPkuH
 nf/CCdTymE3CajFfWE7C7c2pk0D9MSaLNmsCR73282KyLJrwdt3F/eOltggTvUShQHSY
 /cC3WuzilILaWxorMdoTxhUbSz3/8UlxExh2m9ZwqsMM3mclf9GZ6guKp2PmtHVZeBDU
 rzOuop2z4194wYCTQ0FvF81ePdilKGCdM6lGJkEPWpn4DGpObr4EYgeYBfR9Dty6eMdG
 9byw==
X-Gm-Message-State: AOAM5307byX7MIv94X4sLk5aE6FW9+PNmYTpUwbAMO6SIFs+5rcfH3m+
 CyEidqyDPV0aMYSTerHuCg7ksoFkQ3lxhBysybC/744SY8HpiUoQ55UIBBX0RGhFrj5sL4ap1Jx
 DK7PbTk9owj7TXn2e4ZfxjEfB
X-Google-Smtp-Source: ABdhPJxVo5peivBl/gxIeZNTzuapWZK5E4zLViFpX1bTf9phnSwcGc2Zk7aAMRLGVmh6RSmjiT9+TQ==
X-Received: by 2002:adf:ed12:: with SMTP id a18mr3271052wro.249.1615378399221; 
 Wed, 10 Mar 2021 04:13:19 -0800 (PST)
Received: from [10.255.240.37]
 (ec2-54-246-181-160.eu-west-1.compute.amazonaws.com. [54.246.181.160])
 by smtp.gmail.com with ESMTPSA id 4sm9941152wma.0.2021.03.10.04.13.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Mar 2021 04:13:18 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] device: revert pipelining UAPI requests
From: Laura Zelenku <laura.zelenku@wandera.com>
In-Reply-To: <CAHmME9qkgbE0E9ApGzMoDeVr289JrrZ42Uyba1hQGNc22VSCMg@mail.gmail.com>
Date: Wed, 10 Mar 2021 13:13:16 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-Id: <B25D7330-7D29-4F61-A097-44F93BDD58F4@wandera.com>
References: <038632B3-A3F3-4FC6-8242-265A42F89F1F@wandera.com>
 <CAHmME9rakmzN2ndkXchvcRXONjfk4ikJScWCSEYzNR8+1ow03w@mail.gmail.com>
 <3A2A1B3E-75FB-4CCA-A7B9-FC7C02B7E9DB@wandera.com>
 <CAHmME9qkgbE0E9ApGzMoDeVr289JrrZ42Uyba1hQGNc22VSCMg@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
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

Hello Jason,
I=E2=80=99ve found there was version wireguard-tools v1.0.20200510. Version=
 v1.0.20210223 builded from the source was overriden by package installatio=
n in the container :-(
I=E2=80=99ve alligned versions (wireguard-tools v1.0.20210223) and it is wo=
rking as expected.

I=E2=80=99m sorry for false alert and thank you for your assistance.
Laura

> On 9 Mar 2021, at 17:33, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> On Tue, Mar 9, 2021 at 9:30 AM Laura Zelenku <laura.zelenku@wandera.com> =
wrote:
>>=20
>> Hi Jason,
>> I=E2=80=99m just using =E2=80=9Cwg-quick up wg0=E2=80=9D command on Linu=
x env with NO kernel module, just userspace implementation.
>> My config file looks like:
>> [Interface]
>> PrivateKey =3D =E2=80=A6.mEw=3D
>=20
> Change your private key. No need to mess with partial exposures.
>=20
>> In the command output you can see that "wg setconf wg0 /dev/fd/63=E2=80=
=9D stucked and no following commands (set IP address, set MTU, =E2=80=A6) =
are processed.
>=20
> What's the output of `wg --version`?
>=20
> Jason


--=20
*IMPORTANT NOTICE*: This email, its attachments and any rights attaching=20
hereto are confidential and intended exclusively for the person to whom the=
=20
email is addressed. If you are not the intended recipient, do not read,=20
copy, disclose or use the contents in any way. Wandera accepts no liability=
=20
for any loss, damage or consequence resulting directly or indirectly from=
=20
the use of this email and attachments.
