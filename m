Return-Path: <SRS0=I0b+=CJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FAB6C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 31 Aug 2020 20:41:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F5942054F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 31 Aug 2020 20:41:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3Y3kED8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F5942054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bd057a1;
	Mon, 31 Aug 2020 20:13:09 +0000 (UTC)
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [2607:f8b0:4864:20::f44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ff266851
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Aug 2020 20:13:07 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id cy2so2557585qvb.0
 for <wireguard@lists.zx2c4.com>; Mon, 31 Aug 2020 13:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0BVFP/1g/HQOTMSBFiHU/Ck0syJVbeMQLR2eHvlhZV4=;
 b=b3Y3kED89wJIxVsNcV15kSjU1jNgA6GeaiydqD7Mna/ZcfW1exeFJnwdqCQvMCx+5i
 Lbl9mYQaaZdAzqxCyspXH5d/A/THotHzwIQar6fNpFlHwqdD1dHNQ5gEQwKhn1inhdzK
 T7BN9M807sxkWVHT4NYDVQzO9zhze54Eo7LuJKQCgQQkqA/upsf1hfa2tua/Gn8h4kkR
 1CVUTuBOEfLfmfuN4ONCcSQbMETVYG5yJfnhv5NIcMAg/l5h5qowgEMUrdhQVedeBiZT
 8o5XCs3+KwNSXrUMzrikVcMRCjan5MZ8UFULAAseLEodRw2vxkBbKbsZsdJn+4Oo1u7d
 Gmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0BVFP/1g/HQOTMSBFiHU/Ck0syJVbeMQLR2eHvlhZV4=;
 b=lvMzWRe2fxSkjVvjCWF8G0epnB8vBoRKvKp51mTZuXn4dMe5zplNU+0tWl8PZWIaSB
 RHTgDV4afbQp5pIT9r0D8k/WUxWHVbmvJfRzAF5ULbTNPDMxFq2GvYyr6PgHf7rNBF7d
 BRbNd1ZBS76ssYaBmmvG/wGv+PNPkM3vLgsIteo9BCNQ6YcyRK6Nj6YIt5BzPDfDL+Na
 OhGaKhsvYoGoGkE2FM3WbGDeSPW++3LNWzNMsSq+aSBgu7swkI8LkTNo2T5a4uV64nE3
 7sV9Ocmpwl4qmN/FRJkdQk5vJhteu1WzzUnZc1qxSqL2yK9TVc9BLVPIvGGrv8QX3Cwc
 FgOA==
X-Gm-Message-State: AOAM530UKVno2LX2f/miFqpiY+taqZTv/JEbXBroWUZYJIHx7LgBpgpr
 WlxymGO810BtegK1FudrkYQC9TKFJUipUg==
X-Google-Smtp-Source: ABdhPJxwcIXoMs9NVRsLETecUijLg36xDNa3Tjt/G9jF/3j++M0Ojif1i9xHyy56hZVEesI1M4X3BA==
X-Received: by 2002:a05:6214:1413:: with SMTP id
 n19mr2894092qvx.165.1598906459910; 
 Mon, 31 Aug 2020 13:40:59 -0700 (PDT)
Received: from ?IPv6:2600:6c4a:7880:136e:9dc0:fb44:e06f:3513?
 ([2600:6c4a:7880:136e:9dc0:fb44:e06f:3513])
 by smtp.gmail.com with ESMTPSA id l1sm11340367qtp.96.2020.08.31.13.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2020 13:40:59 -0700 (PDT)
Subject: Re: Python Wrapper for wireguard-tools
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andrew Roth <andrew@andrewjroth.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAF-5xiCzvHFLtLFpw5FNOR5w7=bEBNjDtVgedRjGNzBigk4cZw@mail.gmail.com>
 <CAHmME9qoWSURAqdQJuOdo9xCBgrtENNOGgf_o1uRep66xRWzJw@mail.gmail.com>
From: Matt Layher <mdlayher@gmail.com>
Message-ID: <00e010bb-33c8-5885-e7ff-7e6aa8ba1dc1@gmail.com>
Date: Mon, 31 Aug 2020 16:40:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9qoWSURAqdQJuOdo9xCBgrtENNOGgf_o1uRep66xRWzJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Hi all,

Apologies for the delay! I meant to reply much sooner but lost track.

I would also encourage you to use the native interfaces as much as 
possible, rather than binding to C or shelling out to wg(8). If you have 
any questions about decisions I made in wgctrl-go, I'd be happy to share 
my thoughts.

- Matt

On 8/22/20 3:05 PM, Jason A. Donenfeld wrote:
> Hey Andrew,
>
> The most complete "library" is actually the wgctrl-go one from Matt
> (CC'd). It's complete because it supports all the same interfaces as
> wg(8) -- Linux Netlink, OpenBSD IOCTL, and x-platform UAPI. The
> embeddable-wg-library is just for Linux Netlink, but I should maybe
> refactor that to be more modular. And as you pointed out, the wgnlpy
> stuff is Netlink also.
>
> If you wanted to start a new cross-platform library, and essentially
> "clone" Matt's Go library into a pure Python one, I'd certainly
> welcome that effort and would be happy to help.
>
> Jason
