Return-Path: <SRS0=evAC=JE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94B0C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Apr 2021 06:31:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95975613A9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Apr 2021 06:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95975613A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc580a5c;
	Wed, 7 Apr 2021 06:31:45 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7131ceea
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Apr 2021 06:31:44 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id d12so26642298lfv.11
 for <wireguard@lists.zx2c4.com>; Tue, 06 Apr 2021 23:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tyftpCBihtYVKz1YYpCXLBpojDyjKdBQGdGR5VAklU4=;
 b=GB1tm2nLWBKWqwPLA9JvmfpqcZxMrfNu9Molpr3eku6kU/VadlvCkZ5k2wrqX8z/7u
 hVQ8VNMPRfsGVToiAIf/AwyPUxRE6ok2ny+plgaco1IVjcTujR60TrGldF6HA+3qfU0I
 zpzSCDCQpIY/iHRxTzdZLtuSCpDAFK7WhIrBrfOt+/TkEBt77C3YO/Qi+ZW9Qmd/RANF
 7GG/pwg+f3oOWOMyUZQSN7stolVW7ekjUfS56RnEG9jf9IUo7fVF4W2/mMAFMG8i0JTX
 zFSq9xVLKvf65kkpEWPSf1aX93RJvD9/ql64kC1jppdlfSKrU8mNxGJ3Ipk+ViB179PB
 fgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tyftpCBihtYVKz1YYpCXLBpojDyjKdBQGdGR5VAklU4=;
 b=arMyaT5WBqSn3i06ZPrahp4/3FnE9EVVaNT7nmkNh4e5aSre0Lw9WrUBm+62IWlzwA
 tEMUFxJXSpzSczMVUlBmgzoym/3cpDAwYF9HiGkq7EGNR6X3Eu4VXZGjbpgrF5QFr97C
 g/z4c+fY80KvbrpOjUY7fNx4OISXzBrWgF3eS4M3yAYbHaNWJtGCPcf+cL0FTN1AE9wH
 IIpcdlfZBFjH60ONEY/J23LKu8t2FIf6IDlZp0+wbVHPxqSxQ994dKOqMupyQM4w6f/P
 KUt4vpq9kFH1oP1gk2dkVDdg0rlZ1RgbA6A99OMH8vAk2V3XlpGyP7MtI0rh39PLEygi
 I88w==
X-Gm-Message-State: AOAM532a6K/quaY5POCjcy0SiBicx+jY4dOLhK6K8IO1tr4pdiWysfVL
 0wFLJafU2C9JeJNPUQj9srwMz1I6TrHomhNBaP0=
X-Google-Smtp-Source: ABdhPJx4ga+FhgdRadHYk5cy74DQjXePhW+yE81SV6DJWaIOuPni4OHprbigi2uHLR7Zf7ZCqarCJx2FStHJvkTj82M=
X-Received: by 2002:a05:6512:1084:: with SMTP id
 j4mr1438429lfg.194.1617777103775; 
 Tue, 06 Apr 2021 23:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <CANaOheZKnxp98ERbCP-jptVtjuDDSc-ZqmWmAnX-vU=SM8D2LQ@mail.gmail.com>
 <a34b4bf4a6910e7438351eee360a421e6d15aa79.camel@infradead.org>
In-Reply-To: <a34b4bf4a6910e7438351eee360a421e6d15aa79.camel@infradead.org>
From: kay <kay.diam@gmail.com>
Date: Wed, 7 Apr 2021 08:31:08 +0200
Message-ID: <CANaOheawQLTSWejhEC20FwVKPyE62DpRCvVB-Bun2y2hMC49Cw@mail.gmail.com>
Subject: Re: A go package for a fine-grained tunnels configuration
To: David Woodhouse <dwmw2@infradead.org>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

You can create a dedicated executable if you wish. Currently I use it
only as a package for certain projects.

On Tue, Apr 6, 2021 at 11:51 AM David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Sun, 2021-03-14 at 18:05 +0100, kay wrote:
> > Hi Everyone,
> >
> > I'm developing a package for the fine-grained tunnel configuration in
> > different OS's, e.g. IP address, routes, DNSsettings.
> >
> > It already supports Windows, Linux and FreeBSD (+macOS with an os.Exec
> > dependency to run networksetup for DNS configuration, need help for a
> > native support without os.Exec).
> >
> > I hope you can find it useful and contribute to improving it.
> >
> > https://github.com/kayrus/tuncfg
>
> That looks interesting. Is there any chance it could be used with
> OpenConnect in place of a vpnc-script? It would be invoked as a
> separate executable with the address, routing, DNS information in
> environment variables.
>
> There may be some accumulated platform knowledge in the canonical
> vpnc-script at http://git.infradead.org/users/dwmw2/vpnc-scripts.git/
> that would be useful in tuncfg too?
>
>
