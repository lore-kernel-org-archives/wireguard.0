Return-Path: <SRS0=uuIP=E5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A5FC2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 16:42:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BF1020756
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 16:42:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7x91Lg7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BF1020756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ffdd9011;
	Mon, 23 Nov 2020 16:36:58 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ef1a5109
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Nov 2020 15:56:05 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id 7so24037316ejm.0
 for <wireguard@lists.zx2c4.com>; Mon, 23 Nov 2020 08:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=/wLBsUfPnzylCUeXTeVqua05vdkKzdo1+q7sXE17qQY=;
 b=L7x91Lg7paCwsU1qxDghpLUH/JP68FyxeMxnWgVzzy2ZC/5dzggDzvDCL7riF6P2Jx
 VCmZkcTQ9esLDvPzQMifEzvCVUcwCIYZfxm/ECyfolFpW5aF731YCtlNmCCO26wZTemS
 7wiNqa6o+sziw7emiVssGCkHYc/pA7QMx63rfqgiKI9Kt2frWo7ek8qGkkZoH1TwnAKS
 ryPFc2OF4Op8T1Xh7QP5pShjEqoWrwXs3meweEcvePg1/nX2iVpOit0NrWnoPTBEordu
 JhAWyDwim5b/CnNA0zZ9FYw8MueDgTbghBebbIPSnMp/yc2LZO273rB2q48gn+KeI+9s
 dtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=/wLBsUfPnzylCUeXTeVqua05vdkKzdo1+q7sXE17qQY=;
 b=eSnfMjZxUehvh8Fm6F4VxF2hZglVXpDqtYNUomMwXx62uqnTqO2ZbX554s2w0jtXi9
 dtld4aZDN/E8bfx2QrE3v+igjnDROQ9QnR1jZRp/apqEWApwXU2Ll0xI/2eUABFIBHgT
 K/sROnFXfQYr47WRCG1QkbYOZDO46noSDi6C+JzooKBO5pekBvuytCF6flW5LAb2aILA
 dY38VO5E/8snWMX50NZq1itgzw+4CGEEra1Z/sL0E0xSUvrfJpadOu4bp2BvnVLpJId+
 GBZ1Eye2bMJgeT9YP2tORswiJx3K9sR3tbebk924/+kGTRMiPfe5T3NpTFvLMU84cJdw
 MlxQ==
X-Gm-Message-State: AOAM530bxuLGhkaPYg9Vo3n/kI8A41wq3ozvin6WEjcb5J4Cj4Gxun7r
 a76B5UHJIS85+uKvmGQaW/F+QpZ8kptICsli0cJP9zrujgSzKcfz
X-Google-Smtp-Source: ABdhPJxMtf2oMGEqfXk7JKbQt33NW3hKWAkwgLBYX7AP17XgbbZuDiKiEjhIYueCgHl6IUEkoVNFNmfPA+NfXDFo6HQ=
X-Received: by 2002:a17:906:27c2:: with SMTP id
 k2mr244316ejc.211.1606147288216; 
 Mon, 23 Nov 2020 08:01:28 -0800 (PST)
MIME-Version: 1.0
From: Ruben Di Battista <rubendibattista@gmail.com>
Date: Mon, 23 Nov 2020 17:01:16 +0100
Message-ID: <CACnYWReJC+Ff8G+uWLW6i=rsR1w=O-6aDFBG-yd__ZuuRh83CA@mail.gmail.com>
Subject: WSL2 and Wireguard
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 Nov 2020 17:36:55 +0100
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

I'm experiencing a problem with Wireguard and WSL2. If I activate my
tunnel and then I ping a machine on the VPN IP range from WSL2, I
don't get any response.

However, if after activating Wireguard, I ping from cmd or PowerShell,
I successfully get the ping back and I'm able then also to ping from
WSL2.

I'm not sure if this is related to Wireguard or WSL2, In any case I
reported the bug here: https://github.com/microsoft/WSL/issues/5810

Is it a problem of my machine, a problem from WSL2 or Windows Wireguard?

--=20
          _
-.     .=C2=B4  |=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E
  ',  ;    |=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E
    =CB=9C=CB=9C       |=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=
=9E=E2=88=9E=E2=88=9E=E2=88=9E RdB
    ,.,    |=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E
  .'   '.  |=E2=88=9E=E2=88=9E=E2=88=9E=E2=88=9E
-'       `'
https://rdb.is
