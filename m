Return-Path: <SRS0=49e1=GP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8D2C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 Jan 2021 12:07:40 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1815B23107
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 Jan 2021 12:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1815B23107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90902709;
	Tue, 12 Jan 2021 12:07:35 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3df47b76
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jan 2021 12:07:33 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id v26so1989732eds.13
 for <wireguard@lists.zx2c4.com>; Tue, 12 Jan 2021 04:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:references:from:subject:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=ECjcg+eBTQcvKZvru++Z6b08l7nrXS/55o8r0x2ojFs=;
 b=H/M3j4AhBhG20r9JmkdHfXv8VW9exdwEricSWS3fRq72eESDdpCHfopmd0AaMxfQNd
 qwM+DRbBwBbyqpw3wHGuLjf/+flj1o+yW/cGtuIfPoSsytcsPNo3dcr1Bhcn3fxqDN0N
 Q+u0/mF0c9Ao+Hq4K2iDZX9ITvZTErolidSayZYNVQhH/UFGCyqaBHhhZIcayUdhPZ1+
 EVOH0jOlXX05zHsty5dQpOg7Eg27K4a6Fr9cq4czZvsGwgOhDmAmjyPL+aQUovNselgG
 HH9a3NBg0+RaLBg6kyfs3xez6TgMZ54I/jbrfBYvYzHOm2Tt4OICpVxiuXAe9+vdVxcZ
 CfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ECjcg+eBTQcvKZvru++Z6b08l7nrXS/55o8r0x2ojFs=;
 b=JznHMWs17op1O70gfWqLba10YQ00A0rBzqkX8f1BHAh6nwTQmgB7G24vs79XsA3kNC
 AjCl7NQApPoBIjMEprBRZiC61ZU95R8Y6u8Ppb6asdFuS/DjKSHK1TM+hodWYVf62Lww
 4ASilMJjtPv6bkR6M1OonNHi7ejAuCSdYXIzyLM3e2xMIa2g8tl8XSnIAJvFDDhFohJg
 4DHIAwJKpa0Cd9zwqskTQsgOrhrZg/FqO4OIdMuOgXVPNbhPJAIf5DtD0/LKJk/pCwEn
 4QicEdKeFMikTI6LjJtnu8aYtNKzK3GG+krbV3g4kM6fCAqlTQCzZu4fDn7LpX6As7qg
 fCeg==
X-Gm-Message-State: AOAM530kUNKKJuhKGsFdTHGxgCa9flMwbWy389jiB9P60wEBQ3DlxHnq
 s0Xhyu2bGTx4njwELlAKObgjQ1oLaA4=
X-Google-Smtp-Source: ABdhPJylv2BMm9TA7e+vE1NBTkl2Am7DVaxgCHRyZGunCv1H61UlqyAYhw/c/bXeNUtDUFnVi40GSQ==
X-Received: by 2002:a50:d685:: with SMTP id r5mr3246213edi.248.1610453253113; 
 Tue, 12 Jan 2021 04:07:33 -0800 (PST)
Received: from [192.168.1.3] (93-48-172-72.ip258.fastwebnet.it. [93.48.172.72])
 by smtp.googlemail.com with ESMTPSA id i13sm1118142ejc.57.2021.01.12.04.07.32
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 04:07:32 -0800 (PST)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <78d6a7df-fa89-7d75-480b-aea3c52f72ee@gmail.com>
 <CAHmME9qzEYxA6uES=Mq8zUrUCogsrP_BmSasVH++_T=2VvennA@mail.gmail.com>
From: Germano Massullo <germano.massullo@gmail.com>
Subject: Re: AMD RDRAND
Message-ID: <a4125417-7217-fbf2-5611-6742f56f6867@gmail.com>
Date: Tue, 12 Jan 2021 13:07:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9qzEYxA6uES=Mq8zUrUCogsrP_BmSasVH++_T=2VvennA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Il 12/01/21 00:20, Jason A. Donenfeld ha scritto:
> Hi Germano,
>
> I fixed this already, by removing the use of RDRAND from
> get_random_{u32,u64,int,long} entirely:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D69efea712f5b0489e67d07565aad5c94e09a3e52
>
> This happened almost a year ago back in February, and was backported
> to the stable kernels too, which means you should have no issues
> finding a working kernel for your brand new Ryzen.
>
> Is this actually a problem you're experiencing or is your report
> mostly just speculation based on that systemd issue you linked to?
>
> Jason

Hi Jason, I did not know you already addressed the problem in the Linux
kernel, I just made a quick search in Wireguard mailing list but I did
not find any discussion related to RDRAND
I did not experience the problem (I haven't run proper tests yet), and I
haven't studied yet in detail all new replies in the thread. I just
wanted to let Wireguard developers know about this problem because I
thought it may affect Wireguard


