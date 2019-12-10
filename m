Return-Path: <SRS0=o99y=2A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE65C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 22:28:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30BFC206EC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 22:28:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqhHMkhm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30BFC206EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e88f088c;
	Tue, 10 Dec 2019 22:28:02 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee4d5271
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 22:28:00 +0000 (UTC)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 698f758b
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 22:28:00 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id d16so21868125wre.10
 for <wireguard@lists.zx2c4.com>; Tue, 10 Dec 2019 14:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/7VcH6bSqODhEOVbqVLCtnNwNP9BgQeSQya3vZyJPf4=;
 b=pqhHMkhmiMjGmtzRo4xmoDBnl/JpNPsnQqaOYCv2ojLV4F84VXs4LYvBpFND8YNKFM
 ZTeZkIKzDIjIqf+Nt3EJ0eZRAOqv1cYQ/ET0SGTGAJNkqiZybQoAJTgSjpxMD4nyO4p8
 8TwPiYnonU0uOxSIV3S1yuMh62ZWtMt7EbooW+0dP/0c3V03Nmr/F4naCHrQ2TlPuulu
 mBzPDz4k82CjMoNDpC5w78i+9pmRma/phpDsb5dOboMFUNHP8x9J6a6BXDSQR5ZGePnn
 bPpAL9CYsFx3UUe/mDEBowLevaqGitPRSpPFBt8ujcZMkN4w4u6T07e44JCUUIHnBoqM
 hJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/7VcH6bSqODhEOVbqVLCtnNwNP9BgQeSQya3vZyJPf4=;
 b=thvNU+/BO6qHNuPgef2494EQV2Pgj9JVKaJUXxHwS02AQZAx0IoLB5C9SZ1u7DWb3Z
 nfLrACIDMmpZx3wQWtfTl8ZWVUaat7WnFoG5RUyuC1a7X4XHpG5Fs5aLjc9+XTiQzPP5
 Kh4hT9Cv0G38E2hnRemVzJ5U4BxR4dS7Pcl/OXm9mEw40Mr5Mi03nLsP9amjPGDibz1W
 ywOAOawihwpBJICP8EFlb3fyXUatuvNHWDL3mJ2kVxCj0+XtzD0dZ6OSdu3TWEzua0qR
 HQwxV28uY9r3Xf8ysLaW/VdDroD4KmLBCQ9u1YgMouVdmk2kzqPFy3VlOH7GD8x4WkVS
 1syg==
X-Gm-Message-State: APjAAAW4yfjY6PUITfm+nMtxjm8qSNJpDuh0emj8SJiYxQ3Nt11GbqFG
 XZIOOOP8xY+VWxlpjdHYtdaKwit98Qmx2g==
X-Google-Smtp-Source: APXvYqx1lmGC6QXevYpJJCWqOIcJYO5/ON78a4XUD4fBMbKFJvt8OXO8MVh4XGzcpLoGQSMjo+TXUA==
X-Received: by 2002:adf:f28c:: with SMTP id k12mr5705438wro.360.1576016879494; 
 Tue, 10 Dec 2019 14:27:59 -0800 (PST)
Received: from [0.0.0.0] ([185.220.101.7])
 by smtp.gmail.com with ESMTPSA id h17sm5127781wrs.18.2019.12.10.14.27.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Dec 2019 14:27:58 -0800 (PST)
Subject: Re: [PATCH] wg-quick: linux: add support for nft and prefer it
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20191210154850.577745-1-Jason@zx2c4.com>
 <FX30kbIJvHNSsmPxMSA_XdlAOLSee8p5eHMDcDAkDH8KKhihrybE2EtZJIjtU9ojh-JJT9g4Cj5xlT85E5uETb9JsBJmficyjfDvblrRaJg=@protonmail.ch>
 <CAHmME9pdqq23OXNPHLT-YyXCKTVTKJNyfz9D+Q0jADAN=BDhnA@mail.gmail.com>
 <20191210221215.56c2f30d@natsu>
 <a8f51c8e-d0e8-aaa6-024f-70b65007559f@gmail.com>
 <CAHmME9pSsTogYKMObNuy20FCRE8tNrjT9OVefn1GqqmG1B7q6w@mail.gmail.com>
From: Vasili Pupkin <diggest@gmail.com>
Message-ID: <59e3deeb-b615-fc61-0871-c56f20aae67f@gmail.com>
Date: Wed, 11 Dec 2019 01:27:56 +0300
User-Agent: Mozilla/5.0 (Windows NT 5.2; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9pSsTogYKMObNuy20FCRE8tNrjT9OVefn1GqqmG1B7q6w@mail.gmail.com>
Content-Language: en-US
Cc: "jwollrath@web.de" <jwollrath@web.de>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

On 11.12.2019 1:09, Jason A. Donenfeld wrote:
> On Tue, Dec 10, 2019 at 11:03 PM Vasili Pupkin <diggest@gmail.com> wrote:
>> As far as I know both of them are maintained in the same repository and
>> both use the same userspace library to interact with the kernel and down
>> there all the rules are translated into BPF code which in turn is
>> compiled into machine code by kernel BPF JIT compiler.
> "bpfilter" is a WIP, but that's not today how iptables or nftables
> work, at all. I'm not sure your statement about userspace is entirely
> correct either.
>
May be it is a road map plan and there will be no difference in 
performance when it will be implemented then. I just recall an 
announcement somewhere so it is just a speculation from my side, sorry
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
