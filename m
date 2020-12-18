Return-Path: <SRS0=qzPy=FX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22659C3526C
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 00:27:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9844723BA9
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 00:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9844723BA9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db132a63;
	Sat, 19 Dec 2020 00:18:26 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0a083390
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Dec 2020 23:37:04 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id jx16so5586497ejb.10
 for <wireguard@lists.zx2c4.com>; Fri, 18 Dec 2020 15:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Q6J/Zd/VGrWT9cVrE7voWvxmwFELi+G089T/Hivh8GI=;
 b=r5kgEUE6+OH6300CzePBU6DjJMy3Pr0C2xeO4sfvHcTGu+WhWgOo2v7m8/BqfoD9+f
 gIRgksrODr3EFIxqkc8ndDgj4a6+CbCcb7dMgSGQPKuoq2xl14HAi4KEiherxU3dqNJc
 goaG7a+w9OC/C6LXwhcEgInL2BE5/rpOrN5bwDO02Oz05qa2OKnz+iZ1LPrmIxP89b+c
 fsX0bBSpbPEZsb70e7cG1fub+kWc6/TxsczJcCwc6IchdlGwZyr5Q72bxRqF8WfDFXEL
 zdyJLbOy8H8iF7zQxlFCsUl5KoOS9qkJbRyDGOQejxSHqijHl5/Upa3b/z96HQGtpc0q
 5EGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Q6J/Zd/VGrWT9cVrE7voWvxmwFELi+G089T/Hivh8GI=;
 b=LQ/WePGiOtudDKnnE+El7KLxhyIs8Htzl2PQ70yrQIPTNyN8fpExaQwsahEdQAbphX
 1LdAy80tG6Je4cKcrikde4E/jjYDmayIF73v2LGFQ5vQyoZAmaRmoB0s1Lg11msib5kZ
 X1RmN91iA1/DqpKJtOb8cdbK+4iVy6XBx4GMnhfRBydWUQs8AkW4cUu1S0aLJ8hJPo/i
 J0IkfTzORD9iF7c1PlHM5S7ffq8qll+gUPFnNo6x811KlBrw9O4REQr+nBS6E7SSt/Z3
 tpfdZl3XnqMhhXZ3FBXn3py1XRBxFMNxQOdAVPXVVHdecBoA343SdwEQAOA3JFOOSLO9
 4pnw==
X-Gm-Message-State: AOAM5302ocwrMCcW3Zc/FQtodLIgapkMXQ78Of91+hHYwjz4ZK0Y8RBb
 BBOMcHctdq0F3bz77Qq4MGVZzCi9T9feT+dBLq7ZJCL1jcU=
X-Google-Smtp-Source: ABdhPJy0GNMR2K8W7c9usbCMyhAU6j2+d3+/O9bV+R0padDcr0k+9AdjuniOxg3451V5MmZU3desLca/9MCgQ9dmV5Y=
X-Received: by 2002:a17:906:3a98:: with SMTP id
 y24mr6145780ejd.436.1608335145053; 
 Fri, 18 Dec 2020 15:45:45 -0800 (PST)
MIME-Version: 1.0
From: Ronan Lucio <ronanlucio@gmail.com>
Date: Sat, 19 Dec 2020 12:45:34 +1300
Message-ID: <CAF-5T9H9wiZZ7qT_r5PYhj0q6cHogdjXQx38PDQ3QXXm3SftJg@mail.gmail.com>
Subject: Default route on windows
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 19 Dec 2020 01:18:24 +0100
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
Is that possible to set the default route to egress through the VPN on
Windows machines?

Thank you,
