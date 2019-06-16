Return-Path: <SRS0=qJ/1=UP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0084C31E50
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Jun 2019 19:44:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A8C52070B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Jun 2019 19:44:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvypYo6L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A8C52070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd6b4d3e;
	Sun, 16 Jun 2019 19:43:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48ce4255
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Jun 2019 19:43:53 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d81a8339
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Jun 2019 19:43:53 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k11so7655762wrl.1
 for <wireguard@lists.zx2c4.com>; Sun, 16 Jun 2019 12:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+SqzK6PplyShMOLmNzqx2DEls4ISdTSJtMuEA0lJD3k=;
 b=hvypYo6Lif6RUe1wbrWaereDLWq9Wwiy6NmU01XMGbbefEu8S8+s26c37dLJIU9va7
 hHyleDXxdz4W1R/q8T7wTzwXhtndj8CbDkoxcfWJG4Me11ylq/8MJAu1YNFqjMKWnpdX
 j861jFbdEmubLA/h9dW53wSo7bK4lNZQP3A6AI5cYGM1JM4M//89fKSYr4GY1e8n519/
 DmAGgair3FNVOaKmuzQTZ09Y1kwFwAZYoGFjehQYBkL8WtWTAp26HMyaNHK6U7KfFDdP
 ftVjFjFlQ++UqIUFKHzfI6gc5MtLqIvWiA0XOTD59lJYSZmSxZp5g3pxDgdYiyM+nqCn
 BZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+SqzK6PplyShMOLmNzqx2DEls4ISdTSJtMuEA0lJD3k=;
 b=ghvqw5XtNh+GVxByl85TaiX4RXV2QFp5l8y93gIkweS9Rw7scuTJOlymEdcH3hPVMv
 ac6Nv3kyWxyPIUWJFx0oWSJJG+GGBdpEvu3zsN9K9Ecm1ntR2oQqBQ+l/iO3UGbtFlif
 0U/6OJu5vj2zntEDSwT8pUp/cEMTfot8O8D8O4mrtHqIr91ObKN4Zn1OLroyUw10XXkD
 ZT+OHYcBxWUNCQhX+WtSsyYugL0UUue/ImrRqcCry0PcbivV77W/9LFze6ltxttpjKeE
 vRnwPTVGvXNK/WoR1yu3VSxpXqAWCClLcRtPESEcAshWW715lTszkW8CV01rjMvjgr9w
 Icng==
X-Gm-Message-State: APjAAAXFVdakrG7jlR8pJLKqaZcJu69OPxVz2gBaOJMcj77mPS6F5Lsd
 7faNcUqCv+tC283pYcw5N2fsASTP2Zd81rLAnenntwu/
X-Google-Smtp-Source: APXvYqwVJLLkQHz08tTzdl2MFkij22/ZXnPXQGCJmjbgEZpBdTHtEiHzR5bQX78HkhxtTT7wRR4o7q1ESIIhSG+qlXg=
X-Received: by 2002:a5d:5702:: with SMTP id a2mr30028408wrv.89.1560714231934; 
 Sun, 16 Jun 2019 12:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <6BFBD58C-ACC2-45FD-9986-63CEA1143BA6@lonnie.abelbeck.com>
 <CAHmME9r3QVVWRu=36Yx6wmfuHm5CCA3Dg+JdZknpnNAmnj=ATQ@mail.gmail.com>
 <16a64aa0-924c-4497-8252-cc965a04a740@www.fastmail.com>
 <CACioZiuMHZRVxT+_aE9L3dDkn_fADrZCyC8MPgqZ_V5yECxNoQ@mail.gmail.com>
 <CAHmME9qhuZrj8StZq_7ZbSagp8XGN5Q8U-b1hkcca3AwU2v7mA@mail.gmail.com>
In-Reply-To: <CAHmME9qhuZrj8StZq_7ZbSagp8XGN5Q8U-b1hkcca3AwU2v7mA@mail.gmail.com>
From: Marc Fawzi <marc.fawzi@gmail.com>
Date: Sun, 16 Jun 2019 12:43:40 -0700
Message-ID: <CACioZitcmZOmEAZox6VoAy-OCvDXoqRqkvosxNNwuv9LLwLnng@mail.gmail.com>
Subject: Re: RFC: wg syncpeers wg0 wireguard.conf
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Steven Honson <steven@honson.id.au>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8105828460707634908=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8105828460707634908==
Content-Type: multipart/alternative; boundary="00000000000063f2cf058b7619b0"

--00000000000063f2cf058b7619b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jason,

There are a few projects on github that show up under =E2=80=9CWireguard dy=
namic=E2=80=9D
and most have to do with the functionality I believe you guys are
discussing here (please correct me if I=E2=80=99m wrong) which is how to up=
date the
peers on the wg interface (both add and remove) from the configuration.
There is one called Wireguard-dynamic that has to do with configuring a
mesh by using a key-value DHT or a shared kv store.
https://github.com/segator/wireguard-dynamic/issues/2#issuecomment-50247852=
0

There is also P2P-Wireguard in Rust that uses a STUN server to support
nodes behind NAT.

And wg-broker (another project) that is closer to what I=E2=80=99m looking =
for.

The official wg-dynamic I think has to do with DHCP like functionality
(from what I managed to read so far) so I understand its completely
separate but the confusion around what =E2=80=9Cdynamic=E2=80=9D is refers =
to is
unfortunate (naming is always a tricky issue)

Btw, may I suggest having two mailing lists: one for users like myself and
another for contributors and core developers? In Tensorflow and other OSS
we have such separation between the platform Developers and the users.




On Fri, Jun 14, 2019 at 11:02 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote=
:

> On Fri, Jun 14, 2019 at 8:01 PM Marc Fawzi <marc.fawzi@gmail.com> wrote:
> > p.s. does this overlap with similar planned in wg-dynamic?
>
> No, the topics have no similarities.
>

--00000000000063f2cf058b7619b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Hi Jason,</div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">There are a few projects on github that show up under =E2=80=
=9CWireguard dynamic=E2=80=9D and most have to do with the functionality I =
believe you guys are discussing here (please correct me if I=E2=80=99m wron=
g) which is how to update the peers on the wg interface (both add and remov=
e) from the configuration.=C2=A0 There is one called Wireguard-dynamic that=
 has to do with configuring a mesh by using a key-value DHT or a shared kv =
store.=C2=A0<div><a href=3D"https://github.com/segator/wireguard-dynamic/is=
sues/2#issuecomment-502478520">https://github.com/segator/wireguard-dynamic=
/issues/2#issuecomment-502478520</a></div></div><div dir=3D"auto"><br></div=
><div dir=3D"auto">There is also P2P-Wireguard in Rust that uses a STUN ser=
ver to support nodes behind NAT.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">And wg-broker (another project) that is closer to what I=E2=80=99=
m looking for.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">The=
 official wg-dynamic I think has to do with DHCP like functionality (from w=
hat I managed to read so far) so I understand its completely separate but t=
he confusion around what =E2=80=9Cdynamic=E2=80=9D is refers to is unfortun=
ate (naming is always a tricky issue)=C2=A0</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Btw, may I suggest having two mailing lists: one for us=
ers like myself and another for contributors and core developers? In Tensor=
flow and other OSS we have such separation between the platform Developers =
and the users.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><br></div><div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 14, 2019 at 11:02 AM Jason A.=
 Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">On Fri, Jun 14, 2019 at 8:01 =
PM Marc Fawzi &lt;<a href=3D"mailto:marc.fawzi@gmail.com" target=3D"_blank"=
>marc.fawzi@gmail.com</a>&gt; wrote:<br>
&gt; p.s. does this overlap with similar planned in wg-dynamic?<br>
<br>
No, the topics have no similarities.<br>
</blockquote></div></div>

--00000000000063f2cf058b7619b0--

--===============8105828460707634908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8105828460707634908==--
