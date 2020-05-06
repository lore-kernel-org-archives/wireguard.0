Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869FFC28CBC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 22:26:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CC8920753
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 22:26:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="NYxRliEZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CC8920753
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7c15ff1;
	Wed, 6 May 2020 22:12:50 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1c5c354e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 22:12:47 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5e1f379
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 22:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=jS2hoyUdprT/Za0PX4hHBxHxAWw=; b=NYxRli
 EZ0iE7UTWt8fWoHDPvX3UjDSUjvbIrLEICd0Pqz/zy7EZZUvbQEUz3lwrMY2PZP3
 2gTmggNK9fVWdtGOSG3elYKhuHUUHnT1Sqn5KhdbY7ndT3eTjf6nauSSnQPDcu1Y
 pDA9wooMqZHLHUVXluEWAxMxjVDe8Mf1O67f+5juVI2CJCWsG0TPj8U63NZUv3Rx
 dpuApn97U2B06QpPUa9dVu3SzhaEOjgQaAPx2VqJrFt47mywt2O4oNp/1psSUSIV
 WGs1H9YursmY6y/8hlx8EP/rZiA7a03eS7VCDXqgRdnySymiGDzKw6d5GAKtn4QC
 hkR5i77G0NwHQdmg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7bd1185b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 22:12:47 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id k6so2227870iob.3
 for <wireguard@lists.zx2c4.com>; Wed, 06 May 2020 15:25:30 -0700 (PDT)
X-Gm-Message-State: AGi0PublQpQIWaEKKZx6iyXrl8WjEx7dzsn0do4+3qUoq4lY0zeoo5kY
 26kRllc/dQqByQcPhZmqCR5pKy83q4ud0IM1uok=
X-Google-Smtp-Source: APiQypK1ULO7ubyQlCPQMM8lRNU5WVuahIkOMm1uwypUibMHQpzP6LuOwt+8hxFW70EZ5iRcWLsQ69WwOA4fqXjExTg=
X-Received: by 2002:a02:b88e:: with SMTP id p14mr10374808jam.36.1588803930091; 
 Wed, 06 May 2020 15:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmhVkoE_fL59VJqqXoGHX_S3E9+h=KwyNchWSBrEfPHrpNyoQ@mail.gmail.com>
 <71c12e22-c7b6-9753-cc44-aac0f51592ff@pallas.us>
 <CAKmhVkrRbb_KncDjhM6gMcJRpCrK6WcB1Ed=WfVhScDHw96Gjw@mail.gmail.com>
 <CAHmME9qv2R1CBFAQ1xqM3eOtegLaZi=f7cfA26JS=8bGTLpPFg@mail.gmail.com>
 <9c64d009-4c24-425f-9126-ba93279c208e@www.fastmail.com>
In-Reply-To: <9c64d009-4c24-425f-9126-ba93279c208e@www.fastmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 6 May 2020 16:25:19 -0600
X-Gmail-Original-Message-ID: <CAHmME9rbKP4zB5nWG-9vf+2ZepXm+Gqii=qjQ8cnG0O+Dhu2tQ@mail.gmail.com>
Message-ID: <CAHmME9rbKP4zB5nWG-9vf+2ZepXm+Gqii=qjQ8cnG0O+Dhu2tQ@mail.gmail.com>
Subject: Re: WireGuard over WireGuard
To: Justin Kilpatrick <justin@althea.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, May 6, 2020 at 4:24 PM Justin Kilpatrick <justin@althea.net> wrote:
>
> > 1340 or 1360
>
> Why two options? I've been using 1340 for a long time.

WireGuard over IPv4 has a 60 byte overhead. WireGuard over IPv6 has an
80 byte overhead.
