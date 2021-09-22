Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054A6C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 14:42:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2749E61107
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 14:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2749E61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b970b8a;
	Wed, 22 Sep 2021 14:42:02 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 979ae0fa
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 14:41:59 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id j15so479175plh.7
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 07:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:content-transfer-encoding;
 bh=b3BKc10rM3mAd5tB1E8ugXrL1anHsPSW5WlkZkh9/2Y=;
 b=iwZS08CY2fymxFmS4BcNklGd8Mhd0kgS9XYh4c13LLMQwA5r9Jrja5q7JCju6thrEJ
 47ZvZRStNCPUllZTxKTGKZHqWWg+PomEflLLGkr3nAPrMtJ7eyRHFRdeJzqhk3S1ctav
 hJcF80kdYglXjf6vBpMk3aYiTSGI/0PZ0//8igvybmemcMpzziCnLZENDNrdK0HGE/w5
 10UeLb7Op84ahToLTaYY5bgyS4BQmXkvibyJW6v1An5WlVak1umGYFn1A/PI6+/gHOpv
 mrcGAILaiZgwUMaq+06GH2JNJkdLJqT7sb7aDHSMj8XtaYisGeBp3+E9+Ebd0xttNYH7
 urlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:content-transfer-encoding;
 bh=b3BKc10rM3mAd5tB1E8ugXrL1anHsPSW5WlkZkh9/2Y=;
 b=lxvOi7qQqYwyjf9C24EB0I3eM4Cveu9S8mFCI81x0Koj2slFUUPXynEU5kemaRw6ef
 s8w5+Xut9ctryU5P7icEy+cH06zwvJJtaWyZWFr8EArh8p6DktDXptK9r1jy2dXNrd8Y
 2o5RORkCM/rGAP8HNICuAEVGNaaX5de2FMtWSwQMUIfp2UEBYUejYXuuJTmfPcuO8feU
 zg2oCSEo/BA4iZtAqqEG/QNkT2ugMlfDHntwyI0Idc3r4f7U1JAMn0k3VrsGCWYY/pBf
 d8nEoXz9Ialc3Qg2nBGhBiSLyp3B77nOsK0UYKb+AfxwbhOuAwN4t+WSVnC1ytE9boeg
 k5AQ==
X-Gm-Message-State: AOAM530x1+04N6a6gP8uchkYdek2dQ3GP/hSuAT/owEuoYTk0EquG2xR
 ZUpmvbqlpL5+szP8/EeHgKOqMAEZKmnr6m3bpZhng38Jg+Y=
X-Google-Smtp-Source: ABdhPJxq7IylX1C163EoOWLrt9RbnXyo4PlGIgc0uEbKkpXDj2LRJuBCSl30toPTpq42QhaR3TLpVzx3TQZAESHwa5Y=
X-Received: by 2002:a17:902:c789:b0:13c:937b:a5ce with SMTP id
 w9-20020a170902c78900b0013c937ba5cemr192599pla.75.1632321717305; Wed, 22 Sep
 2021 07:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <B3A4A27C-1FBF-4098-B38F-9F87F8C115B5@gmail.com>
 <5569D8DF-A7E8-4A13-BA6B-913785819E4E@mullvad.net>
In-Reply-To: <5569D8DF-A7E8-4A13-BA6B-913785819E4E@mullvad.net>
From: Jeffrey Walton <noloader@gmail.com>
Date: Wed, 22 Sep 2021 10:41:36 -0400
Message-ID: <CAH8yC8mK2-UEzFJ0eqN8XHoXsyESKie7642PcbnN=w7Q6QM6EQ@mail.gmail.com>
Subject: Re: [wireguard-apple] [iOS] Changing network fails with
 includeAllNetworks (Kill Switch)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: noloader@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Wed, Sep 22, 2021 at 9:31 AM Andrej Mihajlov <and@mullvad.net> wrote:
>
> Have you tried on the most recent beta? I think it works over there, but =
requires some tweaks to the network monitor code in WireGuard. I had a patc=
h somewhere here but haven=E2=80=99t spent much time testing it:
>
> https://git.zx2c4.com/wireguard-apple/commit/?h=3Dam/enable-include-all-n=
etworks&id=3Db244febfdf3069dd4e8db2d31f0368d5474d7616
>
> Waiting for the final release of iOS 15.

I believe Apple released iOS 15 and iPadOS 15 on September 20. Or I
received the security announcements for the release. iOS 15 and iPadOS
15 is APPLE-SA-2021-09-20-1 at
https://lists.apple.com/archives/security-announce/2021/Sep/index.html.

Jeff
