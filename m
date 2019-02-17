Return-Path: <SRS0=e3Y3=QZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081B1C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 23:03:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98E9A20578
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 23:03:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vewcTYW2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98E9A20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c32dd6b;
	Mon, 18 Feb 2019 22:54:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e558bfe3
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 12:59:19 +0000 (UTC)
Received: from mail-it1-x131.google.com (mail-it1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74b98e67
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 12:59:19 +0000 (UTC)
Received: by mail-it1-x131.google.com with SMTP id h6so33521371itl.1
 for <wireguard@lists.zx2c4.com>; Sun, 17 Feb 2019 05:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=o4d3Wx7Z/DXYTnk7kpWDXtBbB6VtZ1YNSHlyobnoigE=;
 b=vewcTYW267LkknOa9PEEjWVI2W7GxP+VaMNuF6F6aZZcAQuiyAaxU7c/yZTS7JR/TE
 PjwSaJiaI4Hv09iEhUkaACmcyPRxyYBKZbjMQIUbz5E8blqrS9eqEdrIhYAYLO+WqSs1
 5W1gW9FgnCABBEA1RauIXUtP6ZDltmkAKAF9AgjHWTpqQKmNCkEvh/7UbRyfyJp4ngeP
 fyaAQj//+m0quj0/VbR7RiHGkmvZFgSolgaKFatBxENMrSxWfXxMxs5cFx4l/FA7csqr
 VejWt1fbAVDMax0I/knZIKjsWRV1WAciT/7ol0gsqMTdxspZLMqs+F8eGnCsFuPptXVe
 jM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=o4d3Wx7Z/DXYTnk7kpWDXtBbB6VtZ1YNSHlyobnoigE=;
 b=aoyLwmLAUha1d2EJUwkaF8+y/6h1vsBq7p6QFegQ4jLLJqkAW5fLHHX/c03502IMJA
 zaK3rHLstikBCqbZUier4D3l5bsZQ0hbN8maczSLnoTlHGF2BrvISRpq2+bNpLivouqu
 aThUrDnnkc0Vd8AKlPPjpbXEnN5UNOC/lhA+LgUmqhar/kblPpV+yi+lxZ7mEH98nBli
 1gbgzbmLVUq8XQCsuwtA71JNCAsfM1HTgKw8aoIWZUf0nxv6zFMQigjVwPqjxzlTWxq7
 H3hJtTIh0j4fczipXYNyjuBEJCI3kl5Em5vx3EWbGVAoyTPqE+G9IjL+4ggWLmFRHKT5
 W3sw==
X-Gm-Message-State: AHQUAubXE3IDH1ILY5FPcDHt2lBH/5WwYuPMos9GfpMbhGB1DEpAp1H9
 E7YODofG1UUKPEyq9wVrKmEoo3f/Qy0r+srstSWIwy6D
X-Google-Smtp-Source: AHgI3IZ+9BrNQDGC+gRg22DIJKn0jUl+h9f5a+73z+tcdlPrSU9b7/QMZRSFM6pnqU/Wx/GZ2/Q9cdw09415/PBzx5g=
X-Received: by 2002:a24:c056:: with SMTP id u83mr8294040itf.10.1550408855931; 
 Sun, 17 Feb 2019 05:07:35 -0800 (PST)
MIME-Version: 1.0
References: <8_iPFshR7GasRS24vRTFKp3pG-UGxQLluTaoZZeAO-UlYBTQ2nCHNlMniuKWz9tWpWPbbXS8Br3SxRpCjcruohwFw8PD83jko2lrf3E7hq4=@wieliczko.ninja>
 <CAJJxGdG2G+busk12y==dZOL2__+C1T6nQy+tGRJM=M65-SuZ5Q@mail.gmail.com>
 <CAH8yC8=2pjH3VbxaeJ-sTSnV64-KxKK3AHA7K_EEANX5_g02Mw@mail.gmail.com>
 <CHanFQf0BHc_tN8WFKYbpEbjSNMTveoCt1-zENLXnF_XJpdYLN4ywKtkwQ9mjdEYd55O4fQyMNHwRozH7Qi30CjTkiuUO_nPsHNLe_D5EyI=@wieliczko.ninja>
In-Reply-To: <CHanFQf0BHc_tN8WFKYbpEbjSNMTveoCt1-zENLXnF_XJpdYLN4ywKtkwQ9mjdEYd55O4fQyMNHwRozH7Qi30CjTkiuUO_nPsHNLe_D5EyI=@wieliczko.ninja>
From: Jeffrey Walton <noloader@gmail.com>
Date: Sun, 17 Feb 2019 08:07:13 -0500
Message-ID: <CAH8yC8nz5wwL=xKipUwUtrMqQJ5fHcWAdwzrMpX0Hxck+gO0kQ@mail.gmail.com>
Subject: Re: DNS name resolution should not be done during configuration
 parsing.
To: Eryk Wieliczko <eryk@wieliczko.ninja>
X-Mailman-Approved-At: Mon, 18 Feb 2019 23:54:27 +0100
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: noloader@gmail.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Sun, Feb 17, 2019 at 7:40 AM Eryk Wieliczko <eryk@wieliczko.ninja> wrote:
> > Forgive my ignorance... Should init just retry the service start?
> > Something like this (from Systemd):
> >
> > [Unit]
> > StartLimitInterval=360
> > StartLimitBurst=5
> >
> > The statements above say to retry 5 times within 360 seconds.
> Configuring such things is an additional unnecessary step. OpenVPN/tinc don't require such hacks. Once you start OpenVPN, it's gonna work until the server dies of old age. :-)

I have to admit I don't quite understand calling it "unnecessary".

There seems to be two use cases (maybe more?): manual start and auto
start. The auto start case is usually handled by init scripts. Init
scripts usually retry.

I'm not throwing stones, but I have to ask... Why not use the tools
available instead of adding hacks on top of hacks? The hacks likely
make the code brittle. By the time Wiregaurd gets to supporting AIX,
Dragonfly, Hurd, Solaris and other Unix personalities no one will want
to touch it.

Jeff
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
