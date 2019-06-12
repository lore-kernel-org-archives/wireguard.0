Return-Path: <SRS0=VRfM=UN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AF1C31E4E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Jun 2019 18:01:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACBE921841
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Jun 2019 18:01:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRDFRAft"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACBE921841
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa96d2a8;
	Fri, 14 Jun 2019 18:01:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40763496
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jun 2019 00:26:34 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 349eef08
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jun 2019 00:26:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 22so4679213wmg.2
 for <wireguard@lists.zx2c4.com>; Tue, 11 Jun 2019 17:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u+qdcgxLpwsVPyI20R7W3rUBm2auDTHs2DTkwcRn8d4=;
 b=bRDFRAftamNfzaywYbK+VVcWsv8833ftbvQnMcSv+qu/JzPpZGU3+oTN6USP386fTf
 cwOptBoVv2AW7RGOefjVSni5j/KClIEOkQOsN15K8zH9jWt+BjEJ6iyJ6LQ/07mKFO0a
 jC759dClbsS8F9d5mdb82BPpyVkUUAuM483ho1ikPLREU1+DcBPaXm6h1eQT4nkaRhqv
 JD0QbdB1lIEK9acfyJOhnLK5ZZEh6ewoWMEViI3Uig7Rpl99T/1GpOPdiO+WpArWYJUM
 M3kCYedKJowqi/zxVOdpOo5z0ukkthenylOtJB31ZzxzZybxDY4SREg5IsoVrxdmKxO5
 T5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u+qdcgxLpwsVPyI20R7W3rUBm2auDTHs2DTkwcRn8d4=;
 b=e+9a72KKBVaPH/+3va1Vcl39O3iePK+V94EilGjc0V2p5RNxlqN7zlJEF+IeYbtXwd
 /SZ6+ncpObFvdRoFT/sYEFdU0zRYEp4ZRnHM+Yv/+moRs0RIBdPfl/kT9HjvaQqnyaIA
 XwQAerbnlgPPlqa9/i4iE4emFMEDuhTe2fuLV/7o3lSiQtVMW/oenfVMb2krz6yVuhjr
 yPJVjFe5PGa96EGkC9TdEZjmmNmCSJTz2/Ddk8XHjz6SpyKxwgYqqd9EKJ2c9s/wJE44
 nfTUvCpemi/4nPNy3k/xb5JS1ZpdNzjFxN9kiS2saPEpSsUZhAJycnSKkRsqy8zt5nHG
 D1Nw==
X-Gm-Message-State: APjAAAUXYqgj08oi74UxOQCywhFq9SXeQH2QzKfOPr05KN74Ge5TRFQQ
 fmnkzC2GJtC/49GxdZq1XMFTP6X+aNJty8oIceY=
X-Google-Smtp-Source: APXvYqyxEnv9/kV2bEjuEifxSNGLm0RUIcQpFYg7mWf+jOd9pme/ipA8t+5WBY2aBtf1Va66ukJZ4xUJITp11AlRrwA=
X-Received: by 2002:a7b:cbc6:: with SMTP id n6mr20612686wmi.14.1560299192351; 
 Tue, 11 Jun 2019 17:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <6BFBD58C-ACC2-45FD-9986-63CEA1143BA6@lonnie.abelbeck.com>
 <CAHmME9r3QVVWRu=36Yx6wmfuHm5CCA3Dg+JdZknpnNAmnj=ATQ@mail.gmail.com>
 <16a64aa0-924c-4497-8252-cc965a04a740@www.fastmail.com>
In-Reply-To: <16a64aa0-924c-4497-8252-cc965a04a740@www.fastmail.com>
From: Marc Fawzi <marc.fawzi@gmail.com>
Date: Tue, 11 Jun 2019 17:25:54 -0700
Message-ID: <CACioZiuMHZRVxT+_aE9L3dDkn_fADrZCyC8MPgqZ_V5yECxNoQ@mail.gmail.com>
Subject: Re: RFC: wg syncpeers wg0 wireguard.conf
To: Steven Honson <steven@honson.id.au>
X-Mailman-Approved-At: Fri, 14 Jun 2019 20:01:02 +0200
Cc: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============8376910898309749548=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8376910898309749548==
Content-Type: multipart/alternative; boundary="0000000000001a7f12058b157793"

--0000000000001a7f12058b157793
Content-Type: text/plain; charset="UTF-8"

<<
I'm very much in favour of this (updating `setconf` to use this new
syncronisation approach), if anything it feels more logical and is how I
initially (wrongly) assumed `setconf` behaved when starting out with
WireGuard a while back.
>>

+1 ... it's better to keep the same command if its definition can be
expanded (fewer things to remember and less mental clutter)

p.s. does this overlap with similar planned in wg-dynamic?



On Tue, Jun 11, 2019 at 5:23 PM Steven Honson <steven@honson.id.au> wrote:

> On Wed, 12 Jun 2019, at 3:56 AM, Jason A. Donenfeld wrote:
> > The other thing I was wondering is: aside from performance and races
> > as described above, why not just make this the functionality of
> > `setconf`? Then there's be no need to introduce a new subcommand. In
> > otherwords, the idea would be to make `setconf` not destroy existing
> > peers if we're going to be re-adding them again.
>
> I'm very much in favour of this (updating `setconf` to use this new
> syncronisation approach), if anything it feels more logical and is how I
> initially (wrongly) assumed `setconf` behaved when starting out with
> WireGuard a while back.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000001a7f12058b157793
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&lt;&lt;<div>I&#39;m very much in favour of this (updating=
 `setconf` to use this new syncronisation approach), if anything it feels m=
ore logical and is how I initially (wrongly) assumed `setconf` behaved when=
 starting out with WireGuard a while back.<br></div><div>&gt;&gt;</div><div=
><br></div><div>+1 ... it&#39;s better to keep the same command if its defi=
nition can be expanded (fewer things to remember and less mental clutter)</=
div><div><br></div><div>p.s. does this overlap with similar planned in wg-d=
ynamic?</div><div><br></div><div>=C2=A0<br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 11, 2019 at 5:=
23 PM Steven Honson &lt;<a href=3D"mailto:steven@honson.id.au">steven@honso=
n.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Wed, 12 Jun 2019, at 3:56 AM, Jason A. Donenfeld wrote:<br>
&gt; The other thing I was wondering is: aside from performance and races<b=
r>
&gt; as described above, why not just make this the functionality of<br>
&gt; `setconf`? Then there&#39;s be no need to introduce a new subcommand. =
In<br>
&gt; otherwords, the idea would be to make `setconf` not destroy existing<b=
r>
&gt; peers if we&#39;re going to be re-adding them again.<br>
<br>
I&#39;m very much in favour of this (updating `setconf` to use this new syn=
cronisation approach), if anything it feels more logical and is how I initi=
ally (wrongly) assumed `setconf` behaved when starting out with WireGuard a=
 while back.<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--0000000000001a7f12058b157793--

--===============8376910898309749548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8376910898309749548==--
