Return-Path: <SRS0=TH/E=FY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B54C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 20 Dec 2020 23:10:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 129B022D05
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 20 Dec 2020 23:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 129B022D05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1bfe2a3a;
	Sun, 20 Dec 2020 23:00:58 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 716b2aea
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 20 Dec 2020 23:00:54 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id ga15so10994595ejb.4
 for <wireguard@lists.zx2c4.com>; Sun, 20 Dec 2020 15:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=HxByUNNAYFAx0ERZJMQyIlilAQOl19GTji79GV8tsnI=;
 b=Yb1FAHztc/Fp8mWOQ8ClrpzuwrjqQ+noN36QbdhHKJBiJRCsDcKLoubvWM0iyErlXD
 am24XF1CRwuWgIC+Y6tW6zRGwjLzv9IhnizCJUptjRPNjn21g/rHOrupTBcRYA32O6f8
 WTRZEnZc7kxEbyVLGDGV+J3ukk1Rh8rgIP79UyV6/MDSXYzANIUJDbqLmt7tIbvA91Ck
 x31mYwMKTpGH0RJ0j/toRbJG6/6lH3uQKPNnPanz6PcBZVpB+uWdf7u1pb1OGKcQ9Vdd
 KRi/ZWBT7DV2lSpUR8rhFgLGSn3oC9ILjvUJu97VAaMZUZMTVITO/CNRN7UR4nEAwip1
 VR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=HxByUNNAYFAx0ERZJMQyIlilAQOl19GTji79GV8tsnI=;
 b=TNRybJtatTcUjYulNfesdRq3qSFzrndpeh5+ishN9NjIIz0lMcjATljEON2zup+rBh
 C8ELyMneXJodBJCCJvYGYSGuT6SP3GRFWSZ11BvAjQ4caFc1X/v6sjOmP+TUawi33l2b
 8pTeyyqJFVSH2b1fS6UuJBUQOBUctaQDlMS8mysO4gxch/bvYcqiNNkxMpH/dHbu7teQ
 jevDlp4xiwiBntUJjgjmq891ma2X8KV5yHLM4pQRITFyRV7T0SvygFyDN3Sa8jju4kQd
 ExIOFFZIN06eC+3J9ekB2MjQbezDTUlOVAOSfS9K28Ody0zqSUsn2/Cgmob11F8flPhu
 raNA==
X-Gm-Message-State: AOAM530vGQQWHc+Yd1t/A/3qGEenV36gGxSNBdPv2VpnIkAKl4A1cPaW
 Ds5TJ18FaMaPBba2CWkdZzJUQDr7h4IwSDML/azyf3eoPIw=
X-Google-Smtp-Source: ABdhPJxKQgZdkrDlCpDst3eGSBd6eTrPlt59pc3u5cEVgxL/BLVV64wbmeqo3Aq1Wub/dQ98TCNHjNTo4AH+X+cWVqg=
X-Received: by 2002:a17:906:cf81:: with SMTP id
 um1mr13381476ejb.122.1608505791131; 
 Sun, 20 Dec 2020 15:09:51 -0800 (PST)
MIME-Version: 1.0
From: Ronan Lucio <ronanlucio@gmail.com>
Date: Mon, 21 Dec 2020 12:09:40 +1300
Message-ID: <CAF-5T9FDVTqPGsS=FcMMyWy2W6O1w7ShdhEEsGUAaQ+fnTMnVg@mail.gmail.com>
Subject: Best practices for adding hosts
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

Hi,

I have a wireguard VPN server, and it's working gracefully, thanks for that.
I'd like to ask you how can I add more peers without having to restart wg.

So far I use to add new peers to the "wg0.conf" file and execute a
"systemctl restart wg-quick@wg0".
The problem is all peers go down when I do it, and there's no
"systemctl reload" option.

If possible, I'd like to keep all configs on config files, so it's
possible to automate configuration via ansible.

Thanks,
Ronan
