Return-Path: <SRS0=9kqO=ON=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC4AC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 02:56:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C017610A1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 02:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C017610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33b73c11;
	Thu, 23 Sep 2021 02:54:06 +0000 (UTC)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [2607:f8b0:4864:20::532])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 95e75887
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 02:54:03 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id m21so4807827pgu.13
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 19:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ssrgSx5ZlRGZlCBLvCnTiIIHGJvhWcOeXLOB46mdbD8=;
 b=UtXdcVcLswD1nv5cQTjQHGo+AO/FPhaSW0HIH33AFj8Fu/vAKAQ/POkidWg4pQaeD4
 3M4P6h1CMIhatFnsqQU7bdxGAZa6xLZ604qiV0/6UIV/msjuh3X9uILAkQNrYRVWNPgx
 OeRe3URWcIfWnx9Sgow2Laag5r4o8+3zEbuC6qOkQsDGVX7MubGB5TRxSQbGbdYHdOKA
 SPn8n/yqUP8svTfj7OjVrSgr3y9LmEQ1i2J89xWOdh2puQcT3aJIVlSX7xpvK9svvX/p
 Tu3DLvPwoCcPIOFN3PDx1q20c4bjINdYzL+/8jbjB/BRWwJFf0Os98M4GTdB5Rt2g9S9
 s08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ssrgSx5ZlRGZlCBLvCnTiIIHGJvhWcOeXLOB46mdbD8=;
 b=Vy2ulaTIJa+b7x5UO5Z7OOBrsJ425NxBbo9e6ct+Wl5O7ar4GhLrDLkhuc2upPbuCl
 ux8thZtyl0C3fWvnMDWhY+v7vq9LJzRsAX0YtcaOcJNtgUytW4M9Y/wHxT0Kx8SfI3sh
 HGMRSz7eq24lzRujiqFOKVu7XIjviHiZlrhSfZiJio1OkVXhfNV//bw8OzupA/PyiwbK
 E5nk6guBvr/AxpdOvnFwniX1JiGLQ+sFo/g+Nfe24D+4kxpgshLWvGeb7mx6yP6TL+uq
 DC8l7ALBQ33FJwQBKWFIRG86I7KuBUefcprsjb7R0CgQ974nysFl2RJGAjw10GqLNir7
 PDaw==
X-Gm-Message-State: AOAM533OKJsk/yK/c+/phF/GRpmZqLBhxgauZYiYZY9OBv+NGzeO7/cg
 pUYJ/LF1+JXBkg3ELVTVIQG1pM+jq+kE+Q==
X-Google-Smtp-Source: ABdhPJyGPkzEou0ReSSsjor7LNfaKp+TYWRngS5X0NTWE4/zx95s1rc45hp1YNEEpNEcWjKJStDODQ==
X-Received: by 2002:a65:45cd:: with SMTP id m13mr914929pgr.26.1632365641468;
 Wed, 22 Sep 2021 19:54:01 -0700 (PDT)
Received: from smtpclient.apple (216-19-179-128.dyn.novuscom.net.
 [216.19.179.128])
 by smtp.gmail.com with ESMTPSA id k14sm4507607pgp.27.2021.09.22.19.54.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Sep 2021 19:54:00 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
From: Miguel Arroz <miguel.arroz@gmail.com>
In-Reply-To: <CAHmME9reWG3UiHQm1fBvyQUoUF5_oJv6YiBGaOE2AUgLt-nK3w@mail.gmail.com>
Date: Wed, 22 Sep 2021 19:54:00 -0700
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Eddie <stunnel@attglobal.net>, Anatoli <me@anatoli.ws>,
 Roopesh Chander S <roop@roopc.net>, Alan Graham <alan@meshify.app>,
 oss@jacobwilder.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <BD9150AA-4F49-416A-A897-A9C4000C354E@gmail.com>
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
 <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
 <CAHmME9q58QCUEY7vqhX767wPtqCPr23gmXgSS_bvbfvNZva=SQ@mail.gmail.com>
 <96bcc87f-7de1-05a4-641a-27ffac7b052d@attglobal.net>
 <DA133F84-7C21-4234-97DB-FFEDF79D1607@gmail.com>
 <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
 <CAHmME9rQY8OU3jbXnB=OroBvudO1KCXL3vL6ESuEgZoMSRqVLw@mail.gmail.com>
 <CAHmME9reWG3UiHQm1fBvyQUoUF5_oJv6YiBGaOE2AUgLt-nK3w@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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

Hi,

  (Now without HTML=E2=80=A6)

  I never wrote code touching the Keychain on iOS, but did on macOS =
using the iOS behaviour (kSecUseDataProtectionKeychain set to true).

  There are two things in that class that I would look into:

  - Line 40: items[kSecAttrAccessGroup] =3D FileManager.appGroupId

  If I understand correctly, this ends up being "group.$(APP_ID_IOS)=E2=80=
=9D. I=E2=80=99m a bit surprised this doesn=E2=80=99t need the Team ID =
before =E2=80=9Cgroup=E2=80=9D, as it definitely needs that in macOS.

  - The openReference() function, because it=E2=80=99s not setting the =
same kSecAttrAccessGroup parameter when reading. The documentation =
mentions what happens when it=E2=80=99s not set =
(https://developer.apple.com/documentation/security/ksecattraccessgroup), =
I wonder if that changed (intentionally or due to a bug in iOS 15):

> If you don=E2=80=99t explicitly set a group, keychain services =
defaults to the app=E2=80=99s first access group, which is either the =
first keychain access group, or the app ID when the app has no keychain =
groups.

  None of these explain why the tunnel keeps working after upgrading to =
iOS 15 (if the on-demand flag is set), as I would expect the Network =
Extension to hit the same problem, as it goes through the same Keychain =
code. But maybe the behaviour is slightly different than when it=E2=80=99s=
 running through the app for some reason. It could explain why =
re-building the tunnels would work from then on (although then I would =
expect the extension to *not* be able to read them). So all this may be =
just a red herring.

  Hope it helps somehow.

  Regards,

Miguel Arroz



> On Sep 22, 2021, at 6:34 PM, Jason A. Donenfeld <Jason@zx2c4.com> =
wrote:
>=20
> Hey folks,
>=20
> Small update: I've managed to update a fresh 14 device to 15 using the
> latest build, and things are broken still.
>=20
> On the plus side:
> - The new build no longer deletes VPN profiles when the corresponding
> keychain references are unresolvable, so if there's any chance of
> recovery in a next build, it won't ruin those chances.
> - Now that I can reproduce it, I can hammer away at trying to fix this =
directly.
>=20
> On the minus side:
> - The fact that a keychain reference goes stale during an update from
> 14 to 15 sounds solidly like an Apple bug, rather than any sort of API
> misuse.
> - I'm skeptical that there'll be a workaround, and if there is, it
> will probably be pretty ugly.
>=20
> If anyone knows the SecItem APIs well, the file in question is:
> =
https://git.zx2c4.com/wireguard-apple/tree/Sources/Shared/Keychain.swift
>=20
> So, I guess I'll jump into this in full force now. Here we go...
>=20
> Jason

