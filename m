Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2D6C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 17 Jun 2022 16:13:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 73cd0583;
	Fri, 17 Jun 2022 16:13:39 +0000 (UTC)
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [2001:4860:4864:20::36])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id adc3f178
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Jun 2022 16:13:37 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-fe32122311so6117465fac.7
 for <wireguard@lists.zx2c4.com>; Fri, 17 Jun 2022 09:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=7Pi7KJ0l/MERkI0GZ1EuIlPj0CQqyPNL0jXnjjuK+88=;
 b=WXXGjSpecN/FT6gkzdZPxqET0xkhI+QjzGoJcxdHt2AdLbQAftYI+NyiLVAgxTB+ZR
 GvHWkxRYMRu/TkzgXcq9wDK1CH/GvEVbBRW6RT1vKFPRuvskzhTPZUwappQcygdDLmmm
 xT5qe4vC59HBWgvXh7upnrQBsg4Hau93i44CF9dkcBsS7uXB/8s2lr0KZlqjYHcd/wPq
 3BycUVeKn6xZTN70IHOOMFw89IaJQcqdR3lerwT8ueSvMVriSz6dVs78c4+InROFka8x
 /kAUJeLfXj4jjbyyd1D8P4JiAnaFEqSI0hopNiQzFViyFRYs1sJ7hB45nEoTG7ajBVoe
 5Mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=7Pi7KJ0l/MERkI0GZ1EuIlPj0CQqyPNL0jXnjjuK+88=;
 b=WXsFkhqZ2MyC0K6AzaIInU237Bp3oLW/G4cHFquTKlSa7yPk16UkHIbGND82p7lr2w
 r9PFv5TW4b876vf4yu9/yUnVOjwrf+v3G6hBQvS6C7K6Xf8r9atqSdp1sUs7AgkoqOgC
 VardqKVS458iYxBXxaLjkV61R/zZF1vx6eDLw77vc/3ca2kOnd3I7l6o742tt6EEFMLL
 WgugM6v27kRa88rNMGN9qDs4KwK9014fSHTCHTirm1nCWfo6R3kaa2JwvaOzXhxwyRe5
 M9IqMOh69syb0fPpWYMooYXf8QIazocs+94SL88CdI3Q4j3MEEysyFlm7Njmjc5kEXZl
 yNDA==
X-Gm-Message-State: AJIora8NwQxvqy+kjV7U75v7e7kjVBjA5fvx1QY6WBkoNnUumexbddfM
 Sdz8GR98DxS8wrKPbR2HZWy2Vztl1AekkCiPUQoCW7ugUKw=
X-Google-Smtp-Source: AGRyM1tlDGcPem8otVfakXym1tUKbHZFChzMaB04uU4erIJj0hgjhPM8fATeUyCbpocFq/ok8hXiwT6WUhpwVwIJESA=
X-Received: by 2002:a05:6870:ac27:b0:101:a6aa:ba21 with SMTP id
 kw39-20020a056870ac2700b00101a6aaba21mr2323641oab.223.1655482416030; Fri, 17
 Jun 2022 09:13:36 -0700 (PDT)
MIME-Version: 1.0
From: Tom Yan <tom.ty89@gmail.com>
Date: Sat, 18 Jun 2022 00:13:25 +0800
Message-ID: <CAGnHSEmuBdNSXLjWxoakyO4PVgXQ9YF6R0WZgMEQD-Nv2=y4Hw@mail.gmail.com>
Subject: Regarding the firewall rules added by wg-quick (on Linux)
To: wireguard <wireguard@lists.zx2c4.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Hi all

I have a few doubts on the firewall rules added by wg-quick.

First of all, is there a reason that the fwmark-restoring rule is
unconditional? Shouldn't it consist of a connmark match (like the
fwmark-saving rule does on the fwmark)?

The next one is, what is the remaining rule intended to prevent
exactly? From the commit message the purpose seems to be "bogus
injected packets". I mean, was that referring to the fact that Linux
does not have a strong address/interface binding concept, that
normally / by default you can reach a host using IP assigned on any of
its interfaces, regardless of whether the interface is the one
connecting it the source host? And if so, is there wireguard-specific
security implication in it that has led to the introduction of the
rule?

Although I'm not entirely clear on its purpose yet, allow me to also
suggest in this email that perhaps we can use something like this
instead for nft:

ip daddr $WG_ADDRESS iifname != { "lo", "$WG_INTERFACE" } drop

Alternatively, if it is desired that the rules used for nft and
iptables should be more "coherent" to each other, allow me to also
suggest something like this:

-d $WG_ADDRESS ! -i lo -m addrtype ! --dst-type LOCAL --limit-iface-in -j DROP

which should be equivalent, AFAICT, to this in nft:

ip daddr $WG_ADDRESS iifname != "lo" fib daddr . iif type != local drop

Although it's very unlikely that it can be an issue in reality, it at
least seems to me that --src-type LOCAL does not necessarily imply -i
lo. I mean like while the replies could hardly go back to the
"original" / initiating host, but some host could actually send
packets with a source address that is a LOCAL address of this host,
and I don't suppose ! --src-type LOCAL will help filter those.

Sorry if this is all a bit too much of a "niche".

Regards,
Tom
