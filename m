Return-Path: <SRS0=iDgY=II=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900BFC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Mar 2021 13:37:45 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E23E64FE8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Mar 2021 13:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E23E64FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id adb4d250;
	Wed, 10 Mar 2021 13:37:30 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 09b02f76
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Mar 2021 13:37:29 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id q14so25621002ljp.4
 for <wireguard@lists.zx2c4.com>; Wed, 10 Mar 2021 05:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=RtKqW2Q6RG46reMA5DNaHJcraOb/Y7VmKBtKopMLUq4=;
 b=O3HSY1HWGi7Q74rfCLfH02NcqqMh5EwC7wR7x+9VrxnphRMq8KLb99fAqHXdgSpMYj
 BOBIp7cfTyDeHazZx97mIXW/zluLXUY/KsqACnobdAW+VWFRfFH1brtvJkOPh8meFT/o
 D80xJwVCRjIt8I2p1iVcxE99xexKq74lyHjzmSm/drjl8lQ+KLsuWYChBI4Z3At9DVHO
 8X2omYkyBe9yztY7QN4KTw3cS6rOjB/4XVhqTT2txF1Bi/cvGx0o3JACLtIE0yIdyCxc
 BQUORADbUIzDTPoXI27c4xuJy8RWSK/F0hU5VXdI4LNLPL382WPj/TQ2jDiyru+t2arn
 k/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RtKqW2Q6RG46reMA5DNaHJcraOb/Y7VmKBtKopMLUq4=;
 b=qQjtye7KugUsTyuZFsPgM5oE4/sxv6okOcbp0XgcBomFZKUJuUQGyGNYa3qih0PPsr
 8cc55y2BOXWgwdeiBMaTPS4IVUbyoSQdZYlOT1fuIHXYGVZS/VVlnavL3s2ugCySs7z9
 5zzGLbq7i5sIfCDYL1oR/jUuIPKDDnzTJkKRh0YkkFM3VLAh35K5FsGM2J+U2zJ3PPJB
 kYe0Gse7RMZXaCfSP/8Ycr0WqsKlyiPs7GgQ9XvZie+ztoFD9uZKbnmLTVzmYTW9ShV3
 0D6RtwrFGZMC8q3JBeEN9ihwgHu8Hd6lI8IH7Xck8AHCCRmSTasqVJ25dxJaxfeF34jG
 kdnQ==
X-Gm-Message-State: AOAM5322VpuyJI+pIuocN8YO3W5PeQ8jSQaCTIFHLrAwEo1+TcQmLij8
 S+rd5drUcekmCz10wE+yqsFWmjkMOgL4u8nBcs3uQUUlhPA=
X-Google-Smtp-Source: ABdhPJy9NkcqKmq6hMmK/fKdC/ROzkKoMsJLwCWDllaqL8QqoKPM65Cv7Ql19hYx8BFnxI9YajvTtWgXAy63dGSNdvo=
X-Received: by 2002:a2e:7505:: with SMTP id q5mr1901179ljc.322.1615383448532; 
 Wed, 10 Mar 2021 05:37:28 -0800 (PST)
MIME-Version: 1.0
From: kay <kay.diam@gmail.com>
Date: Wed, 10 Mar 2021 14:36:52 +0100
Message-ID: <CANaOhea6dQ6Y5A22B4dO2VEYbk4754rGEi=hw4vfMgvaBo1CAA@mail.gmail.com>
Subject: Windows: wintun MTU is not set
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

Hi Everyone,

I noticed that the desired MTU is not set on the wintun interface.

I tried to set MTU after I create an interface:

        interfaces, err := winipcfg.GetIPInterfaceTable(windows.AF_UNSPEC)
        if err != nil {
                return err
        }
        for _, iface := range interfaces {
                if iface.InterfaceLUID == luid {
                        log.Printf("Iface: %+#v", iface)
                        iface.NLMTU = 1302
                        err = iface.Set()
                        if err != nil {
                                log.Printf("failed to set MTU: %s", err)
                        }
                }
        }

but it fails with "The parameter is incorrect." for AF_INET. Setting
MTU for AF_INET6 works with no issues.

Any idea how I can set MTU without netsh?

Regards,
