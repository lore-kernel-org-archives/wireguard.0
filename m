Return-Path: <SRS0=6kAx=MR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NORMAL_HTTP_TO_IP,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96513C00449
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Oct 2018 15:42:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C26E72087D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Oct 2018 15:42:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="fkmnXSs2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C26E72087D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ebe251c;
	Fri, 5 Oct 2018 15:41:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9aee0cee
 for <wireguard@lists.zx2c4.com>; Fri, 5 Oct 2018 15:41:23 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e55e284a
 for <wireguard@lists.zx2c4.com>; Fri, 5 Oct 2018 15:41:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 096e6ffd
 for <wireguard@lists.zx2c4.com>; Fri, 5 Oct 2018 15:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=NvMaLOU2sclTXpyjt63w0EH7mDI=; b=fkmnXS
 s2fVXBlVXRa/zwHcekmfvMQFNtK8B4BBvc8UG5WlzoXOlOfYG1V8PzwtEZqrY7h5
 SB5ni+3kKenU7Dim0X1mv20igMrk5fmzpG+hqIafXEVAvzJCBhbuWVpi7JLc+j7C
 Kq++FckThMDcfVXk8F9ORK0IzvqJDyZu/d8wSa5rm7nN+Zg5NYqHeO3QQfwoxpd8
 OvOcwvjKhWqbpq5hCsrdB0rNS0NgK5N1OP/6hTHJSX1zowEG6xcEL7dFhZGiZ9gH
 RemTpIM9evzoWZs1GZZiwYJbMwt4tP5ArM/zbR8hJtv6LMFhvXAgQ1sq2PG31EC9
 2PfyYkF4IE2bdGJQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id da3a56e0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Oct 2018 15:41:23 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id u197-v6so10754004oif.5
 for <wireguard@lists.zx2c4.com>; Fri, 05 Oct 2018 08:41:48 -0700 (PDT)
X-Gm-Message-State: ABuFfogV354+yWw+svwm2AQBnKSLa/0GfWUBQlGQFkkaQClyIUEY/s8I
 HdRueuSEBEuKOoGDbUIUFGRrsrf891bMlK+AAnk=
X-Google-Smtp-Source: ACcGV616Y8FuXQKY8gj6b/nS/gsaVwYrLA/5+Q5YBPbG0O0SvAL6Ty4cxe1gj7PLqXV56cM/mwLrJEOskZhehqPR92k=
X-Received: by 2002:aca:b04:: with SMTP id 4-v6mr3660074oil.192.1538754108245; 
 Fri, 05 Oct 2018 08:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20181004155359.GA5957@puremoods>
 <CAHmME9rt2irKq1JFkkWdNLKFTJapCKopkUCpnyXugN=dUWqW=A@mail.gmail.com>
 <874le0d82v.fsf@toke.dk>
In-Reply-To: <874le0d82v.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 5 Oct 2018 17:41:32 +0200
X-Gmail-Original-Message-ID: <CAHmME9rTRTs+yXDvf99wAcrHd4mOhjkmhN2a_uLRzQoiJ5_=Uw@mail.gmail.com>
Message-ID: <CAHmME9rTRTs+yXDvf99wAcrHd4mOhjkmhN2a_uLRzQoiJ5_=Uw@mail.gmail.com>
Subject: Re: Sending just ssh traffic via wg
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============8769885580005356189=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8769885580005356189==
Content-Type: multipart/alternative; boundary="00000000000004cf0a05777d1c5f"

--00000000000004cf0a05777d1c5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 5, 2018, 12:03 Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk> =
wrote:

> "Jason A. Donenfeld" <Jason@zx2c4.com> writes:
>
> > Hey Konstantin,
> >
> > When you're doing policy routing with packets that are being forwarded
> > by the system -- a router, for example -- then the prerouting table is
> > sufficient. But for locally generated packets, you have to use the
> > OUTPUT table and also probably MASQUERADE. I just reproduced
> > everything here and confirm this works:
> >
> > ip route add default dev wg0 table 2468
> > ip rule add fwmark 1234 table 2468
> > wg set wg0 peer [...] allowed-ips 0.0.0.0/0
> > sysctl net.ipv4.conf.wg0.rp_filter=3D0
> > iptables -t nat -A POSTROUTING -p tcp --dport 22 -m addrtype
> > --src-type LOCAL -j MASQUERADE
> > iptables -t mangle -A OUTPUT -p tcp --dport 22 -j MARK --set-mark 1234
>
> Any reason why you can't just do
>
> ip rule add dport 22 lookup 2468
>

That's indeed the best by far as long as other netfilter fanciness isn't
desired. Probably should set ipproto to tcp too in the rule.

Jason


> ?
>
> -Toke
>

--00000000000004cf0a05777d1c5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Fri, Oct 5, 2018, 12:03 Toke H=C3=B8iland-J=C3=B8rgensen &lt;<a href=3D"=
mailto:toke@toke.dk">toke@toke.dk</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">&quot;Jason A. Donenfeld&quot; &lt;<a href=3D"mailto:Jason@zx=
2c4.com" target=3D"_blank" rel=3D"noreferrer">Jason@zx2c4.com</a>&gt; write=
s:<br>
<br>
&gt; Hey Konstantin,<br>
&gt;<br>
&gt; When you&#39;re doing policy routing with packets that are being forwa=
rded<br>
&gt; by the system -- a router, for example -- then the prerouting table is=
<br>
&gt; sufficient. But for locally generated packets, you have to use the<br>
&gt; OUTPUT table and also probably MASQUERADE. I just reproduced<br>
&gt; everything here and confirm this works:<br>
&gt;<br>
&gt; ip route add default dev wg0 table 2468<br>
&gt; ip rule add fwmark 1234 table 2468<br>
&gt; wg set wg0 peer [...] allowed-ips <a href=3D"http://0.0.0.0/0" rel=3D"=
noreferrer noreferrer" target=3D"_blank">0.0.0.0/0</a><br>
&gt; sysctl net.ipv4.conf.wg0.rp_filter=3D0<br>
&gt; iptables -t nat -A POSTROUTING -p tcp --dport 22 -m addrtype<br>
&gt; --src-type LOCAL -j MASQUERADE<br>
&gt; iptables -t mangle -A OUTPUT -p tcp --dport 22 -j MARK --set-mark 1234=
<br>
<br>
Any reason why you can&#39;t just do<br>
<br>
ip rule add dport 22 lookup 2468<br></blockquote></div></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">That&#39;s indeed the best by far as long a=
s other netfilter fanciness isn&#39;t desired. Probably should set ipproto =
to tcp too in the rule.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Jason</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
?<br>
<br>
-Toke<br>
</blockquote></div></div></div>

--00000000000004cf0a05777d1c5f--

--===============8769885580005356189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8769885580005356189==--
