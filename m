Return-Path: <SRS0=i/Df=GF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7694CC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  2 Jan 2021 08:28:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E21C22241
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  2 Jan 2021 08:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E21C22241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pregonetwork.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7aa9eeea;
	Sat, 2 Jan 2021 08:17:05 +0000 (UTC)
Received: from jeremyp3.stolon.network (jeremyp3.stolon.network
 [2a00:5880:1401:77:f4d5::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 22f389db
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jan 2021 08:17:02 +0000 (UTC)
Received: from jeremyp3.stolon.network (localhost [127.0.0.1])
 by jeremyp3.stolon.network (OpenSMTPD) with ESMTP id f0474b85;
 Sat, 2 Jan 2021 09:27:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pregonetwork.net; h=
 subject:from:to:references:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=postfix;
 bh=6PePjXXqcV8jXsbhAQ3/xJoq5dc=; b=Rb50PBCRC69rCE/W85QKn6EAm2RD
 AKLDz8yl5M3wH72It22t3ybCyrVXpEqL19Rq3CZpa7d8JgSC1kFSz9BG5FZqZhwd
 uNFlgUNDBAEbyjGjL9QT7y+Dw4mAYib4hY6+qnPShx84K9X8sX+b2R2UNUlFlfRw
 Bc8qmUuep6/sBJoUEHSBO8doGu3fdIXyu8cnvj6a3ibg1e9FChF/ZK/Ki27PaDDx
 Pm8+11ux/qmexnt7vTLNDPU+opG9Ua57844bdrS12Ja4zWRlTSNB9kI2TKp2q6ew
 8k7N1rBjwpVzh3y19OsGe1/zz9I5bnNoBjIqTL/SwcPkbZ04V3qeT9RBIQ==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=pregonetwork.net; h=subject
 :from:to:references:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=postfix; b=dk7
 L9ObZFoSWPMVOZiomhd/EmT4DCIFb+0HfL9tbfnzfbM/FHjENFxM4MwsMx956Vpy
 R5EyEBV108IzQLTKphyog5qJJvaMFiKzSSJKZbDWgjYScG6srJpw5FJMY4v5DH0n
 0YDZFYMi5k9pnHOuLJlkSvHFBg/vTzH5Y2FLl5HFobHSVpFofTy9QwyV2KpQNlZ5
 uXxH8XxqN7fLhz4zche1KihSg0OXngZbP7l5sm+WaX4i9eqspdhbwahH/4CckA4n
 IHg2VSm+5WLQUtJlbz8FmeAY0qz89PV7P9xU5BQ7O7p8rFNTZ0FH3DO+YdIgex2Q
 u0TxrCKd0jcopmcEiHA==
Received: from [192.168.80.10] (backupmail.domain.tld [10.4.4.2])
 by jeremyp3.stolon.network (OpenSMTPD) with ESMTPSA id 4ada1a0e
 (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256:NO); 
 Sat, 2 Jan 2021 09:27:31 +0100 (CET)
Subject: Re: wireguard android don't prefer IPV6 endpoint
From: =?UTF-8?B?SsOpcsOpbXkgUHJlZ28=?= <jeremy@pregonetwork.net>
To: wireguard@lists.zx2c4.com, team@wireguard.com
References: <ead64d0f-af1e-8d5c-3d87-ed14902c5e1e@pregonetwork.net>
Message-ID: <64137c2f-266a-1a06-9130-e8b42ecd4edf@pregonetwork.net>
Date: Sat, 2 Jan 2021 09:27:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <ead64d0f-af1e-8d5c-3d87-ed14902c5e1e@pregonetwork.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: fr
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

I confirm the same problem in wifi

Le 27/12/2020 à 07:02, Jérémy Prego a écrit :
> hello,
>
> I've always encountered a bug with android wireguard when using an ipv4
> / ipv6 endpoint.
>
> I tested with two phones:
> Huawei p10 lite android 8.0 emui 8
> Xiaomi poco m3 android 10.0 miui 12
>
> When i'm in LTE (not yet been able to test in wifi), wireguard connects
> to the endpoint in ipv4 and not in ipv6, and i don't understand why it
> is doing that.
> However, chrome, for example, does use ipv6 by default and not ipv4.
>
> My phone does recover an ipv6 in 2a01: cb1a ........ / 64 and not an
> ipv6 type fc00 / fd00 / fe80 ...
> I also specify that if I only have an AAAA record, the tunnel works fine
> in ipv6. but suddenly, I can no longer connect to wifi which only have ipv4.
>
> I would like wireguard to favor ipv6 when it is available, and otherwise
> switch to ipv4.
>
> Is it possible ?
>
> Thanks,
>
> Jerem

