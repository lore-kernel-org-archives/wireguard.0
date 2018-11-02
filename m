Return-Path: <SRS0=Sa1Q=NN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CCDC65C22
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Nov 2018 23:28:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF4E920831
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Nov 2018 23:28:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r6NExxqH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF4E920831
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee432c31;
	Fri, 2 Nov 2018 23:24:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86d33e13
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 23:24:14 +0000 (UTC)
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76e15693
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 23:24:14 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id 124so1977406vsp.12
 for <wireguard@lists.zx2c4.com>; Fri, 02 Nov 2018 16:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=VXw9/kh1yq8R+PirmelIoaxzbGTFLHi3aapzp3t6jWk=;
 b=r6NExxqH+7+IDjo5c+1wl+I8EzY9PdPvyxnhOBeMJfUEbO7+Ma6aBvsCwGoOY7wsku
 iZ1lIKefzuKA0l3tYQPmDu0etcmWy0fcTShntxqtGn5OZc5z8TLbY2sbGrGx/dKpeUG1
 E618NjC/HsVcm8xvOzAutNITGoHeDelC+Moo0GiIB+0wCcf6oo78xHkcxSaozQYhFTG7
 rSi7kXkrrOtw01cwPaZhl3QRaox5s4t6JO9zJYmt/OQb9IYu4lYx5a25gA1forI3Alyz
 2tkh4frZFZd16PKUhtObduLxNPfnkrWEQAOECzzI6hQwJw/EWMsybcnO6rCdlgbuOhUl
 9htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=VXw9/kh1yq8R+PirmelIoaxzbGTFLHi3aapzp3t6jWk=;
 b=QMclTor5VnQL6PVU1j6ut1fuI733op1JafVfmwkG5vP5O+ORC6Ou+lLnicGdqb7B0I
 pV5bl3xUx2eIjQPBdWMpRf9aVpCaS3YgtoUvlKAX9R0KdlTitgm+If+8Q8z1YqGNHyUa
 fQWtbdb3zwEdqShOiLGPuGp5bSJJxGFw96bLN2lSjsKwFAJD9+GShuzRqReTjPH6wuKG
 ROULw/u5ngJG1zf/q9j2gdkNVN/qZq55ua4xAbXdjDSN+sBENbtlO9bfdH+eXYXgpD2U
 mZ0RxW9k3Vp9jKIjAnV87mgMC6cqczDYIUNIkoeerBz5SutX1YOv1sjiufeZ7uUVMz5H
 zpog==
X-Gm-Message-State: AGRZ1gJG/gX7NzGBl8lgvQU6O/8xqJ44wn2oKrvwEq5xOo2TL5cmsOFj
 sXJ5NS+/bhDAUNAjcWq1yO2gwCmah8QnEFNW4DPiwg==
X-Google-Smtp-Source: AJdET5dXxFP0BQYvhRvnLA6+eEvRWG1cAIOiMS427cugRZmzI4b/6kBBnha0DUaD2lKYAjZUl8EjbCyZC+oMEU7m+2M=
X-Received: by 2002:a67:4c8f:: with SMTP id h15mr5751610vsg.110.1541201287756; 
 Fri, 02 Nov 2018 16:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
 <b0nxrg6FW687Fl8Gai_Eo8VNChZfWGIxiEhhrcjdPJY9UKGgbYOTzxkzek-YZ01khNfWy76jBAsL8wtUVj0ECl3uF_nu3r6Yk_mYSpY4O28=@protonmail.ch>
 <17a30c81-d413-a742-77a7-8743b2574a3c@powerneth.ro>
 <87pnvnmvsc.fsf@fifthhorseman.net>
In-Reply-To: <87pnvnmvsc.fsf@fifthhorseman.net>
From: Reuben Martin <reuben.m.work@gmail.com>
Date: Fri, 2 Nov 2018 18:27:55 -0500
Message-ID: <CALJ2VGaq8AasV99YApW5UWEKK0B-r+uafT7nEjbKARfwADab+A@mail.gmail.com>
Subject: Re: wireguard dkms systemd
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============1123457269904859284=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1123457269904859284==
Content-Type: multipart/alternative; boundary="00000000000048c0600579b6e356"

--00000000000048c0600579b6e356
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 2, 2018, 6:06 PM Daniel Kahn Gillmor <dkg@fifthhorseman.net
wrote:

> On Sun 2018-10-21 18:49:19 +0300, Lucian Cristian wrote:
> > is an annoyance to restart it manually, if you are inside the vpn, you
> > can't do it, I thought that there is a restart script at package update..
>
>
>
> If anyone has a robust/reliable solution that's not likely to cause the
> kinds of problems i'm concerned about, i'd love to hear it.
>

All this discussion about service management kinda misses the point. You're
swapping out a kernel module. There will always be risk. Changing service
management procedures won't mitigate that. If you do not have a means to
connect outside of the VPN connection, and the module (or service) fail,
you're SOL.

-Reuben

>

--00000000000048c0600579b6e356
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Fri, Nov 2, 2018, 6:06 PM Daniel Kahn Gillmor &lt;<a href=3D"mailto:dkg@=
fifthhorseman.net">dkg@fifthhorseman.net</a> wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On Sun 2018-10-21 18:49:19 +0300, Lucian Cristian wrote:<b=
r>
&gt; is an annoyance to restart it manually, if you are inside the vpn, you=
 <br>
&gt; can&#39;t do it, I thought that there is a restart script at package u=
pdate..<br>
<br><br>
<br>
If anyone has a robust/reliable solution that&#39;s not likely to cause the=
<br>
kinds of problems i&#39;m concerned about, i&#39;d love to hear it.<br></bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">All this=
 discussion about service management kinda misses the point. You&#39;re swa=
pping out a kernel module. There will always be risk. Changing service mana=
gement procedures won&#39;t mitigate that. If you do not have a means to co=
nnect outside of the VPN connection, and the module (or service) fail, you&=
#39;re SOL.</div><div dir=3D"auto"><br></div><div dir=3D"auto">-Reuben</div=
><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
</blockquote></div></div></div>

--00000000000048c0600579b6e356--

--===============1123457269904859284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1123457269904859284==--
