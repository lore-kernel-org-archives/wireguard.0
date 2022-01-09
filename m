Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68243C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  9 Jan 2022 10:03:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0ea7cb24;
	Sun, 9 Jan 2022 10:03:35 +0000 (UTC)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [2607:f8b0:4864:20::532])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d97822b5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 9 Jan 2022 10:03:33 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id v25so8730321pge.2
 for <wireguard@lists.zx2c4.com>; Sun, 09 Jan 2022 02:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=8m/YGiLFJ3HXHH3CL2bTvVK1edi4PciNG6n57Fw+gtg=;
 b=MUWeO8Q3l00n3Mm/RTf91PcKUS0LUQy2ybeatAHk4uYzvBld50vMtPawbqn8FWlS7c
 Ue2jomFhMUKhjEgGrmruMBeE7FysLKlGzDThgKixUklK4wTXdb9DtbpdLIy/uMn9/NLA
 3+s8Zb/uDXdiE1pKILtwnASuPwrS5JGJW8ycTKZfVCmxAju2136qTs6chGIgU5cRY5iQ
 BrN2jK1H2zn86TLjc4ySECy6haUr+8zMSf96SpLZxsuoNyTCZyKgZ/BBu/tilMWhxXs1
 EFJWZbn0F6KMi1Osg52XkPGCwZzwVLa/sA2y6c0iVSmfwjEEepGcXGqI7CBLGr8tL2Bq
 /+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8m/YGiLFJ3HXHH3CL2bTvVK1edi4PciNG6n57Fw+gtg=;
 b=nruydE9BjcN08riunWrml5gw6ynUmpRq/kOwOwwGNQ4vUeoGsVyXWF+7R99KuwMBDU
 Ox+mMVr23d30Gv6hyjXELwUvmmXcuPBa00eNgeZL0u5KBkGV+wTiZOh+KXsucIO5zg2V
 KVJd4sAhS5Qk5oxBJyT752xxTJ5LaHdxGhktE93jFCC/+RRhPDwt7CA4QvpMEfQt+SV5
 df+Q+tP8h0bAy4FqgJLPqwwMdt4Cdm/DQraolIRmH1GMuFGsolnDNr/+KW27/2pDb25r
 XjwzIOOqdqzM0HQVNZ7hWtxFJc8x+Jne1qU4S7tKUdW2JM+9JJ9YLzdmZfT9du+vDN5f
 zw9g==
X-Gm-Message-State: AOAM530U6fr5uXxm5J/Q89BtIqp+n3r1idB1V/7AWbIsqTd7qefk/dBD
 B4tkI7/6pmD1/hW1cgn99FE4+kmptM7IiEf2aTtTWxD5Vh0=
X-Google-Smtp-Source: ABdhPJwSADiM+yZlzJcHs3hfcwWR5zYMQquymGMA7kX1WXSEO49bFQsy05BE7UnVv7O/2OTxvlWqwMP/KFYhYKjmXPs=
X-Received: by 2002:a63:f30b:: with SMTP id l11mr62118093pgh.272.1641722611948; 
 Sun, 09 Jan 2022 02:03:31 -0800 (PST)
MIME-Version: 1.0
From: Houman <houmie@gmail.com>
Date: Sun, 9 Jan 2022 10:02:56 +0000
Message-ID: <CABBZOs=ihCjiLEE9vLyHZpFRn=ERi6rXO2i660R9oWyuBVf4CA@mail.gmail.com>
Subject: Does Bitcode have to remain disabled?
To: wireguard@lists.zx2c4.com
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

Based on the instructions on Wireguard Github page
https://github.com/WireGuard/wireguard-apple#wireguardkit-integration,
BitCode has to remain disabled in build settings.

The problem is that by disabling BitCode, crashing information won't
be as accurate and we won't be able to download the Dsym from the
AppStore, which is needed for Crashlytics.

Is there a reason why we couldn't enable it?

Many Thanks,
Houman
