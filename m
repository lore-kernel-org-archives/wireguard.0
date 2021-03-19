Return-Path: <SRS0=a6UP=IR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC220C433C1
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 19:37:43 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A3036197D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 19:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A3036197D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21bebddf;
	Fri, 19 Mar 2021 19:37:41 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1a1799f5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 19:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1616182651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=03dMFi941QRFfLWLjbFhtnnRbwmbmcIieS434J2jBsY=;
 b=RRuNLijKzFqoflrwTPRs86IXaRhZvgdzmxvJQicMSpNVvGH4W6KeT2F+cI4eMbwb6PIMvO
 1J0JkRK3LPSCfbiemZIvXHx71OuYSN6me7OE/ase2ywRygiQNdyc5YzTga/kUpH+Aac1uE
 owG2D5/ssqWjFxOgMJXBcSe4M8tXdo4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ccc23ff7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 19:37:30 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id c131so7433234ybf.7
 for <wireguard@lists.zx2c4.com>; Fri, 19 Mar 2021 12:37:30 -0700 (PDT)
X-Gm-Message-State: AOAM530/kWQl6Ko0dFGel6pAlKSj+MBKOHHxsZRlgGLzwji8amuUGQb/
 yYg1mWnjtQFo8znFQGB/fj42g24rj4sGhoNC9nU=
X-Google-Smtp-Source: ABdhPJzf7kMsQqkHSXUMRKOQKfZgPuJhGrYd2suUzXdXAUhQB5Xy1V8gFTTGJ5rZXLO6MHSF+Fk2hPc/Q2lSZGfUf7c=
X-Received: by 2002:a25:8c2:: with SMTP id 185mr8993317ybi.20.1616182650523;
 Fri, 19 Mar 2021 12:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <201245f5d3e86a58@lists.zx2c4.com>
In-Reply-To: <201245f5d3e86a58@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 19 Mar 2021 13:37:19 -0600
X-Gmail-Original-Message-ID: <CAHmME9o+2507x9ExtzSyP93GiaSMqkd4co3yCmqOkJ_Zp4+kfw@mail.gmail.com>
Message-ID: <CAHmME9o+2507x9ExtzSyP93GiaSMqkd4co3yCmqOkJ_Zp4+kfw@mail.gmail.com>
Subject: Re: [ANNOUNCE] wireguard-freebsd snapshot v0.0.20210319 is available
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 19 Mar 2021 19:37:40 +0000
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

Good news! This is now in ports as net/wireguard-kmod. That means it
should eventually be built into a package too:

    # pkg install wireguard-kmod
