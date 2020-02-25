Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E38C35E01
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 15:49:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66E822082F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 15:49:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQzQgOIn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66E822082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9affb6e;
	Tue, 25 Feb 2020 15:45:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8150203
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 15:45:51 +0000 (UTC)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d210219
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 15:45:51 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id v4so2441232wrs.8
 for <wireguard@lists.zx2c4.com>; Tue, 25 Feb 2020 07:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=rNwsRgRy/HHGkBof9HeZUneG0CUFcBFVCJg87KzkdUk=;
 b=rQzQgOInRg/GYRj86BMlB8QPQcwAdFPjEuYWfHLRSExe9xg7CGkJtqaTSNDDNB7KMX
 mAp1oMsJPSB6e0InaDbYInyFK4nM+pzw1sKU6/clPrFas3QcQBK8Gz/2VsyIu8vqDYRT
 +mR5ViAb4MoKfTfQ2HPNntLJBApAzR1B2IBx1Sjpqsw2pZSDoM4dlwSWK1q2yXjrU16B
 iz2jAVylP7hXGHTa59lnLkoWoWeiIROO33c1ha9xcrW8BdVgAlZVbjWEP3rfmkm/QC7h
 DhPCdB+fpAIFmbjs4L81ytocNR1m8NWWOfi5+x4UoNSSv+k16HizRRdfhDPFEn3z8X5h
 BVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rNwsRgRy/HHGkBof9HeZUneG0CUFcBFVCJg87KzkdUk=;
 b=d9AxDVTeO8gi9haA0+uVd4dDG8g0pAdzQw7Jfzu/yZht6wNW4afp9hEq3LdrxC+ZML
 y1jku3RVHr/z4UO7O4qDHttOKdDwXD5oe8M8XkymAdzL9Rwdyh4kaqLEpD/HvndsVcTv
 wsmTjunhixakkeWnTVEjT2qLTEkZnxBOXy6bsivl2RYhhNIhs57M7ljkYq67ZGTySIDF
 VoIJj3EXuk7732WKQRkuPW/xVMzIBFiDkCIyHL0aNgjKetK9OEDOj06WYthO090w/juo
 JgfhKvEirxBNcMXRy3kfLKcNezgeJXkGeKSOHaRWfi9ETLcEH8+RkDhwVcAoB3CsLAYl
 s9Vw==
X-Gm-Message-State: APjAAAWdHlH99JO3AlH1S7Kx5edRiOeyc/VjzzVMhcpX/xnF/ymDOlI2
 dcwKJbJ+n3Z96gHnYK8RyKqQTNdN
X-Google-Smtp-Source: APXvYqysLssdjxuxCuBhcF1Gu6xZX7+V6OsBigGlQk6/nEwVtKCWvS+rqiL5geazKh5uO2SHjk5imw==
X-Received: by 2002:a5d:628e:: with SMTP id k14mr11107566wru.425.1582645762118; 
 Tue, 25 Feb 2020 07:49:22 -0800 (PST)
Received: from ?IPv6:2003:c5:5f30:c501::3?
 (p200300C55F30C5010000000000000003.dip0.t-ipconnect.de.
 [2003:c5:5f30:c501::3])
 by smtp.gmail.com with ESMTPSA id c9sm24467740wrq.44.2020.02.25.07.49.21
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 07:49:21 -0800 (PST)
Subject: Re: [PATCH] wg show: Add json output
To: wireguard@lists.zx2c4.com
References: <20200217035701.28261-1-matt@oliver.net.au>
 <CAEQe3e=JMOwASvDGuC00uiYdTY_VaU0PnB285pU715i7g4uRaA@mail.gmail.com>
 <CAHmME9rob3DbpZMdU_Bh_DVjKxhzguPV1R5OvQrdBzURh7ch1g@mail.gmail.com>
From: Julian Orth <ju.orth@gmail.com>
Message-ID: <a3cc3c56-9fdc-8e43-aa81-7a9d5c93a37d@gmail.com>
Date: Tue, 25 Feb 2020 16:49:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9rob3DbpZMdU_Bh_DVjKxhzguPV1R5OvQrdBzURh7ch1g@mail.gmail.com>
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

On 23/02/2020 12.00, Jason A. Donenfeld wrote:
> wg(8) is a unix text utility.

ip(8) supports --json since 2017.

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
