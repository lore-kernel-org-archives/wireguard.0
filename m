Return-Path: <SRS0=nFax=BS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AD9C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Aug 2020 08:04:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A432C20855
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Aug 2020 08:04:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q/ucST2K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A432C20855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cfe7c5b2;
	Sat, 8 Aug 2020 07:39:29 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2d25ba46
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 8 Aug 2020 07:39:27 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id c80so3525166wme.0
 for <wireguard@lists.zx2c4.com>; Sat, 08 Aug 2020 01:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gCoK2rLsjKUWaqT6ZHySu3RTGCVm0iv25mtLzLpAWlo=;
 b=q/ucST2Kn2XfF2ldGaOqYyp9+S+Ke/Eon6gzyD1tAM61AGqTGd2BcK/WGekCc4C0BM
 bGvfYsnb28vc+kPYh2EZyKYBytKv9ZNSmgMLZtmJCBTNKR229hfEEnenrQFAcp0599fh
 2kykqsJmof/kJ1yXNB2HXa7+a9vJCeOcQHyY1tHpT293sFtXjS3+7jTkcUswLFf79brJ
 71+/g+99OWL4zMMshT5RjndYNfkh1vcNzbl8WetyCNoWoKGKpAGPBi0GSqZdj2saYCms
 zcjXTUQbqx2TpT59kL82XxS4RzFJt0E4d/OHz1717BeWH+g/L2GSOv8Sq03yaMUg2MHO
 GkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=gCoK2rLsjKUWaqT6ZHySu3RTGCVm0iv25mtLzLpAWlo=;
 b=S23xaZCwmUbBaV9aB0iNnYI08+Z8BUq/lQy8cafvYGwRgWUrTM9K4g7mqZ8xbulYwx
 wUy/3JKs1rEu2puLnIjDSh1irChVo4zpZrsJRCcTGpabS8+PZ+u9qc0waE/mCUe2RpRY
 870E6jvadsQL5YxkPqgmtEBaay1PGvbo3glNgCi4cV+gBMkSmXCtIiwKQ1c34e+eepYI
 tr3rebmZWMe4QBjD2uHkAHMelbs+JsLf5ERRH1iJ+EeWEe3gzBl5spI3oBtYfYmFbYCc
 SCz8ewJNRYbehCqFvJa6cnifC3RvotSLtpG0sE6pmzTcRz4/dxqKihKcZVWukPevyhTX
 WmeA==
X-Gm-Message-State: AOAM533vnfssMS0wvSjV/r0nWnBTcDO6FfzlxU87Z/m6p1q9lVQbGInh
 nlgweAf/PE8e5EzS1apqqLVeIcgJ
X-Google-Smtp-Source: ABdhPJzNgFEPh4gBQHFL/sBcUbR9RoavwOzpsDvM2HgBu+OJwqJMxfR9fXF2lS9+UTmy0UGKugNp4g==
X-Received: by 2002:a1c:a9c6:: with SMTP id
 s189mr15173718wme.166.1596873855907; 
 Sat, 08 Aug 2020 01:04:15 -0700 (PDT)
Received: from [192.168.20.100] (20.157.63.94.rev.vodafone.pt. [94.63.157.20])
 by smtp.gmail.com with ESMTPSA id
 q2sm13074562wro.8.2020.08.08.01.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Aug 2020 01:04:15 -0700 (PDT)
Subject: Re: Android App not setting DNS when allowed IPS not 0.0.0.0/0
To: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
Cc: wireguard@lists.zx2c4.com
References: <aa041580-d6e8-6fa1-abc6-86de7f2ef53b@gmail.com>
 <CADn-QaO2gn8vX0qA9jeitSGiSK11qengh0U5_JjonTmSND84Tg@mail.gmail.com>
 <338b5098-1125-584b-e3c9-19a6c6015926@gmail.com>
 <CADn-QaNC7shh1_QSVmPUU6NGGB1wEOp==RhojwTcqZd2phDSyg@mail.gmail.com>
From: Mauro Santos <registo.mailling@gmail.com>
Autocrypt: addr=registo.mailling@gmail.com; prefer-encrypt=mutual; keydata=
 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 hJqc
Message-ID: <15f414dc-8cdf-5bcf-32b2-f91db2dfcdc3@gmail.com>
Date: Sat, 8 Aug 2020 09:04:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CADn-QaNC7shh1_QSVmPUU6NGGB1wEOp==RhojwTcqZd2phDSyg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB-large
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

Hello,

On 07/08/20 12:59, Alexander Skwar wrote:

> I've got no "name" attribute and I'm using "=" signs. But I guess you didn't
> use an export in your OP but copied the stuff by hand?

Yes you are correct, I did copy the information by hand, the exported
configuration does not have that attribute.

Regards,
Mauro Santos
