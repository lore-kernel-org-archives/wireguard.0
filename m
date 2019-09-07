Return-Path: <SRS0=2lTk=XC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3973EC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  7 Sep 2019 07:41:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97D4D21835
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  7 Sep 2019 07:41:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=astrogeo.va.it header.i=@astrogeo.va.it header.b="KVRv0wz2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97D4D21835
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=astrogeo.va.it
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 396bf6d1;
	Sat, 7 Sep 2019 07:41:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75c389f8
 for <wireguard@lists.zx2c4.com>; Sat, 7 Sep 2019 07:41:18 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50b70795
 for <wireguard@lists.zx2c4.com>; Sat, 7 Sep 2019 07:41:17 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id p13so9385345wmh.1
 for <wireguard@lists.zx2c4.com>; Sat, 07 Sep 2019 00:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astrogeo.va.it; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VwLHWONS/QuzGJ65oQcuLjjj9ATVoZnQv4msK6l1L/k=;
 b=KVRv0wz2wEiLL8yU60PvSV8bDq1mGBdEzyLhcl9LZVYvrCohbhpR7+UdRs9ioSx/JB
 jleRV2Mska4EpwoAgw8Kxeowdux7AYwz/4L3skjYHeS0WB4aiXfaqCsSYmEs6X32RAD8
 kqDSWyisemdzYTVXBVBxmktgXHvrfxHD2MduE+ZF2lFuSDdutWC4XhJltyNlWRlmQuAL
 fVEAtiHqm8Z/tDwoUJD1+9h50WKh0MyH2p2TWh/DDny3xKe2wDrOrOFU1F5SanCQovRf
 DRNTF0njPaUDRWNHoJcflDz/ET2HomKuLAHQ8u74KfO5rSTSnlYO1Q5CCvzglBrD6oE6
 gkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VwLHWONS/QuzGJ65oQcuLjjj9ATVoZnQv4msK6l1L/k=;
 b=Mx/Blh0A+NmUm2qsnKSn/sX9tsBKpxPvZpsGvLENDl5EwmZl9h3oRkDyGtqgg/ueIH
 434f58Q+JlOBR28nFRmGMYcgVT0WGPzDqnF8Ko8uG330cIfZ4UABUhXtXyC6uElMvgUT
 p42501Gce9xPgsXchGkBkJ3XOrhy+rD79rwjHd/daHnrd+T8KQ1dGnYJS+lz9tBvWYJo
 zcHGVfT1RTNcMpe7NCOa8yPzta1ASPFAwjU/c9Nyv1yI+l3cuZraUlQMJ0fTzRQq3WkO
 LL4gD7WGHzN2XnaP4jotKEcfxkPyBLB8MWo3PTj9TiM92TdLHQOozYfnNarH9S9w9Aoo
 2N+Q==
X-Gm-Message-State: APjAAAVhrC3S0wBvc6NdbN3+wYufbSkUABc5J3dw+6IwM8BMqub8pV50
 PBYj9in57REXsX5oHoKJNWW49A==
X-Google-Smtp-Source: APXvYqwMhsIrBYk/8uQFNb8U8ZM0ZMlZSG/Tne2lUTe28Eum1fig90e5xrM+wuv9uBTCcia9Ivw8Aw==
X-Received: by 2002:a1c:a8d8:: with SMTP id
 r207mr10205603wme.135.1567842075909; 
 Sat, 07 Sep 2019 00:41:15 -0700 (PDT)
Received: from [192.168.2.58] (78-134-57-223.v4.ngi.it. [78.134.57.223])
 by smtp.gmail.com with ESMTPSA id b16sm2747353wrh.5.2019.09.07.00.41.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Sep 2019 00:41:15 -0700 (PDT)
Subject: Re: WireGuard fails to build on CentOS 7.1908
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CAMKRnFh4XvqYzPDVjy_NOpeHY+KgsRfEuHfEjWy9N1wfY9MwTg@mail.gmail.com>
 <CAHmME9oC+rYCVqv21-nGw_vyxzY5VhTHoa0mrnbOEShcczBN-g@mail.gmail.com>
 <816bb8ff-101f-2719-4b75-1d194c519aef@astrogeo.va.it>
 <CAHmME9odNo2d+=u1z7kNuXKy2HYzOqaHt_0N9Dz49kZFp4qW_g@mail.gmail.com>
From: Dario Pilori <dario.pilori@astrogeo.va.it>
Message-ID: <9891ad84-a635-3922-2fb9-ceadd6cdb8fd@astrogeo.va.it>
Date: Sat, 7 Sep 2019 09:41:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9odNo2d+=u1z7kNuXKy2HYzOqaHt_0N9Dz49kZFp4qW_g@mail.gmail.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Jason,

In a nutshell, RHEL 7 is a rolling release. Point releases are basically 
moments where several packages are updated at the same time, and these 
updates usually bring bigger changes than standard RHEL updates.

RHEL 7.7 was released on August 6th, and support for RHEL 7.6 was 
immediately dropped. This is almost transparent to RHEL users, since a 
simple 'yum update' would automatically upgrade all packages to latest 
RHEL 7.x release. Only (paying) RHEL customers, with an additional 
support contract, can keep an old RHEL point release for some time.

CentOS does not offer such support contract, therefore as soon as a 
point release is released, the previous one is immediately dropped.

Since CentOS is a recompilation of RHEL, there is a lag (~ several 
months) between RHEL and CentOS releases. The "Continuous-Release" (CR) 
repository is basically a beta version of the next CentOS point release, 
which is based on an already-released RHEL point release. While the CR 
release is not widely used (since it's a development version), it is a 
very faithful representation on what the next official version would be, 
since CentOS is only a mere recompilation of RHEL.

CentOS 7.7.1908 (based on RHEL 7.7) was released on the CR repo on 
August 30th. Usually it stays there for several weeks, then it is 
released with very minor changes. When it happens, the support of CentOS 
7.6.1804 (based on RHEL 7.6) will be immediately dropped, and the update 
to this version will be sent to all CentOS 7 machines.

For the "WireGuard support" perspective, right now it works on latest 
"official" CentOS 7 kernel. I suspect that it doesn't compile on the 
already-released RHEL 7.7, but I don't have a RHEL7 installation where I 
can test it.  However, when CentOS 7.7.1908 (based on RHEL 7.7) will be 
released, which should happen in some weeks, it is highly probable that 
WireGuard will not be compatible with the latest (and only supported) 
RHEL/CentOS 7 kernel.

To answer to your question, I agree with you that it is worth only 
supporting the most recent official RHEL/CentOS kernel, since the CR 
release is meant only for testing. However, "be prepared" that, when 
CentOS 7.7.1908 will be released, it is highly probable that WG will not 
compile on it.

Dario

On 07/09/2019 00:47, Jason A. Donenfeld wrote:
> Hey Dario,
> 
> I'm not super familiar with the RHEL release varieties. Maybe you or
> somebody can clarify and help define how we'll approach it?
> 
> What we've done in the past is support whatever the "latest" RHEL
> kernel is. IIRC, 7.6 was released not so long ago, and we did the
> compat.h work on 7.6, and then dropped support for RHEL 7.5. It sounds
> to me like what you're saying now is that 7.6 has already been
> replaced by 7.7? Or there's a stable 7.6 and then an "in-development"
> 7.7 that is rolling? If it's the latter case, do you know if that's
> widely used and worthwhile for us to support?
> 
> In other words, I'm not so sure of the RHEL landscape, but if you make
> a description and argument for what we should support in WireGuard's
> compat layer, as long as it's somewhat reasonable, I'm happy to
> oblige.
> 
> Jason
> 
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
