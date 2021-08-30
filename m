Return-Path: <SRS0=ArOK=NX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2318C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Sep 2021 13:44:28 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8585E60F92
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Sep 2021 13:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8585E60F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=botterell.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c3dbdf5;
	Wed, 1 Sep 2021 13:44:26 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id df7ea52c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Aug 2021 19:55:30 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id m4so9224578pll.0
 for <wireguard@lists.zx2c4.com>; Mon, 30 Aug 2021 12:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=botterell-net.20150623.gappssmtp.com; s=20150623;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=85wyUGU/v38K90UewWVdR7n8xbBjrnJMLY7Hppz+tHw=;
 b=nqkxVVeb1CJPrHvQ3ScW483Hd9CVr/uR2HkULekcrOeGU9kJRMBzx31Dre/rb63D3k
 BlHm3sndje6GQTBXMmWpOESMtvP8QSr0ZSV2Gt45WGZpLRQqjUu5m4cBAPWfJ24t46EN
 vfC7b829O+DzHe8vyOSOXlCO2z7pzQqvC8CXT+8aQ3NB2ElNNTRGTAHOizi9K01dDCtE
 egjobfsB5LNDmn+43js9OJGLBEG5yGECF4mNe/XpHjY2UpnLTEzv5QYx1ekWLV32q3sq
 Zb8hDEaFnxzAHyt6EWUXA8KF3esypkAnY57sNHQcgPaRvffk2dS6f1mbqFclLK9CYf8i
 aTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=85wyUGU/v38K90UewWVdR7n8xbBjrnJMLY7Hppz+tHw=;
 b=raXV1KfujrSrjM+cWcLuT3Th/ST4XEKUpRI7Z5bSSki/gpfJJlsHXxN6A6MYBsA8zP
 Eervv0dK0ohBF7COtTXNEQ0veUt8WZdCk270FEpkSQg8UTqHfwaDykkhibrdtJnsi5j9
 8CIwBSxcCJaUwBVxbv05UkzHIyPbhIKWohcFDW2X7fCUY6UEfisn2PKW4mevdvk/35/t
 2AH9fxj6Ov6QflFCGmRjH4z/xyuTpsfXaZyCLNGR8FaqY6ZgXN2j/cJZBb6zralJi95C
 5H7UAZn9FfOagbMVoKdHNDbZ3vPeMkN3eiq9eSBhRiWb38nHb5gnDlgB5AUBpk6P0JLj
 sODw==
X-Gm-Message-State: AOAM530LRGvEx2pcZ2hk5dj8bOOsAgshKnNs+SsNoMuucZJzzn+Uch/l
 E9WFroceiFTB0Og5uKvI9YX9h0Dw8U99Xg==
X-Google-Smtp-Source: ABdhPJxWHtwy21E5C8styyAh0TlkPYjq5CC0Cno+6kcUi8vmHKkLepsp/TLXF0MU3taxBp+vmx//jQ==
X-Received: by 2002:a17:90b:691:: with SMTP id
 m17mr826655pjz.217.1630353328647; 
 Mon, 30 Aug 2021 12:55:28 -0700 (PDT)
Received: from smtpclient.apple (172-8-33-235.lightspeed.frokca.sbcglobal.net.
 [172.8.33.235])
 by smtp.gmail.com with ESMTPSA id n3sm15147623pfo.101.2021.08.30.12.55.27
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Aug 2021 12:55:28 -0700 (PDT)
From: Art Botterell <art@botterell.net>
X-Google-Original-From: Art Botterell <artbotterell@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Behaviour on MTU problem
Date: Mon, 30 Aug 2021 12:55:26 -0700
References: <1630347517.szy5mrrs16.astroid@morple.none>
To: wireguard@lists.zx2c4.com
In-Reply-To: <1630347517.szy5mrrs16.astroid@morple.none>
Message-Id: <08C6DA98-A534-451D-9007-FF8627C48065@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Mailman-Approved-At: Wed, 01 Sep 2021 13:44:22 +0000
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

Hi Michael,

One reads about fragmentation-induced failures and about various MTU =
values that did or didn't work in a particular situation.  We can infer =
a certain amount from the stories, but I haven=E2=80=99t seen any sort =
of systematic characterization of the phenomenon.  Seems like it might =
be a good research project for somebody.

Please note, however, that I=E2=80=99m glad to be schooled if there=E2=80=99=
s a resource on the topic that I=E2=80=99ve overlooked.

Personally I=E2=80=99d be very interested in understanding what we could =
look out for in order automatically to detect MTU issues and adapt to =
the particular demands of a remote installation on complex host networks =
that may have fragmentation-inducing devices (or protocols, e.g., PPPoS) =
on the route to the Internet that we don=E2=80=99t control or even know =
about.  My inference from what I=E2=80=99ve read is that for any =
particular network route there is some maximum MTU value that will work =
without fragmentation.  (I think there may be some practical lower limit =
on the MTU setting, down around 1200 somewhere, but I=E2=80=99m not sure =
what that is or what it stems from.)  My experience has been that the =
maximum MTU value looking toward the WG host can vary from host-network =
to host-network and even from time to time (e.g., one organization made =
some network changes related to COVID that incidentally reduced the =
critical MTU and knocked me off the air.)

Is there some sort of a =E2=80=98fragtest=E2=80=99 network utility out =
there?

An inelegant approach might be to have each client iterate downward over =
a range of MTU values and test the connection to the server each time.  =
But I hope a deeper understanding may reveal a more efficient approach =
for deployment.

Regards,

Art

> On Aug 30, 2021, at 11:43, M. Dietrich <mdt@emdete.de> wrote:
>=20
> Hi friends of Wireguard,
>=20
> i am neither a network guru nor a kernel hacker and after all=20
> i had no time to fully investigate the case. so please read=20
> with a grain of salt.
>=20
> i had my notebook in a wifi network lately that seemed to have=20
> some MTU size problems. download worked fine while uploads=20
> blocked for bigger packages. when i set the MTU down to 1200=20
> on the wg interface the same upload worked fine.
>=20
> this was obviously a problem of that very wifi network and is
> not related to wg at all, the dhcp answer did not even contain=20
> any MTU hints, so 1500 was assumed.
>=20
> anyway the kernel locked up. commands like `ip` or `wg-quick=20
> down ...` get stuck and ^C oder even a `kill -9 ...` did not=20
> end the processes. any access to the wg interface blocked.
>=20
> my question is if that scenario (misconfigured MTU size in the=20
> "outer network") is tested and works fine. i know that MTU=20
> size problem lead to lockups (that's why i immediatly came to=20
> that conclusion) but never saw such a hard lockup related to=20
> commands like `ip`.
>=20
> if my assumption is just stupid let me know. if not i would=20
> further investigate the case, setup a test scenario and burn=20
> some time. what do you think?
>=20
> best regards, michael

