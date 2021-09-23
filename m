Return-Path: <SRS0=9kqO=ON=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC1EC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 03:12:26 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DF2860F23
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 03:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DF2860F23
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96154e7b;
	Thu, 23 Sep 2021 03:09:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 89f4487f
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 03:09:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 806C060F23
 for <wireguard@lists.zx2c4.com>; Thu, 23 Sep 2021 03:09:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="LqIZTOQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632366561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=erkPpQm+TxnjeN/22nUNeCyW1YGX3ecD2N084EYjKms=;
 b=LqIZTOQ69UkEsK42c4fDvPUWbJ3octG6mzvrPXdwzvNZi78MI+ezbqUWFzUvtqrNwIEOJj
 tBpE8Ofl3+Fa91SxPr2lhqiT4YGiIvmqG0Co8rKBRKuSUKb9Wl7k4x9eCLV3gi4opRzCro
 A3k8YDb47C6l+PlL3mafwgXMj3Ki0DE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 07d09f46
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 03:09:21 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id p4so17436615qki.3
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 20:09:20 -0700 (PDT)
X-Gm-Message-State: AOAM532xo6WGaz/lxKZX7yrGFhCgDKDtNN+sNXXa/DIaNfQRp5XY98mp
 DWdEEw01FCTP1SF9WwVBSaNYipDqkYof/goEG74=
X-Google-Smtp-Source: ABdhPJwc5r0QMr2jsScMWJN/AlLRdcXSlkpcS973TVb8GZ8yv0E1pblbcyZZN0WDU58d+q9lDSYS/ojuky4uEbLjtT4=
X-Received: by 2002:a25:ad97:: with SMTP id z23mr2910946ybi.412.1632366559583; 
 Wed, 22 Sep 2021 20:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
 <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
 <CAHmME9q58QCUEY7vqhX767wPtqCPr23gmXgSS_bvbfvNZva=SQ@mail.gmail.com>
 <96bcc87f-7de1-05a4-641a-27ffac7b052d@attglobal.net>
 <DA133F84-7C21-4234-97DB-FFEDF79D1607@gmail.com>
 <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
 <CAHmME9rQY8OU3jbXnB=OroBvudO1KCXL3vL6ESuEgZoMSRqVLw@mail.gmail.com>
 <CAHmME9reWG3UiHQm1fBvyQUoUF5_oJv6YiBGaOE2AUgLt-nK3w@mail.gmail.com>
 <BD9150AA-4F49-416A-A897-A9C4000C354E@gmail.com>
In-Reply-To: <BD9150AA-4F49-416A-A897-A9C4000C354E@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Sep 2021 21:09:08 -0600
X-Gmail-Original-Message-ID: <CAHmME9rREdEAWEDYyHaRWHwkUUWy1MPdrBokSygO8rhyxTJgXg@mail.gmail.com>
Message-ID: <CAHmME9rREdEAWEDYyHaRWHwkUUWy1MPdrBokSygO8rhyxTJgXg@mail.gmail.com>
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: Miguel Arroz <miguel.arroz@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Eddie <stunnel@attglobal.net>, 
 Anatoli <me@anatoli.ws>, Roopesh Chander S <roop@roopc.net>,
 Alan Graham <alan@meshify.app>, oss@jacobwilder.org
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

Hi Miguel,

On Wed, Sep 22, 2021 at 8:54 PM Miguel Arroz <miguel.arroz@gmail.com> wrote=
:
>   If I understand correctly, this ends up being "group.$(APP_ID_IOS)=E2=
=80=9D. I=E2=80=99m a bit surprised this doesn=E2=80=99t need the Team ID b=
efore =E2=80=9Cgroup=E2=80=9D, as it definitely needs that in macOS.

Indeed it's prefixed with the team on macOS, but IIRC that never worked on =
iOS.

>   - The openReference() function, because it=E2=80=99s not setting the sa=
me kSecAttrAccessGroup parameter when reading. The documentation mentions w=
hat happens when it=E2=80=99s not set (https://developer.apple.com/document=
ation/security/ksecattraccessgroup), I wonder if that changed (intentionall=
y or due to a bug in iOS 15):
>
> > If you don=E2=80=99t explicitly set a group, keychain services defaults=
 to the app=E2=80=99s first access group, which is either the first keychai=
n access group, or the app ID when the app has no keychain groups.

For setting, but for reading/updating, that page says:

> By default, the SecItemUpdate, SecItemDelete, and SecItemCopyMatching
> methods search all the app=E2=80=99s access groups. Add the kSecAttrAcces=
sGroup
> attribute to the query to limit the search to a particular group.

So in theory, it should be fine to omit that in openReference().
Adding it in there also doesn't cause any changes, unfortunately.

>   None of these explain why the tunnel keeps working after upgrading to i=
OS 15 (if the on-demand flag is set

Oh, I didn't realize that was happening. Are you *sure* about that? Is
the tunnel actually working? Or is it on, but crashing? When I go to
enable the tunnel from the system preferences view of it, it starts
and then stops, indicating the network extension couldn't open the
keychain ref either. And in the log, I see the [NET] process indeed
failing in the same spot as the [APP] process.

Jason
