Return-Path: <SRS0=yjuW=62=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7307EC54E8B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 May 2020 07:36:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D29DB206B7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 May 2020 07:36:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cw33ZiQ4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D29DB206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11c83001;
	Tue, 12 May 2020 07:22:55 +0000 (UTC)
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [2a00:1450:4864:20::642])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 83dba67f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 May 2020 07:22:54 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id n17so10163163ejh.7
 for <wireguard@lists.zx2c4.com>; Tue, 12 May 2020 00:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LYArC21xI7rLFDi0Wm0xi2KryWvlhU1fCLrznhtUbrg=;
 b=Cw33ZiQ4n61fw1z+pdBHxAk+AORrn8iAVA/VuDhTzv/0cRuFeZI/zw7tHhrNlPULAn
 xa/oQHqQ3n+l/45/FVCcXwhZWwpJziXG9lyBl1PO8vc3UwL0TrIsgLCY3l21xNdGsebf
 Q4n9k3pUjC+vnh3q6kWAj22Q7sXSTQfH9VMMjFgpOZMtaca9Glo6RdAlrhBU1YCkHWZq
 t0s2aPIyr3rquhIh3phGfTI7XIAUMJB8H0YLKYPJwdXpOKeutU4HvnC/JxYYOCbvM6qs
 pAcTaZvCdi7k7A6N31Tg5amAqG1Z0JUZbblLxTbT/eIziC5efI1dlkaG4jxHtyxH76Co
 IEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LYArC21xI7rLFDi0Wm0xi2KryWvlhU1fCLrznhtUbrg=;
 b=Hlipg20QMnGtnVg2vGj8oZHDra5VfPCaM8nNQJqvyPHrwLQZjKFz10wNQBFO3Ddj57
 S4gK2bt+k1fn6uckO84HQXkiDTn1XxrPDpF4g+XUbsWLl3wLB6OrRHrXSqHUBMYWI+1M
 BLsExhYJXknXQie0do4NRCsc/huE9XlJbCMC7dTn+vG0WyS32lt+m5NcwlTV5S/Tmw9t
 6nZ242hlEhaPrXHnDUSvPSqx1KInvnz7sOGh6I9J6NuaC7BHVnyPb62HD88Hqhq5vgm2
 6lCUeq5mY6jI9rMtYdFMbezxcacq3MWKS6IrPr2OJPxZnfQ2+/Mc0pQcPBsQnInyT4Jb
 8K/A==
X-Gm-Message-State: AGi0Pua9KSTidaNGZHPiWqTDlkuqgGi08WRPqLIpPCXD1At+kEMbqVPE
 I1nVCB/6sUdbtlwZ+Cp2+hUnAeoOJb91ms1nKnE=
X-Google-Smtp-Source: APiQypJW1FOG0iq5BrGs+xUIr/py04u0DJky07J5w+rJ1fLGPfzeQEil5U07fM0MLegGdRBci4IK0Jp50UMv1T5iKuc=
X-Received: by 2002:a17:906:4c8e:: with SMTP id
 q14mr17246885eju.208.1589268978027; 
 Tue, 12 May 2020 00:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9oZxfaLpt7d=6omZEH0+cAKJPYw451ARTz0HJrMtrVnkw@mail.gmail.com>
In-Reply-To: <CAHmME9oZxfaLpt7d=6omZEH0+cAKJPYw451ARTz0HJrMtrVnkw@mail.gmail.com>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Tue, 12 May 2020 16:36:06 +0900
Message-ID: <CAA2ss9HN7VdQetZ0cmE393BjGiqhqTNa_a80PNz4NJH4sde4CA@mail.gmail.com>
Subject: Re: WireGuard for OpenBSD Kernel Patches Posted
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Matt Dunwoodie <ncon@noconroy.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

That's good news!

I hope it turns out to be a good one.

2020=E5=B9=B45=E6=9C=8812=E6=97=A5(=E7=81=AB) 15:35 Jason A. Donenfeld <Jas=
on@zx2c4.com>:
>
> Hey folks,
>
> I'm delighted to announce that Matt has posted his OpenBSD kernel port
> to the OpenBSD mailing list:
>
> https://marc.info/?l=3Dopenbsd-tech&m=3D158926407905492&w=3D2
> https://marc.info/?l=3Dopenbsd-tech&m=3D158926356005344&w=3D2
>
> We've worked together closely on this for a long time, and I think
> this is a high quality implementation with a lot of the same security
> design principles as our Linux implementation. In a way, WireGuard's
> minimalism fits into and was inspired by OpenBSD's overall design
> philosophy. Looking forward to seeing how things pan out on the
> mailing list there; I'm optimistic.
>
> Users can try this out early by following the directions at:
> https://git.zx2c4.com/wireguard-openbsd/about/
>
> Regards,
> Jason
