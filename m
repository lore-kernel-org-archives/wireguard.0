Return-Path: <SRS0=jj7n=4S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB1EC3F2CE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  1 Mar 2020 07:07:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3608320866
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  1 Mar 2020 07:07:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ax3ldmEB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3608320866
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27219fef;
	Sun, 1 Mar 2020 07:03:18 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2beb637e
 for <wireguard@lists.zx2c4.com>; Sun, 1 Mar 2020 07:03:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b0d9242
 for <wireguard@lists.zx2c4.com>; Sun, 1 Mar 2020 07:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=Up4bGNC+8jmD
 HlsdOOC8NAM8AUI=; b=ax3ldmEBv5TqjbM/givM6En9hmmBam/qjq2T+q+z0Peg
 9uUYdS9R/GfwYiVt5WbOYJlE38zG3D5j3EsjxLIqjZ1w153gSdwcUgYaec4/MzdV
 5qQ3kIxpLT7SGaAU7l9Qfz6tXwSb2mYdIjOYOYdrCpZqUha+rt6QsspsDsxFKbmY
 oha0BOOy0rTcb0ATEIAdI0vCjhcTao5Hl/MWli4N1W5xVeU/my+ME5Klw2rWJvm+
 F5EXCk3Okf0eudViBd4LM8hxjnD1+b2HC8KedPP/OWWCrCzohwSV9veWWMFh+LKY
 +FAJGBl6AeQrRnIfOGfAHrc6Ik8eG+ZwJaN6pcWCBA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f0fe9338
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 1 Mar 2020 07:03:16 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id q128so50253iof.9
 for <wireguard@lists.zx2c4.com>; Sat, 29 Feb 2020 23:07:23 -0800 (PST)
X-Gm-Message-State: APjAAAVx4jiTl58+gUUiUpa4wbKPscokCfhPay/M8vvBXTLhkb0+VbSH
 fCZDMbUKj6Nwh5Z69ZqwixMRqN+o0dc0rV2bGWc=
X-Google-Smtp-Source: APXvYqzfIpl2d6as8ZGWrzN80mrKE9Qf/n73z8dt8R/A7qze0mF0mmNd8sUoYax1372pqaEI7xMmRIye01tAd/G5Q6I=
X-Received: by 2002:a02:7f4a:: with SMTP id r71mr9599390jac.95.1583046443258; 
 Sat, 29 Feb 2020 23:07:23 -0800 (PST)
MIME-Version: 1.0
References: <CANcmUPE9PPfniYa5ejj180Wncth7i3qS0A-ZaG06X4bwkRn5qQ@mail.gmail.com>
 <CAHmME9raXy8gjJ44MHso1WjU_QFz1_Z8Q12q2GauoBPGJSaSxg@mail.gmail.com>
 <CANcmUPEyCiw694-aa32fbLJ5LTd-fMp0D7NtgteqRvLasfmNZQ@mail.gmail.com>
 <CANcmUPEcc4TbeSi85nQbG86-nO4mrRE=xCHcid=K8H=UESGVDA@mail.gmail.com>
In-Reply-To: <CANcmUPEcc4TbeSi85nQbG86-nO4mrRE=xCHcid=K8H=UESGVDA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 1 Mar 2020 15:07:10 +0800
X-Gmail-Original-Message-ID: <CAHmME9r6Tvc55m1YpX+rdXtx-RO32UgPRTJy4Y76j9E3U2CGeg@mail.gmail.com>
Message-ID: <CAHmME9r6Tvc55m1YpX+rdXtx-RO32UgPRTJy4Y76j9E3U2CGeg@mail.gmail.com>
Subject: Re: Cortex-m support
To: Jonathan Beri <jmberi@gmail.com>, Mathias <mathias@hall-andersen.dk>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Sun, Mar 1, 2020 at 6:20 AM Jonathan Beri <jmberi@gmail.com> wrote:
>
> Hi all,
>
> I'm interested in revisiting the idea of Wireguard on embedded systems. It looks like cross platform implementations have gotten very mature in the past two years. Is it anymore feasible to implement WG in an OS-less ("freestanding") environment where something like a TUN interface doesn't exist? Take one such environment, an RTOS, and the popular open source https://www.zephyrproject.org/. It has a full networking implementation but apps typically use BSD sockets (https://docs.zephyrproject.org/latest/reference/networking/sockets.html) or PPP (https://docs.zephyrproject.org/latest/reference/networking/ppp.html) and network management (https://docs.zephyrproject.org/latest/reference/networking/net_mgmt.html) directly. Also, these implementations are very optimized as they typically run on tiny MCUs (~100 Mhz, 256kb ram.)
>
> I'd be curious to hear y'all's thoughts!
>

It's likely our rust implementation well be well-suited for what you
have in mind.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
