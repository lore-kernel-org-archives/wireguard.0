Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35339EB64DD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Jun 2023 16:21:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd8998c6;
	Mon, 26 Jun 2023 16:18:34 +0000 (UTC)
Received: from mail-oa1-x61.google.com (mail-oa1-x61.google.com
 [2001:4860:4864:20::61])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fc858d37
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2023 16:18:32 +0000 (UTC)
Received: by mail-oa1-x61.google.com with SMTP id
 586e51a60fabf-1b03ec2015fso873976fac.3
 for <wireguard@lists.zx2c4.com>; Mon, 26 Jun 2023 09:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687796311; x=1690388311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oftlU751xsRzRfVgVCywRbfCitTKoU7VpPeGv3XZSoo=;
 b=RF791dqeUY7t1RPF6OuFpFUd/Z4PNm6b45OfHrXtywVgXEBEysWRT3yIeQ7W7svBWa
 KHULYxoZQziorjgqpKqJQCNYX9VtEgxrqJsTwYuPYfHU1+LFQuVUXAWA+KJCU5mgxZB9
 +8L7T2YqkPCic4AI0d0EHcuDAojgOlWKlFmaIZhDQRDdNRJPcIGeCy+QcBNsVO5CQlCg
 8Jl8EBPqPSYOScBi4aBj43FzpwEsR9G5j1Iwf/4oKi1TWTnQtVlw9NzllKQZeIBHNcxH
 1M6SdfnBTYZq4FUVtJkxnK2ntkN/rWMTKbrpnrcvXeDWMwsHoKInvkJ0mvNQINMO8yM9
 9W5A==
X-Gm-Message-State: AC+VfDzgGk0r5SOWfNiPfpm1FRPqpMptTmA/5dOectI/xiVzivAP5ksw
 905CF6eW/vsNL+Y4d7DQRwjOHUGjgljVxAJHFxpTzt1eyQvqAlh9qqG6yQ==
X-Google-Smtp-Source: ACHHUZ5kbAKpz5UdomHm6xUkVQTtjOJ6IK+jMY/vo3mRJLWCanmX9o+9t2LjgRiesEFsaw1oA4SFqIxDbXeD
X-Received: by 2002:a05:6870:b302:b0:19e:34f8:4d4f with SMTP id
 a2-20020a056870b30200b0019e34f84d4fmr24089465oao.32.1687796311346; 
 Mon, 26 Jun 2023 09:18:31 -0700 (PDT)
Received: from restore.menlosecurity.com ([13.56.32.62])
 by smtp-relay.gmail.com with ESMTPS id
 k21-20020a056870819500b001a9965289b2sm410672oae.47.2023.06.26.09.18.30
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Jun 2023 09:18:31 -0700 (PDT)
X-Relaying-Domain: menlosecurity.com
Received: from safemail-prod-02890046cr-re.menlosecurity.com (13.56.32.63)
 by restore.menlosecurity.com (13.56.32.62)
 with SMTP id 169506d0-143d-11ee-b5b5-bb9144370772;
 Mon, 26 Jun 2023 16:18:31 GMT
Received: from mail-yb1-f198.google.com (209.85.219.198)
 by safemail-prod-02890046cr-re.menlosecurity.com (13.56.32.63)
 with SMTP id 169506d0-143d-11ee-b5b5-bb9144370772;
 Mon, 26 Jun 2023 16:18:31 GMT
Received: by mail-yb1-f198.google.com with SMTP id
 3f1490d57ef6-bc9483b506fso4523259276.0
 for <wireguard@lists.zx2c4.com>; Mon, 26 Jun 2023 09:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=menlosecurity.com; s=google; t=1687796309; x=1690388309;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oftlU751xsRzRfVgVCywRbfCitTKoU7VpPeGv3XZSoo=;
 b=kQtEPwuYfel+3+upVngqcmLwthTqCmirbgrQKlDwzT/0C98kUrh+c8sqMGXLgBSJ7/
 1kXHLidcsHv2He9Qf0MeNZEgyI4HdHyzyvr4IkU2plEqh/vS8Cvta/KW8jzqgjfKa26y
 t+Zl4k5LdSEPojNimKr6ulaVm45Hkh/pQHytc=
X-Received: by 2002:a25:3d2:0:b0:c16:177d:5ee0 with SMTP id
 201-20020a2503d2000000b00c16177d5ee0mr6317215ybd.57.1687796308813; 
 Mon, 26 Jun 2023 09:18:28 -0700 (PDT)
X-Received: by 2002:a25:3d2:0:b0:c16:177d:5ee0 with SMTP id
 201-20020a2503d2000000b00c16177d5ee0mr6317201ybd.57.1687796308454; Mon, 26
 Jun 2023 09:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <CA+FoirDk8ZC09YXC7T6ureaBWG6ZREpfE3cq5MoAkKf-rC=U1g@mail.gmail.com>
 <20230626195311.03e86a19@nvm>
In-Reply-To: <20230626195311.03e86a19@nvm>
From: Rumen Telbizov <rumen.telbizov@menlosecurity.com>
Date: Mon, 26 Jun 2023 09:18:17 -0700
Message-ID: <CA+FoirAsRV2LuEGygz3i4mAWBOAgqWDa6fqcjA8OeDNCZG+a+g@mail.gmail.com>
Subject: Re: WireGuard IRQ distribution
To: Roman Mamedov <rm@romanrm.net>
Cc: wireguard@lists.zx2c4.com
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

Hi Roman,

I ran UDP-based iperf and it made no difference.

Thanks for your input

On Mon, Jun 26, 2023 at 7:53=E2=80=AFAM Roman Mamedov <rm@romanrm.net> wrot=
e:
>
> On Tue, 9 May 2023 15:17:00 -0700
> Rumen Telbizov <rumen.telbizov@menlosecurity.com> wrote:
>
> > Baseline iperf3 performance over plain VLAN:
> > * Stable 24Gbit/s and 2Mpps
> >
> > bmon:
> >   Gb                      (RX Bits/second)
> > 24.54 .........|.||..|.||.||.||||||..||.||.......................
> > 20.45 .........|||||||||||||||||||||||||||||.....................
> > 16.36 ........||||||||||||||||||||||||||||||.....................
> > 12.27 ........||||||||||||||||||||||||||||||.....................
> > 8.18 ........|||||||||||||||||||||||||||||||.....................
> > 4.09 ::::::::|||||||||||||||||||||||||||||||:::::::::::::::::::::
> >      1   5   10   15   20   25   30   35   40   45   50   55   60
> >    M                     (RX Packets/second)
> > 2.03 .........|.||..|.||.||.||||||..||.||........................
> > 1.69 .........|||||||||||||||||||||||||||||......................
> > 1.35 ........||||||||||||||||||||||||||||||......................
> > 1.01 ........||||||||||||||||||||||||||||||......................
> > 0.68 ........|||||||||||||||||||||||||||||||.....................
> > 0.34 ::::::::|||||||||||||||||||||||||||||||:::::::::::::::::::::
> >      1   5   10   15   20   25   30   35   40   45   50   55   60
> >
> > top:
> > %Cpu0  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,=
  0.0 st
> > %Cpu1  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,=
  0.0 st
> > %Cpu2  :  1.0 us,  1.0 sy,  0.0 ni, 98.0 id,  0.0 wa,  0.0 hi,  0.0 si,=
  0.0 st
> > %Cpu3  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,=
  0.0 st
> > %Cpu4  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,=
  0.0 st
> > %Cpu5  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,=
  0.0 st
> > %Cpu6  :  1.0 us,  0.0 sy,  0.0 ni, 99.0 id,  0.0 wa,  0.0 hi,  0.0 si,=
  0.0 st
> > %Cpu7  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,=
  0.0 st
> > %Cpu8  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,=
  0.0 st
> > %Cpu9  :  1.0 us,  1.0 sy,  0.0 ni, 98.0 id,  0.0 wa,  0.0 hi,  0.0 si,=
  0.0 st
> > %Cpu10 :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,=
  0.0 st
> > %Cpu11 :  0.0 us,  0.9 sy,  0.0 ni, 16.8 id,  0.0 wa,  0.0 hi, 82.2 si,=
  0.0 st
> > %Cpu12 :  0.0 us, 32.3 sy,  0.0 ni, 65.6 id,  0.0 wa,  0.0 hi,  2.1 si,=
  0.0 st
> > %Cpu13 :  1.0 us, 36.3 sy,  0.0 ni, 59.8 id,  0.0 wa,  0.0 hi,  2.9 si,=
  0.0 st
> > %Cpu14 :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,=
  0.0 st
> > %Cpu15 :  0.0 us,  1.0 sy,  0.0 ni, 99.0 id,  0.0 wa,  0.0 hi,  0.0 si,=
  0.0 st
> >
> > The IRQs do pile up behind CPU 11 because iperf3 is single-threaded.
>
> I'm not sure if they pile up because of that, or because of the same reas=
on
> you point in WG's case, the 5-tuple being the same for the single TCP
> connection of iperf3.
>
> Out of interest, maybe you could try iperf3's UDP mode, and apply the sam=
e
> port randomization trick as you used for WG, and see if it also makes it =
see
> the better IRQ distribution, and the speed drop?
>
> --
> With respect,
> Roman
