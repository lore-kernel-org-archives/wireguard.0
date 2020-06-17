Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497E5C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:23:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAD6D20C09
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:23:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ZyEC2Cbs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAD6D20C09
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d88985f2;
	Wed, 17 Jun 2020 08:04:03 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d30de021
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 08:04:01 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6beeeb22
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 08:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=2Qeipfd2Qj962XgdQzWLga2ln/A=; b=ZyEC2C
 bskgKI4bBfQ5zOQAVxeP2rvRRrWhSN1jhuEYbAns2wRl7dV5KH4OtrqosL0LebJ0
 +XXmQmP5+EQ1HoFJHvo55mfXCCCtbIkW+NtDXBTRNCP4GHYV4mvWtF/EQbfS2daj
 0Y60Iham/esg9lqm6M/tG7urAVU10Di2Nr07kvdpq2vHdXYP6huZOTuqtIrJ8QBj
 Fzo29x/ktpb4zhFXGPUUz88TFheoxCDlhnXoSJBfBri/QKmVhyzdt6rmDxFCOVnR
 zqNmiGlh+H3J8cpwEvzv++Eh+vh1lviQir8DimlSyVfJYYd2DXeQFprVry2ZjV5x
 B8B97YqeLz9IYu/w==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c3a756ed
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 08:03:59 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id m81so1801617ioa.1
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 01:22:03 -0700 (PDT)
X-Gm-Message-State: AOAM533YqFZ/RfI3uBlMu+1Gm5VUt267wFAgZfMDk0xcn9A8TvUsK79R
 SHK+7Aec6iBo0Enggh3Ip7BQuBy82QsiGoKwbr0=
X-Google-Smtp-Source: ABdhPJzdKsyDSjeImi9fJfIwUQ1i/ZchIxx+q8vXrytJ7eNEyvW4lbgtBciB5ww5WvLXL6OA+gJv2C2EDOqFEDvcXag=
X-Received: by 2002:a6b:5a07:: with SMTP id o7mr6888435iob.67.1592382123095;
 Wed, 17 Jun 2020 01:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <b4e30054-3864-c9eb-86dd-b8236af24a5a@d-a-s.com>
In-Reply-To: <b4e30054-3864-c9eb-86dd-b8236af24a5a@d-a-s.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Jun 2020 02:21:52 -0600
X-Gmail-Original-Message-ID: <CAHmME9ox8eSuvkEnaBSD9epdKGkjZxYWXAzwUjLkhwcTv+oaAw@mail.gmail.com>
Message-ID: <CAHmME9ox8eSuvkEnaBSD9epdKGkjZxYWXAzwUjLkhwcTv+oaAw@mail.gmail.com>
Subject: Re: Ubuntu 18.04 broken
To: Doug Walker <dwalker@d-a-s.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Andy Whitcroft <apw@canonical.com>
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

On Wed, Jun 17, 2020 at 2:01 AM Doug Walker <dwalker@d-a-s.com> wrote:
> I see that build issues have been reported, but after updating the
> server I'm having the same issue with the release from
> http://ppa.launchpad.net/wireguard/wireguard/ubuntu bionic main.
>
> Any eta for an update of the ppa?
>
> I've had to switch everyone back to OpenVPN, so it may really be a moot
> point.  Getting people to move back might be a non-starter.

See <https://lists.zx2c4.com/pipermail/wireguard/2020-June/005545.html>
for an explanation. A longterm solution is coming very soon I hope,
but the onus is on Canonical.
