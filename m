Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C16DC43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 21:47:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4835A20823
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 21:47:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mib-infotech-co-nz.20150623.gappssmtp.com header.i=@mib-infotech-co-nz.20150623.gappssmtp.com header.b="CohMUrNr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4835A20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mib-infotech.co.nz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0a43ef7;
	Mon, 19 Nov 2018 21:41:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc0eee5b
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 21:41:13 +0000 (UTC)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79fef415
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 21:41:13 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id t13so5752400pgr.11
 for <wireguard@lists.zx2c4.com>; Mon, 19 Nov 2018 13:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mib-infotech-co-nz.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=gULWseEpPs0Tsa7o4CIJd9U8PA95T4YzOx906mTOwhc=;
 b=CohMUrNr0EQ8JwMN9CRJcB1gvVUuupaP5XOsUWIZCS5RoUVbl84pqu5M2U+n525YLn
 8BkXTec74QxxMU0o6x7MNLwBwPibd11Lkhbz+3fYknbhF4YpI0ZQcMdTI1STDUcKySuM
 nOMGbKfbqAQdZJLxaftvSup2z7ZSw8AiLCZDdLw6AL+yJYr+JeH2Br4WXQuz5vyJFASH
 4qhusEet0MIpcYjIIGO51GYXvX4lB5DR7X2l9tKTuT/NbnmZhyzC2GZNbmcsvEyWRcdV
 WsTDJ3i54w0+f+2NitizL5T/Ibf0VO3uooWtLINZY0aiAQh0R9/XhmWI1FhK518yI8BN
 tc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gULWseEpPs0Tsa7o4CIJd9U8PA95T4YzOx906mTOwhc=;
 b=Qy0rDH6XQ00ReqiE9XhA5W+Lb20kpWRIw6tXXBJXANXy4k/jfAJBomNrvPBZQ50BRp
 9phrIHv04PBerFl8T5q+9d+9tf2Gqf6bfS93aBCoiZstbi2GK8NAWvPEzaHEY+xMakIW
 FS2E0n0MMzUmIwDSGiIbBacAqT/ahMY5sgRX1aKBaOcMl7qAQveSITFt5uoaC4wKAFEO
 fO1PL0hxeNY153rzXbUeVG7qUKeuLTBMUracqPs6glFA+dsB+x9ufsdomVYo7n+myKz0
 oDPl52h21Y7qDL5AyRKETVgHsvdmMwRy+6jOnDYu8O9PrVncn8MAF1zPjaPmE5SvpbDY
 NEDw==
X-Gm-Message-State: AGRZ1gIsxKvc2AAxI/f656DqSIt51/Jv/U1FgeGCCaH77uwSwxPITULc
 V28kJPUku/Ycf1wNDNa2cUnEksODbCI=
X-Google-Smtp-Source: AJdET5dl6xkDvJNS09y5xakSNa0KinOBm4PQTPby1WgS9vyKou9CLj/1fRXW3b+PgYttSG/zh2lDqg==
X-Received: by 2002:a63:f710:: with SMTP id x16mr21901389pgh.322.1542664034553; 
 Mon, 19 Nov 2018 13:47:14 -0800 (PST)
Received: from [10.16.226.11] ([103.247.155.34])
 by smtp.gmail.com with ESMTPSA id o7sm5499738pfb.34.2018.11.19.13.47.12
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Nov 2018 13:47:13 -0800 (PST)
Subject: Re: Seeking suggestions for a WG port to use with restrictive public
 wifi networks
To: wireguard@lists.zx2c4.com
References: <CAO_nJAZ5fSSFtH1p8Ad=FD22ic9_kDAMkhWpL4vTxDh=4g3J8g@mail.gmail.com>
 <020DC45A-7CA9-49E5-9A14-6300306F5476@lonnie.abelbeck.com>
From: John Huttley <john@mib-infotech.co.nz>
Message-ID: <903807da-82a3-f97c-5ba3-510eca9af84f@mib-infotech.co.nz>
Date: Tue, 20 Nov 2018 10:47:10 +1300
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <020DC45A-7CA9-49E5-9A14-6300306F5476@lonnie.abelbeck.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

And also 4433 which is used by DTLS

https://wiki.wireshark.org/DTLS

--dad

On 20/11/18 9:53 AM, Lonnie Abelbeck wrote:
>> On Nov 19, 2018, at 2:33 PM, John <graysky@archlinux.us> wrote:
>>
>> Should I stick with the "standard" udp service ports for my
>> trial-and-error based approach?  Wikipedia has an article that lists
>> many of these (List_of_TCP_and_UDP_port_numbers).  Any suggestions are
>> welcomed.
> Possibly: UDP/500 (IPSec IKE) or UDP/4500 (IPSec NAT-T)
>
>
> Lonnie
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
