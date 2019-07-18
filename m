Return-Path: <SRS0=0coH=VP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF9AC76191
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jul 2019 06:39:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA9202173E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jul 2019 06:39:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qlXJCQb+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA9202173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59c0f4a4;
	Thu, 18 Jul 2019 06:39:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2a124c8
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jul 2019 06:39:06 +0000 (UTC)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83f529d6
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jul 2019 06:39:06 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id j6so17439183ioa.5
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jul 2019 23:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kAKxhlXIKGIppy/YQQr24m1BDpG78xalf3r4ExNyi0o=;
 b=qlXJCQb+GwCZjzUBw+i4GWbVoauKYc/y2ed338aLZR2CAJg9D7j4zD9ORtvHBUGkcl
 3OWgxtXA3YhAxyoFQBdbfWsA4Y7LpB3UeuVC5VU6zOcGL9jcAr76hT95HWhOyxo5y1uz
 Gao4OhHt58LlhtnWVyZjegnHW8kw3b5o6R2ID2G02JMUrk2/EAxGpGwnn1j3r5jb0TzJ
 2mQfgwanM1ZAJJdd0euQn3VTItMQmHCZL2CaddGXCbzOYn/3rtf5g8R0g6mi3ZpeqBqX
 Vz3mxb4c4Rt8f0hlX59Sd2mXd2iUhT2dVm8hn9T5lh8/zy+L36HeVKJXMzGKhJ4cIk9I
 iNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kAKxhlXIKGIppy/YQQr24m1BDpG78xalf3r4ExNyi0o=;
 b=IqARmOQRgtfZ2Z/aIacLawlZQRjHmNplzcGg+qsgIQv6PWfnLUmEgxSL3hz77zzN6n
 kPYTBiIpldTbCE1OjRL1zCyXVYnbUNtu3S9QPYy2Nhqj+rSNIYGOumZc6CFQDij1wTda
 /nH8LzU8UFdGOXRJRxxR8lkiAPfBcle8Fk5KSzoAUDmpbheTHYBpDMzE80tZ9WUwYRPE
 Pl8pGOU4v7Lo5vEmebzxdiJGNnCPgd4N6uz6ku3m6mNoU22K97NeoSfmp1jmt5bI8pBY
 xV+buLcN50SQCfqjk5JJ4HsOcfqOFuDSUzzzzur4lyPMNCFSt4Kc9gb3wOfBx4sYafcf
 /oEg==
X-Gm-Message-State: APjAAAXtPc5RBpoLPEQBSMJN210AZ2XXSjYagVa9nd2sRgp6D7eZzZ3j
 5hiORsGrTnGWhEnvW27gKJqCQ9MQzi4VKAipi3wu/vTc
X-Google-Smtp-Source: APXvYqzVcploMN9I79s2zWM00CdqI2sgBCYgBJ9OY+RR1V7p4203qIo/EIUjY4r08+oKodDNvV7qJIgLNz1XGfPaLYU=
X-Received: by 2002:a5d:8508:: with SMTP id q8mr41563815ion.31.1563431945906; 
 Wed, 17 Jul 2019 23:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAKJniYRn7ZkV9tGOpK=mZoDb24TfMyq44zgE0c5uPo+Ac-sZsA@mail.gmail.com>
 <20190718015027.00e6010f@natsu>
In-Reply-To: <20190718015027.00e6010f@natsu>
From: Janne Johansson <icepic.dz@gmail.com>
Date: Thu, 18 Jul 2019 08:38:54 +0200
Message-ID: <CAA6-MF8gzQOdo9qxhpBJdcOUZ57bfdA8fCPZTi15XbYvG1pATA@mail.gmail.com>
Subject: Re: Speed on Raspberry Pi 4
To: Roman Mamedov <rm@romanrm.net>
Cc: Christopher Bachner <hello@chrisbox.org>,
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
Content-Type: multipart/mixed; boundary="===============2459852735790710869=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2459852735790710869==
Content-Type: multipart/alternative; boundary="000000000000c42e9f058deedd53"

--000000000000c42e9f058deedd53
Content-Type: text/plain; charset="UTF-8"

Den ons 17 juli 2019 kl 22:53 skrev Roman Mamedov <rm@romanrm.net>:

> On Sat, 29 Jun 2019 12:38:01 +0200
> Christopher Bachner <hello@chrisbox.org> wrote:
> > In htop I can see that one of the 4 cores is running at 99%. So I assume
> > that is the bottleneck.
> > Is there a way to improve this? I assume it does not matter which side is
> > the server and which is the client?
>
> You can see that the load from WireGuard encryption is about 42-43% per
> each
> core. But the thing is, one of them (the 1st) also gets to process
> interrupt
> load from the NIC, and that consumes the rest of it, causing the
> bottleneck. In
> theory, if you could limit WG to run encryption on all cores EXCEPT the
> first
> one, then maaaaybe...
>
>
With taskset you should be able to:
https://www.howtoforge.com/linux-taskset-command/


-- 
May the most significant bit of your life be positive.

--000000000000c42e9f058deedd53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Den ons 17 juli 2019 kl 22:53 skrev Roman=
 Mamedov &lt;<a href=3D"mailto:rm@romanrm.net">rm@romanrm.net</a>&gt;:<br><=
/div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Sat, 29 Jun 2019 12:38:01 +0200<br>
Christopher Bachner &lt;<a href=3D"mailto:hello@chrisbox.org" target=3D"_bl=
ank">hello@chrisbox.org</a>&gt; wrote:<br>
&gt; In htop I can see that one of the 4 cores is running at 99%. So I assu=
me<br>
&gt; that is the bottleneck.<br>
&gt; Is there a way to improve this? I assume it does not matter which side=
 is<br>
&gt; the server and which is the client?<br>
<br>
You can see that the load from WireGuard encryption is about 42-43% per eac=
h<br>
core. But the thing is, one of them (the 1st) also gets to process interrup=
t<br>
load from the NIC, and that consumes the rest of it, causing the bottleneck=
. In<br>
theory, if you could limit WG to run encryption on all cores EXCEPT the fir=
st<br>
one, then maaaaybe...<br>
<br></blockquote><div><br></div><div>With taskset you should be able to:</d=
iv><div><a href=3D"https://www.howtoforge.com/linux-taskset-command/">https=
://www.howtoforge.com/linux-taskset-command/</a><br></div><div><br></div></=
div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">May th=
e most significant bit of your life be positive.<br></div></div>

--000000000000c42e9f058deedd53--

--===============2459852735790710869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2459852735790710869==--
