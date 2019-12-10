Return-Path: <SRS0=o99y=2A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACC0C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 17:28:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4987E2077B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 17:28:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=depau.eu header.i=@depau.eu header.b="uYFFutYc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4987E2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=depau.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e9142b9;
	Tue, 10 Dec 2019 17:28:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 878aa59f
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 17:28:32 +0000 (UTC)
Received: from mail30.static.mailgun.info (mail30.static.mailgun.info
 [104.130.122.30])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a13a6140
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 17:28:31 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=depau.eu; q=dns/txt;
 s=krs; 
 t=1575998912; h=Content-Type: Cc: To: Subject: Message-ID: Date: From:
 In-Reply-To: References: MIME-Version: Sender;
 bh=pHuTuWhBvE3buyTlNZxfe2IgJ9tbLs7wWwaLL57V++8=;
 b=uYFFutYc8naubHqBPjJcWohbO+/n6nvm7b8fpKaOM8xooxGjyw2yolfm5Z7iq7+nRV8cQKEN
 2w013d95sUerl2QPrusjz16X86p2Mea595hWqopCgOmfwQn6CbbYx9Ed82Imob5830metzQH
 uNTNw2tRwnpQysR/R9vgjVyWFIA=
X-Mailgun-Sending-Ip: 104.130.122.30
X-Mailgun-Sid: WyI1MjViMCIsICJ3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tIiwgImIwZWQyIl0=
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by mxa.mailgun.org with ESMTP id 5defd5bd.7f8fc7cc46f0-smtp-out-n01;
 Tue, 10 Dec 2019 17:28:29 -0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id a67so10545918oib.6
 for <wireguard@lists.zx2c4.com>; Tue, 10 Dec 2019 09:28:29 -0800 (PST)
X-Gm-Message-State: APjAAAXfgT1oJ8OpQrg0t+GNMYoH/pkwcN4/5LNx8+e3ZYGkt3SlGic4
 Khbp9Wr+Fe9EaYWy75A/VdN3JcnzDm3oDGWDVBY=
X-Google-Smtp-Source: APXvYqwq4DggWVXQu0sTgjd8KUPPW5HtXDAcw0dRVunKbXOSESxRRAArYuRbErSVxyE3e7ZNlZ47IPxyRPYDzDIcofc=
X-Received: by 2002:a05:6808:24e:: with SMTP id
 m14mr4954361oie.168.1575998908870; 
 Tue, 10 Dec 2019 09:28:28 -0800 (PST)
MIME-Version: 1.0
References: <20191210154850.577745-1-Jason@zx2c4.com>
 <FX30kbIJvHNSsmPxMSA_XdlAOLSee8p5eHMDcDAkDH8KKhihrybE2EtZJIjtU9ojh-JJT9g4Cj5xlT85E5uETb9JsBJmficyjfDvblrRaJg=@protonmail.ch>
 <CAHmME9pdqq23OXNPHLT-YyXCKTVTKJNyfz9D+Q0jADAN=BDhnA@mail.gmail.com>
 <20191210221215.56c2f30d@natsu>
In-Reply-To: <20191210221215.56c2f30d@natsu>
From: Davide Depau <davide@depau.eu>
Date: Tue, 10 Dec 2019 18:28:16 +0100
X-Gmail-Original-Message-ID: <CAMp63jV47ZcWRu2C8SAz3aAifoxz-udNg9oFHTMVdH7Ju3oFrA@mail.gmail.com>
Message-ID: <CAMp63jV47ZcWRu2C8SAz3aAifoxz-udNg9oFHTMVdH7Ju3oFrA@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: linux: add support for nft and prefer it
To: Roman Mamedov <rm@romanrm.net>
Cc: "jwollrath@web.de" <jwollrath@web.de>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============8105281628614910391=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8105281628614910391==
Content-Type: multipart/alternative; boundary="00000000000021373705995cd796"

--00000000000021373705995cd796
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 10, 2019 at 6:13 PM Roman Mamedov <rm@romanrm.net> wrote:

> nftables is slower than iptables across pretty much every metric[1][2]. It
> only wins where a pathological case is used for the iptables counterpart
> (e.g.
> tons of single IPs as individual rules and without ipset). It is a disaster
> that it is purported to be the iptables replacement, just for the syntax
> and
> non-essential whistles such as updating rules in place or something. And
> personally I don't prefer the new syntax either. It's the systemd and
> pulseaudio story all over again, where something more convoluted, less
> reliable
> and of lower quality is passed for a replacement of stuff that actually
> worked,
> but was deemed "unsexy" and arbitrarly declared as deprecated.
>
> [1] http://www.diva-portal.org/smash/get/diva2:1212650/FULLTEXT01.pdf
> [2] https://developers.redhat.com/blog/2017/04/11/benchmarking-nftables/


I'm seeing the pages you linked are dated 2018 and 2017. I'm seeing this
article [1] dated June 2018 talks about an "important improvement of
performance", and though I don't see any evidence backing the statement I'd
expect more improvements given than more than one year has passed.
Do you know whether the worse performance you're talking about is still the
case on recent Linux releases?

I'd say +1 for nftables but just for the syntax which I do like better.
I'll leave the discussion on performance to experts.

[1]
https://www.zevenet.com/knowledge-base/nftlb/nftlb-benchmarks-and-performance-keys/

--00000000000021373705995cd796
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Dec 10, 2019 at 6:13 PM Roman Mam=
edov &lt;<a href=3D"mailto:rm@romanrm.net">rm@romanrm.net</a>&gt; wrote:<br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">nftables is slower than iptables across pretty much every metric=
[1][2]. It<br>
only wins where a pathological case is used for the iptables counterpart (e=
.g.<br>
tons of single IPs as individual rules and without ipset). It is a disaster=
<br>
that it is purported to be the iptables replacement, just for the syntax an=
d<br>
non-essential whistles such as updating rules in place or something. And<br=
>
personally I don&#39;t prefer the new syntax either. It&#39;s the systemd a=
nd<br>
pulseaudio story all over again, where something more convoluted, less reli=
able<br>
and of lower quality is passed for a replacement of stuff that actually wor=
ked,<br>
but was deemed &quot;unsexy&quot; and arbitrarly declared as deprecated.<br=
>
<br>
[1] <a href=3D"http://www.diva-portal.org/smash/get/diva2:1212650/FULLTEXT0=
1.pdf" rel=3D"noreferrer" target=3D"_blank">http://www.diva-portal.org/smas=
h/get/diva2:1212650/FULLTEXT01.pdf</a><br>
[2] <a href=3D"https://developers.redhat.com/blog/2017/04/11/benchmarking-n=
ftables/" rel=3D"noreferrer" target=3D"_blank">https://developers.redhat.co=
m/blog/2017/04/11/benchmarking-nftables/</a></blockquote><div><br></div><di=
v>I&#39;m seeing the pages you linked are dated 2018 and 2017. I&#39;m seei=
ng this article [1] dated June 2018 talks about an &quot;important improvem=
ent of performance&quot;, and though I don&#39;t see any evidence backing t=
he statement I&#39;d expect more improvements given than more than one year=
 has passed.</div><div>Do you know whether the worse performance you&#39;re=
 talking about is still the case on recent Linux releases?</div><div><br></=
div><div>I&#39;d say=C2=A0+1 for nftables but just for the syntax which I d=
o like better. I&#39;ll leave the discussion on performance to experts.</di=
v><div><br></div><div>[1]=C2=A0<a href=3D"https://www.zevenet.com/knowledge=
-base/nftlb/nftlb-benchmarks-and-performance-keys/">https://www.zevenet.com=
/knowledge-base/nftlb/nftlb-benchmarks-and-performance-keys/</a></div></div=
></div>

--00000000000021373705995cd796--

--===============8105281628614910391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8105281628614910391==--
