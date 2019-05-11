Return-Path: <SRS0=sgLz=TL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C79C04AB1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 11:34:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B6CA216C4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 11:34:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJZKXRCc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B6CA216C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7da97e64;
	Sat, 11 May 2019 11:34:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7550504b
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 May 2019 11:34:31 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6490165b
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 May 2019 11:34:31 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id v18so5926150lfi.1
 for <wireguard@lists.zx2c4.com>; Sat, 11 May 2019 04:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cGqRcPufAOnoqqz5aCeEj120V2Bp8N6WWmHt8dB78HE=;
 b=ZJZKXRCcp9Jr/Kt2xxlFQV7NdWdrO419lVFdvnY6hljZFJ8EuDNvcbQtxesxmuLMac
 QbSeu/uXFOPehyQSNEKgkUCOGiPYYWk6Tx8WE1tpiCeDPPrG6BJwkxsbNVR8l3fyQATV
 k26maUJ5H87GiaeIcqDOhjc+sJyZ5ZniXC1wesjFxn+b4/iskszS7EazonDSTZhdwBdB
 0rIkdzWL1PnygqjHuTvtAaES4a2pbb4l4WYvLwtLmEZBq70KRGUtnGIDaMq2sEjXcVH5
 op9gLyxlujMuFAt9ZMIYhuVMuSUUoIpFdl+oN9MRHuyWKn1SHcHt3M21hbSAL2TmiO/L
 y9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cGqRcPufAOnoqqz5aCeEj120V2Bp8N6WWmHt8dB78HE=;
 b=AlTzYpa0pFtcB+w5pN0gX5HlbLeMBa/HGnaQn54A4bEDDNA0AZwTzF00hgliLQrxfk
 byThGoPawC12r7YlO2RC7DVMoaKDs6RkDLDKzmmoDomknw5iU0D+pr3a7NpiExMqKT+l
 E0UAGFat8SGIrQJ2EuoV8ghD7uZQkmxm0ZpMkXH9EPEncswDheZOe0rmr1SMwZRpcm+G
 6Q5rHOWRQrmtr6kNHzpvAGAhx4nXK09tWd/BTzLV8/Pr5eVmYbfp5tDNQfEJrzQdSB8Z
 7ijAzyJa5tkD7oBwhonCjXEC7CXrOtCiyXb4DXUesmcHzdeRNQJS1UA5moAyqEBF3e6l
 qelg==
X-Gm-Message-State: APjAAAVnQQhIicHI8/7iDOUxlkhhXEWixTgu6NI4aOYmPZUhEhkxl3TQ
 UTBGkKEO4zJ80NqU9JlxeRhHZTdiCG3x5hiBJXs=
X-Google-Smtp-Source: APXvYqwUChq6damtRk55oUf7Zrcp9KIH86TIkJanlMOZ7DkRYuzWyCnloYhuthUSUfLp5ojcv0hYa+nQ3bgZ79OFz2Q=
X-Received: by 2002:a19:4811:: with SMTP id v17mr2625804lfa.10.1557574469109; 
 Sat, 11 May 2019 04:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190510115445.GA29887@sita-dell>
 <CAJ6XMjFxfm=0L2URLzn8pkZY1y4zU+mskgd7ykRKOjXSza4tSA@mail.gmail.com>
 <CAJ6XMjH23+k+hu0AighRFX4352O1r332mhd28p=+tw3n0T4+ZQ@mail.gmail.com>
 <20190511010857.GA15995@sita-dell>
In-Reply-To: <20190511010857.GA15995@sita-dell>
From: Steve Dodd <steved424@gmail.com>
Date: Sat, 11 May 2019 12:34:18 +0100
Message-ID: <CAJ6XMjFeO6uZRPts7w20qvkHoN7kZC6R4cH8s9BwF0nTU6rpCg@mail.gmail.com>
Subject: Re: Fwd: bypassing wireguard using firejail
To: Sitaram Chamarty <sitaramc@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============7346294604073332494=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7346294604073332494==
Content-Type: multipart/alternative; boundary="000000000000f14d3905889b107a"

--000000000000f14d3905889b107a
Content-Type: text/plain; charset="UTF-8"

On Sat, 11 May 2019 at 02:09, Sitaram Chamarty <sitaramc@gmail.com> wrote:

> On Fri, May 10, 2019 at 05:18:39PM +0100, Steve Dodd wrote:
>


> > I'm not 100% clear on your setup .. Have you got a network namespace set
> > up? If not, you haven't got much security anyway, I suspect. It turns out
> > it's not too hard .. you're welcome to my hacky scripts if you're
> > interested.
>
> I don't think it has anything to do with my wireguard setup.
>

Network namespaces are worth looking into - it's what I used to avoid
things "escaping" the VPN. They literally can't see any other interfaces,
get their own routing table, etc.

Hacky scripts:

setup: https://pastebin.com/TChbUfL5
teardown: https://pastebin.com/ghYGJQEw
runas: https://pastebin.com/h9vEvryt (this needs to be run by sudo - edit
sudoers appropriately)

WG website has gory details:

https://www.wireguard.com/netns/


> If you meant firejail setup, it is when I use "--net" (which,
> according to the manpage, "Enable[s] a new network namespace and
> connect[s] it to this ethernet interface", that the bypass
> happens.
>

I was meaning setting up a namespace before running firejail .. I actually
find it's tidier and avoids confusion about default routes, etc. Then the
interesting question would be if firejail could break out of that
namespace, and if so how to stop it.


> Some other tool, if it's running as root or is suid root, can
> still bypass wireguard, regardless of how it is setup.
>

I suspect that can be prevented - on modern systems being root isn't
necessarily the be-all and end-all. Capabilities and namespaces can still
be used to  constrain applications in lots of ways.

S.

--000000000000f14d3905889b107a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr">On Sat, 11 May 2019 at 02:09, Sitaram Chamarty &=
lt;<a href=3D"mailto:sitaramc@gmail.com">sitaramc@gmail.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Fri, May 10, 2019 at 05:18:39PM +0100, Steve Dodd wrote:<br><=
/blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">&gt; I&#39;m not 100% clear on your setup .. Have you got a network nam=
espace set<br>
&gt; up? If not, you haven&#39;t got much security anyway, I suspect. It tu=
rns out<br>
&gt; it&#39;s not too hard .. you&#39;re welcome to my hacky scripts if you=
&#39;re<br>
&gt; interested.<br>
<br>
I don&#39;t think it has anything to do with my wireguard setup.<br></block=
quote><div><br></div><div>Network namespaces are worth looking into - it&#3=
9;s what I used to avoid things &quot;escaping&quot; the VPN. They literall=
y can&#39;t see any other interfaces, get their own routing table, etc.</di=
v><div>=C2=A0</div><div>Hacky scripts:</div><div><br></div><div>setup:=C2=
=A0<a href=3D"https://pastebin.com/TChbUfL5">https://pastebin.com/TChbUfL5<=
/a></div><div>teardown: <a href=3D"https://pastebin.com/ghYGJQEw">https://p=
astebin.com/ghYGJQEw</a><br></div><div>runas:=C2=A0<a href=3D"https://paste=
bin.com/h9vEvryt">https://pastebin.com/h9vEvryt</a> (this needs to be run b=
y sudo - edit sudoers appropriately)</div><div><br></div><div>WG website ha=
s gory details:</div><div><br></div><div><a href=3D"https://www.wireguard.c=
om/netns/">https://www.wireguard.com/netns/</a><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
If you meant firejail setup, it is when I use &quot;--net&quot; (which,<br>
according to the manpage, &quot;Enable[s] a new network namespace and<br>
connect[s] it to this ethernet interface&quot;, that the bypass<br>
happens.<br></blockquote><div><br></div><div>I was meaning setting up a nam=
espace before running firejail .. I actually find it&#39;s tidier and avoid=
s confusion about default routes, etc. Then the interesting question would =
be if firejail could break out of that namespace, and if so how to stop it.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">So=
me other tool, if it&#39;s running as root or is suid root, can<br>
still bypass wireguard, regardless of how it is setup.<br></blockquote><div=
><br></div><div>I suspect that can be prevented - on modern systems being r=
oot isn&#39;t necessarily the be-all and end-all. Capabilities and namespac=
es can still be used to=C2=A0 constrain applications in lots of ways.</div>=
<div><br></div><div>S.</div></div></div></div></div></div></div>

--000000000000f14d3905889b107a--

--===============7346294604073332494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7346294604073332494==--
