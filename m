Return-Path: <SRS0=qtc0=7C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2DFC433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 May 2020 15:04:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BBF02072C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 May 2020 15:04:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGszpM8L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BBF02072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b41db481;
	Wed, 20 May 2020 14:50:01 +0000 (UTC)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d77bcbbc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 May 2020 14:49:58 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h4so2828128wmb.4
 for <wireguard@lists.zx2c4.com>; Wed, 20 May 2020 08:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=Yl2RhoPiwQAOp1rsmWAWT27D5585qkabzCFEGbrnqSk=;
 b=VGszpM8Lbdusr7UNT3eWYEsnJ6ugwPAbX1BryLz0Sz+A/SLCtdP/4A1x8w4KRwUN0W
 YX4VlzYESpx4kkniKG0pKV2xDLs6yHgQZ3xOlpWMeTKW1+7MJLi9z957lvg9xr5DwTOd
 qVbEDN7zRRZn9m+db1RFJz94opXShqesR3WmG6TgIqgs8h5hCpXb3lFymDel2rR9Mt2l
 AnYRHnycegXXmhjcnqvlDnq4mv6zXPy8BagUdUXFzy3iQ0QidKnDQHBNSo3y2PdF9rWw
 MKh1fwo0LfbcHqrsLmsBh84HuxZZGg3KrK2Fyxkd+ZDUG86v06zES/1wVpjBV3e3r+XV
 pUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Yl2RhoPiwQAOp1rsmWAWT27D5585qkabzCFEGbrnqSk=;
 b=UeYIIe+ftX4UTNiYhmDyZ95oUn3DfkVd7KbyO602mIKPyHZJXn4gTSMm/4RwSHDwg+
 s10K7868DY+n25lkGXDLUvBqnhrvtRxvPm6xAvTWNaQ75PJ5gBiVTFhfF6XpI3IaqHSh
 LK285S2sv00hWCLmB3XMzVIW98vZ8/LVY+ajJQ8uM8+fIFYxkM4shPYZZNSH2APiVz1P
 22PnbEETLXNeFHN8QhPofjW1iEVP+0gYfTPfVKkTHWe2OJHwRvTFJa8eD6MZKeIfZBJK
 6he9obfUwpjfP2remSiJIdg3ODFXmUgJlMAra3Z2eA9qivtlRQRV2A78qm/BzddWBluo
 JE7w==
X-Gm-Message-State: AOAM5333s0keIyfA8HgNNzFt6CvLkDR5KExxy/xH7c4AC0rWqgbMsXhD
 P664AGuCEZwr6tZv4wCyydhGdL4Qb9I=
X-Google-Smtp-Source: ABdhPJzWzgD0AWolUeDIPeXY80se4LgSBAK1yqLQFzy+S3iwgPGkULovsOuxPV/CfC2BRRFlwE/H6Q==
X-Received: by 2002:a05:600c:2043:: with SMTP id
 p3mr4795944wmg.187.1589987066533; 
 Wed, 20 May 2020 08:04:26 -0700 (PDT)
Received: from [0.0.0.0] ([185.220.101.12])
 by smtp.gmail.com with ESMTPSA id q17sm3553305wmk.36.2020.05.20.08.04.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 May 2020 08:04:25 -0700 (PDT)
Subject: Re: Ubuntu kernel >= 5.3.0-52.46 breaks DKMS build for
 wireguard-linux-compat >= 1.0.20200429, patch included
To: Simon Deziel <simon@sdeziel.info>, wireguard@lists.zx2c4.com
References: <6565463c-0a99-9137-5cc2-714e2fbd6dfc@rub.de>
 <CAHmME9qDMiNh90_zA9KsFX-OaHNUHnw5=e65jH3PdXg1n7nyFw@mail.gmail.com>
 <20328df0-e2dd-1653-9fc1-1fb06cbc054f@rub.de>
 <CAHmME9rnxp2QYjhu1vU+2K1GaoM2hupz5uJGpo_8z4t=E2-boQ@mail.gmail.com>
 <d62b74e0-0ae7-4948-df6d-325bcef94112@sdeziel.info>
From: Vasili Pupkin <diggest@gmail.com>
Message-ID: <0c2ca6a0-9b74-72d9-8476-c1c249a785f3@gmail.com>
Date: Wed, 20 May 2020 18:04:22 +0300
User-Agent: Mozilla/5.0 (Windows NT 5.2; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <d62b74e0-0ae7-4948-df6d-325bcef94112@sdeziel.info>
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

On 06.05.2020 19:22, Simon Deziel wrote:
> On 2020-05-05 12:03 a.m., Jason at zx2c4.com (Jason A. Donenfeld) wrote:
>> Ahh, you're running -proposed, gotcha. So I guess I should wait until
>> this hits the main repo. Any idea when they usually do that?
> The next kernel batch should land in -updates on May 18th. The detailed
> schedule is at https://kernel.ubuntu.com/

The broken kernel 5.3.0-53.47~18.04.1 was still pushed to 18.04 very 
recently, today or may be yesterday
