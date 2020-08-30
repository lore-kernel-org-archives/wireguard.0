Return-Path: <SRS0=dNI2=CI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940AAC433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 30 Aug 2020 19:53:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DB1020757
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 30 Aug 2020 19:53:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bukn-net.20150623.gappssmtp.com header.i=@bukn-net.20150623.gappssmtp.com header.b="uWtLJVkD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DB1020757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bukn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a79a943f;
	Sun, 30 Aug 2020 19:24:58 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2d965ba7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Aug 2020 19:24:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id c19so3116622wmd.1
 for <wireguard@lists.zx2c4.com>; Sun, 30 Aug 2020 12:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bukn-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=yz8ecbFwRRFVk6EozWCGSI5hGl2UZbN2rEQ9fT32QYY=;
 b=uWtLJVkDkQvM9MYaBSXeuSQi4Vsi5/TaKR/QcdhYahSvrrutYet39xsTltmTG3+fLG
 pd+B1hguHAuHXSXNeWAj3EK0LSRBhGhzLhLykxigCEKLvGpFKGjSeqt7BmXIOwnU3TZt
 kybaKTh5IjAMbbPfqtV9hct9XQzLA9VlLdhFr9UtGo6jyASfyHUcQkd2RAALMOUDGS4d
 B5JaxTMURYkI32F+WvBwOSXXoKrAQqChYW/0p9FpMYKhRielRKnEmU2GaVwjW/jadMim
 zAuYUDxiB9qmDDW1uS3ouDL4rLH1wIn4okudI5C12F1iOtsGO0wsiv1k2lPrGWyzxE/t
 Jj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:content-language
 :thread-index;
 bh=yz8ecbFwRRFVk6EozWCGSI5hGl2UZbN2rEQ9fT32QYY=;
 b=oNB9WshTb4sDxZ9IGxPEMyaTUSn6jshCc3y3lnbPN4XaAjKv+kyNmCd7Hlq9AjjU4U
 JbTnYoJabuNChTIlXdFUFzVH7X9H8dy10AFp2x5DggTUXiSTa0Uaumv81X1Ax9pLV8q2
 a/zMr5vIkwjDYGFjIgpBKJy2cmf+aDzXRLJt82cv99Xll25b3dbBtXcCNJvADzFopAkK
 oiNHyOfSivW5LAGopib1gOLcdD0arb4HE5daYnbFhrf7wg78pYaYaldGwuS2M/Hk9iZm
 UOs/RUTTxvK+krMI1Cjy/MYQnP5/mWmFJQIi7aS0SfYw0J4asnx8wYCnJAieUv+ELyCe
 Wm5g==
X-Gm-Message-State: AOAM532/cXItkIB21sWRCrKm9ruAyDOgrLrHhBWXrgbtPDNsxNvWDWZy
 96WjOnqmusTnc0ljEwvFjzJiHmg5JCG9DU/r
X-Google-Smtp-Source: ABdhPJwp+oJtTg5St8UGkikuKP4sWkHA/ZPOWGPZMTTYPALbofskPvI4K7TabCJc750KEO9nkbJ60A==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr299697wml.149.1598817159109;
 Sun, 30 Aug 2020 12:52:39 -0700 (PDT)
Received: from XPS13 ([2a02:8011:8003:20:a181:63e5:bafc:6a04])
 by smtp.gmail.com with ESMTPSA id v29sm8668260wrv.51.2020.08.30.12.52.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 Aug 2020 12:52:38 -0700 (PDT)
From: "Aaron Bolton" <aaron@bukn.net>
To: <stunnel@attglobal.net>
Cc: <wireguard@lists.zx2c4.com>
References: <f4484f4c-d744-48ad-b78f-c6005936d60e@www.fastmail.com>
 <CA+oXxS0r9iMFC32SHweKEiersLVxNQrxopQs+EEsomwGyNGZgw@mail.gmail.com>
 <7522bb20-c067-0bed-2d55-5bfa08d5b205@attglobal.net>
In-Reply-To: <7522bb20-c067-0bed-2d55-5bfa08d5b205@attglobal.net>
Subject: RE: AllowedIPs
Date: Sun, 30 Aug 2020 20:52:36 +0100
Message-ID: <000001d67f07$1cdb96e0$5692c4a0$@bukn.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJ7vW28p4j4q45lsb61vzRo9yZBugIX7ScfAldeZM+n4xh9kA==
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

Funny you suggest that :) I just found that option a couple of hours ago =


-----Original Message-----
From: WireGuard <wireguard-bounces@lists.zx2c4.com> On Behalf Of Eddie
Sent: 30 August 2020 20:09
Cc: wireguard@lists.zx2c4.com
Subject: Re: AllowedIPs

Wouldn't using Table =3D off do everything you need, without touching =
the routing.

Cheers.

On 8/30/2020 1:56 AM, Aaron Bolton wrote:
> Yes, this does thanks
>
> I plan on using Quagga for BGP over WireGuard tunnels so I guess I=20
> need to avoid wg-quick if that makes changes to the routing table and=20
> firewall as I want to manage those my self
>
>> On 30 Aug 2020, at 00:16, Eric Light <eric@ericlight.com> wrote:
>>
>> =EF=BB=BFI believe it's both, in a way.
>>
>> As far as wg is concerned, the AllowedIPs is effectively an ACL.  Any =

>> traffic hitting your wireguard interface from an IP not within the=20
>> AllowedIPs will either be dropped on decryption, or won't even be=20
>> decrypted.  (It's one of these, but I can't remember which)
>>
>> On top of that, wg-quick interprets the AllowedIPs string and does =
other things, such as adding appropriate network routing (the second =
part of your guess), as well as modifying any client firewall rules to =
permit the traffic.
>>
>> Hope this helps  :)
>>
>> E
>>
>> --------------------------------------------
>> Q: Why is this email five sentences or less?
>> A: http://five.sentenc.es
>>
>>> On Sun, 30 Aug 2020, at 04:07, Aaron Bolton wrote:
>>> I=E2=80=99m trying to understand AllowedIPs better is it effectively =
a ACL=20
>>> that day what is allowed down the tunnel or is it mechanism to=20
>>> configure what addresses get routed down the tunnel?
>>>
>>> Thanks in advance
>>>


