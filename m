Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B771C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Feb 2022 09:41:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ba6dc7ff;
	Wed, 23 Feb 2022 09:41:56 +0000 (UTC)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c2874d72
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Feb 2022 09:41:54 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id p8so14785675pfh.8
 for <wireguard@lists.zx2c4.com>; Wed, 23 Feb 2022 01:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=3g5TeLuEoFvGdhjOuglzIcH3DRHGtu5mA3Mfy14QCrk=;
 b=T5qDGoTS9Y1g/NRyPOFLDEJwmy5vv1UcGf1S4vPAdou5fpRkgFwYbyv47uznQtJX8o
 9Os56e7SxdmWvAE8m//gd7/CUOoyQiSPqU6uPZ2boalF8op7p8gAl4SpXdf8zG9Jsm+z
 JV1v3+Nvgm3KTrBQsRVO+XZ9ItrEClYeZ7fe5N0pYopm0GMVJz1Nq3RJDGmjOpfbV7o8
 PvszobNj1JDa0CJmi86RNxNt0hn8lvEMqbHNbjG7ni8JpsKLaycjzh8g9xEIUIQdnyB/
 kyRbBjeuuS6FtHpj0lFDFFV5IGqkXb30XAGLayEUrZLiNIiyXCXxEEt40AOQy5K6zXkS
 jr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3g5TeLuEoFvGdhjOuglzIcH3DRHGtu5mA3Mfy14QCrk=;
 b=IrjnRV/baIvjVrYw9NgcnzgW/SsuHtYaF/BlBTRCdTPCE5bur+2UI8dflUD7q9fFwJ
 /OuIN3kPrdV0V/uy85p5qxEJkQnGH07feyB+hPIfzToWyMJ3w0EqW+Yrf0TyXZ5krqCK
 7E7qwumgK4aTGIc0fuQuH7UJg8ViSGCQ0ThSM6LL3Wk7+TmTg04h+0ljfyPRkiI4IjKR
 +pKAXVeAUiuHYgWFBLuNY6dp6c4YpwNBpyhSfD09hVErFnflcwEQwwg3tL5sXyfwSCFX
 zYP8hQIdSLXOggyQnzX4zZ4rLMlhyPg0Ymm18DXzsRgDWMgYItleRBqYvMrRt8v6hQ47
 hFag==
X-Gm-Message-State: AOAM532KVwg4jO7CVPNyLnpVEpJhNHFhucsKuVNzE2I8xrvFYYYhuOdf
 lFnz1gzIITt0MyGMc0TxvQp1wwSNSvoxhr6LkEzTgoiodZw=
X-Google-Smtp-Source: ABdhPJxz5ZZXFC8q3erqk+7wKdYSwlPhjHOODcfLBJ3vqMT8/vQ3+EQbjwVQ5ShqeSdw6NfR1mVRixbys3hxLrMD29o=
X-Received: by 2002:a05:6a00:2405:b0:4e1:5008:adcc with SMTP id
 z5-20020a056a00240500b004e15008adccmr29114107pfh.35.1645609312058; Wed, 23
 Feb 2022 01:41:52 -0800 (PST)
MIME-Version: 1.0
From: Alessio Nossa <alessio.nossa+list@gmail.com>
Date: Wed, 23 Feb 2022 10:41:39 +0100
Message-ID: <CAMTfdYqOySWMEELoW6X2b=es8mkGUffMv4zw_g3=Wm1QDAQtLg@mail.gmail.com>
Subject: [wireguard-apple] Merge of contributions
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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
A few weeks ago I pushed some changes to the wireguard-apple
repository (an/shortcuts-integration branch [1]) and also created a
pull request on GitHub [2] as indicated in the message returned by the
server on git push.

However, there was no sign of a review/merge. Is there anything I can
do to speed up the process? Do you have an ETA for the next WireGuard
iOS app update? I have tried my best to facilitate this, because I
really need the Siri Shortcuts integration to be available and I don't
want to distribute a custom version of the WireGuard iOS app just to
add this integration.

Thank you,
Alessio Nossa

[1] https://git.zx2c4.com/wireguard-apple/log/?h=an/shortcuts-integration
[2] https://github.com/WireGuard/wireguard-apple/pull/8
