Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3901DC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 19:47:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 896A320879
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 19:47:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=natulte-net.20150623.gappssmtp.com header.i=@natulte-net.20150623.gappssmtp.com header.b="oY2GL0gB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 896A320879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=natulte.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06320873;
	Wed, 2 Jan 2019 19:44:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46aebe0a
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 19:44:18 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0187449
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 19:44:18 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id x85-v6so27941983ljb.2
 for <wireguard@lists.zx2c4.com>; Wed, 02 Jan 2019 11:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=natulte-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sFQyBAxm8i5uc0xZ9k0ITq0RfejTLVtj6Nx5h4k02T4=;
 b=oY2GL0gBeMMv36ekpB7NINnhRU0ARZFDnz1FUwk2biCXSCw8nkU8CrpUClus5QjfqU
 L9IhHm5N8IUmJn9rKY6fDCcvJ0aWQ1/JAJiN0SP1MIIMooD3QyzWrnaXWrG3j3mcPUZs
 bLyT9pmgd01NqMziy75fZfiINllFSJqovZzpCJ+B7AiLMl6zJ3BEP4AOFTiYsPTMVgxD
 hvHQZiONtO+YZtmhmsv35pl6gsT7Dyxrnp1sG1DRr+H70dLbg87+DebLeZW2MykyGUbi
 XAUufILVXBPM3YbeVsBJlP9xP+Sei8CRycg9EjQfKuc7oFp59WJhbVnyKq+0jMRXeOGn
 ZP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sFQyBAxm8i5uc0xZ9k0ITq0RfejTLVtj6Nx5h4k02T4=;
 b=f/ZSeuE3RJhP6ONg07u4joosSXoySdequrCVff6vZbXbG8PzWIo48cNKRUGXjZdL9A
 JSspPY74mTwWYBmTH9S94VQZ/qHW54rVKkCJcetUSO4GHPBDNYbVdTJnqIQkr8HzVLfe
 qr709rXL5+pBsfnhiB6KoPyVpQSw7K7MdYbtuAnKA7DYm+Dvo/2gsSCx+x3yKAdzAOSy
 1dT7A1PhIQDuiSJ8r46YdJ+zAl+/biTwUODh8IQ29AtZk40fu6ovccdC06FNYZmvTB2t
 dUE/UHouLLhOGuvohBpyijrahVIam3DmwfWmjb/pM4QRyTNqThyFN3o1q916aMuYNFJu
 8n+g==
X-Gm-Message-State: AJcUukeIWHeSw338lCMyD49v+qTwFHeIKFHMTsQtV4oSQpfKmclbMpk0
 ObYpeyWKnCwdiSE44N3fF1jt9yTwNTbP0wt31mol91vG
X-Google-Smtp-Source: ALg8bN6GCPGspMqY4ovMH9sgIY+hqLgS5GLeXJt3J/il+3eb/TRHg8RReZxIJ6z9yvR/kWiZlqt9otHairsFSsGweGs=
X-Received: by 2002:a2e:81a:: with SMTP id 26-v6mr27535795lji.14.1546458401819; 
 Wed, 02 Jan 2019 11:46:41 -0800 (PST)
MIME-Version: 1.0
References: <CAJp+990eMsXR1hVwY9Vdtjtz+6d=1SrR8iPHof=9-XaKj9ZZXg@mail.gmail.com>
In-Reply-To: <CAJp+990eMsXR1hVwY9Vdtjtz+6d=1SrR8iPHof=9-XaKj9ZZXg@mail.gmail.com>
From: David Anderson <dave@natulte.net>
Date: Wed, 2 Jan 2019 11:46:31 -0800
Message-ID: <CAMx+r7WE5pdKjbOX4--OVn9gxrcL6O6+xF9cDfdk-_7xpgAbzQ@mail.gmail.com>
Subject: Re: Is udp data corruption over wireguard possible?
To: Matt Avery <matthewaveryusa@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8124691826768772541=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8124691826768772541==
Content-Type: multipart/alternative; boundary="000000000000b36260057e7ee74d"

--000000000000b36260057e7ee74d
Content-Type: text/plain; charset="UTF-8"

It's not possible within the tunnel, but it's still possible anywhere else
in the path.

That said, you should never rely on the IP/TCP/UDP checksums at the
application layer. Most modern router ASICs unconditionally recalculate the
checksum right before transmission (to account for any packet mangling that
happened in the ASIC pipeline), so it's very common for routers with faulty
RAM or a faulty ASIC to corrupt a packet and then recalculate all the L3/L4
checksums to be "correct" before transmitting the broken packet.

If you need to verify traffic integrity, you need your own integrity check
at L7 - ideally bound to a cryptographic exchange so you can be certain
that it's an e2e integrity check that cannot be tampered with even by
"smart" proxies. Wireguard can provide you some "integrity by proxy" if
you're not routing traffic on either end of the tunnel, but that won't save
you in any other cases :)

- Dave

On Wed, Jan 2, 2019 at 11:37 AM Matt Avery <matthewaveryusa@gmail.com>
wrote:

> It dawned to me today that if I write an application that sends udp
> datagrams through the wireguard interface that corruption of the data
> within the datagram is not possible even if I decide to zero-out my
> datagram checksums (assuming the datagram doesn't get intentionally
> corrupted within the kernel.)
>
> Is that assumption correct?
>
> Thanks,
> -Matt
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000b36260057e7ee74d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It&#39;s not possible within the tunnel, but it&#39;s stil=
l possible anywhere else in the path.<div><br></div><div>That said, you sho=
uld never rely on the IP/TCP/UDP checksums at the application layer. Most m=
odern router ASICs unconditionally recalculate the checksum right before tr=
ansmission (to account for any packet mangling that happened in the ASIC pi=
peline), so it&#39;s very common for routers with faulty RAM or a faulty AS=
IC to corrupt a packet and then recalculate all the L3/L4 checksums to be &=
quot;correct&quot; before transmitting the broken packet.</div><div><br></d=
iv><div>If you need to verify traffic integrity, you need your own integrit=
y check at L7 - ideally bound to a cryptographic exchange so you can be cer=
tain that it&#39;s an e2e integrity check that cannot be tampered with even=
 by &quot;smart&quot; proxies. Wireguard can provide you some &quot;integri=
ty by proxy&quot; if you&#39;re not routing traffic on either end of the tu=
nnel, but that won&#39;t save you in any other cases :)</div><div><br></div=
><div>- Dave</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On =
Wed, Jan 2, 2019 at 11:37 AM Matt Avery &lt;<a href=3D"mailto:matthewaveryu=
sa@gmail.com">matthewaveryusa@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail=
_default" style=3D"font-family:monospace,monospace;font-size:small;color:rg=
b(0,0,0)">It dawned to me today that if I write an application that sends u=
dp datagrams through the wireguard interface that corruption of the data wi=
thin the datagram is not possible even if I decide to zero-out my datagram =
checksums (assuming the datagram doesn&#39;t get intentionally corrupted wi=
thin the kernel.)</div><div class=3D"gmail_default" style=3D"font-family:mo=
nospace,monospace;font-size:small;color:rgb(0,0,0)"><br></div><div class=3D=
"gmail_default" style=3D"font-family:monospace,monospace;font-size:small;co=
lor:rgb(0,0,0)">Is that assumption correct?<br><br>Thanks,<br>-Matt</div></=
div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--000000000000b36260057e7ee74d--

--===============8124691826768772541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8124691826768772541==--
