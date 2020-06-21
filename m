Return-Path: <SRS0=rROn=AC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62066C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Jun 2020 21:48:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0064252B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Jun 2020 21:48:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlBNYBJU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0064252B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23e5b2b0;
	Sun, 21 Jun 2020 21:29:41 +0000 (UTC)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [2607:f8b0:4864:20::1043])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f8374ff7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Jun 2020 21:29:39 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id d6so7528355pjs.3
 for <wireguard@lists.zx2c4.com>; Sun, 21 Jun 2020 14:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fXJ2yajQqv3cqEb8EycTuH5fxyMvadlVFFeaSvFaQX4=;
 b=VlBNYBJUligDo4Oqjg/oEhlLZw6+Wz8eFEXpeb92XyvDZIZqWZmFyGWyw6CG7QJAYN
 34e08rGXK3etRfMnxNi5qDvvjbFPPZuxkKmW7+vYWPd7T6hRoeasMohcIioqopcQiqp2
 i0cCdyGhC8nHiptkRvZuieGjJN83oa5OweAKyf2zhOU5sNvrVd6EIHdeUEvErMOPWHYo
 lPdGMBIGUMBFJA5gZCrrvgu5o/Yqyt2GCv/XB6hpTnbPvGx+9zLeDUx5Pql4JGyobMnj
 15o1YNtv0KL/YJMQi8vmzR3D0LoHw7jrOUayimxyU7ldeiAjv5g7627XWQCZLedsa/H+
 gitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fXJ2yajQqv3cqEb8EycTuH5fxyMvadlVFFeaSvFaQX4=;
 b=l6b4B96NGOnZHp9I9NvwAIHprXEzPZKNc7yhQcZduS2lCQw3snkekDrWHIn6WwdOeR
 sdriIH9U3MvhFgDVc9Z1eiUtJxB/IJfAIy+LmQLNRGoamoLoRel60MIR1ZWFLMYrgu03
 4fQwIWIL7OPYK/ZzxNJIWw3d1oeDpNB02s90evz+x4x0VU59h/80MlE2Z4PtE5hfRkCt
 JiCD+CJJw54d6dfFVPOgSNkZNNfBiesxydgM0OLcHAZuGek4bl5U6w/oIpbOgpD9mWjK
 5tkGM1yV8KvSDNXq5vDhaQgTWS/YaX7t3H6Bl6mjKRA9AYVEn/3FXI8NVEtmad0KjTC+
 Z3nQ==
X-Gm-Message-State: AOAM533vH3IP/yRFczL9MC0tSb8NzEC/i5oew/FmhLqCcRESCZz+rqpJ
 NR/4HMFWvaNm8XxoHo72SbdM+9b/
X-Google-Smtp-Source: ABdhPJxFJarwoI0hO7vSnvoCDOhJDoTo9IcqSgsGXe8UUbG0QvJrESYv3g4dbSkq38ZLgqCQnH45Kg==
X-Received: by 2002:a17:90a:ce11:: with SMTP id
 f17mr14940181pju.123.1592776097623; 
 Sun, 21 Jun 2020 14:48:17 -0700 (PDT)
Received: from ?IPv6:2600:8801:980:2c::9bed? ([2600:8801:980:2c::9bed])
 by smtp.gmail.com with ESMTPSA id j19sm11751632pfn.109.2020.06.21.14.48.16
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Jun 2020 14:48:16 -0700 (PDT)
Subject: Re: [ANNOUNCE] WireGuard Merged Into OpenBSD
To: wireguard@lists.zx2c4.com
References: <CAHmME9pAwNty0q_+WD8RebgfdMdaFbh-OsKXaAb7wdhKBR+6Sg@mail.gmail.com>
From: jungle boogie <jungleboogie0@gmail.com>
Message-ID: <83ceb9ac-d620-f569-e694-77f6a6bd3678@gmail.com>
Date: Sun, 21 Jun 2020 14:48:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9pAwNty0q_+WD8RebgfdMdaFbh-OsKXaAb7wdhKBR+6Sg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 6/21/20 12:18 PM, Jason A. Donenfeld wrote:
> Hey everyone,
> 
> I'm happy to announce that WireGuard has been merged into the OpenBSD
> kernel, with integration into userland as well.
> 
> https://marc.info/?l=openbsd-cvs&m=159274150512676&w=2
> 
> Matt Dunwoodie and I have been working on this for quite some time
> now, with at some point Matt even showing up at my door in Paris to
> push the effort further. This marks the culmination of quite a bit of
> effort, and certainly a multi-year project for Matt. I should also
> note that the upstreaming process to OpenBSD was extremely pleasant.
> We did three patch revisions, with useful feedback on each one and a
> very supportive community.

Jason and Matt - outstanding, outstanding job. I've comfortably ran 
Wireguard on OpenBSD with Jason's first build script for roughly 1 1/2 
years, but I'm happy to see Wireguard is now in-kernel and development 
will continue there.

Thank you two for all of your efforts you've made.
I hope everyone else is as excited about this as I am!

For those that don't know, OpenBSD's homepage:
https://www.openbsd.org/

OpenBSD Journal:
https://www.undeadly.org/cgi?action=front

Reddit:
https://www.reddit.com/r/openbsd/



> 
> I imagine that this work will ship with OpenBSD 6.8.
> 
> Enjoy!
> Jason
> 

