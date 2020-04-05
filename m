Return-Path: <SRS0=i4ZG=5W=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334BDC2BA18
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 05:09:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 815732074F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 05:09:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4Nwa1WX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 815732074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id edf86f87;
	Mon, 6 Apr 2020 05:00:34 +0000 (UTC)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [2607:f8b0:4864:20::52b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 96be62d0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Apr 2020 21:44:41 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id o26so6561706pgc.12
 for <wireguard@lists.zx2c4.com>; Sun, 05 Apr 2020 14:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=56oLn8dP3ESUkN3LyBcaZPqB+O95GFZx/sYBBZcxgDI=;
 b=S4Nwa1WXfQwddUVkgijCJiY5cqm3k5iAwY0Zp6hnegDXBe3AEvdWIB5opEyGJo+em0
 D6XBkihHvGAMayg1YSHy5vS6KqmlvUp42sQbCB4RDZ1TPUqGQZzpDNUhva7sPQnXjfH+
 Fll8sE9oeiQTYVAzGpqsEArkrITQ6ipuEUlyOOxZY7eL8SJ3osRwZrYOfJf/bQ1/4z8r
 IZ8QmMc6WJ4BVHhAONHBUNeYcrB3kUvJDCBrADLa/AYEt18ZJq701ZeN+e+rU3dLKKw8
 lmk5MAVIILMLHEFUIcLlN6mink1OOH/wGjJ7BaL8VZbWjo8I/TjTXrlf9K8j3VGvUUNC
 O1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=56oLn8dP3ESUkN3LyBcaZPqB+O95GFZx/sYBBZcxgDI=;
 b=dQuT2wNEFFRY66wLj8qnriR9IsIxTuQ8W8CQk7/UYYttOyW8lfPDxrjgYWg2uoHOBx
 8TyjwljB8tdl8DR5tj96GM3NWZg7TnODVTXLpp61rGwG21DfvEtwklqHXOMa/B1PQS/r
 8UZCaphVljB43f+rSZ/H1+wiB2TJMYc8HFFXWM5sI7etrl1tdM+HXojq46uovPP08oJX
 hjtKogX3B/mShZ74tCTeFjiywFyQh2EHgxngTeHaWJWHd+yA6meZBJUEQe1127cW7918
 2szTOkw9PvsRNSD3U9SG+IwEelkYObBZfdN/wItPChvfVnmz7+mh1DQyHQmfjAjXD/0t
 ajYw==
X-Gm-Message-State: AGi0PubS8JlfvmSv2mgmm4YK74XsWlx1YnmCemcLQ+rCtpxC2M91dOUN
 ABXiaqQ/8FXAh1Po+BRlYC+wC59f9kYfDFl6qRGt1/x4
X-Google-Smtp-Source: APiQypKAHGIRhhBTRJmRpv9S0V3aiXx/a2JcVjbZRGacOowWctstFL43O+wT3TM1FjWEAt7KKErahDKv0mx2Z3HUaAQ=
X-Received: by 2002:a63:e607:: with SMTP id g7mr18159783pgh.303.1586123603690; 
 Sun, 05 Apr 2020 14:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <adeb013d-5881-e113-b865-599a3c572fa5@frhoelzlwimmer.de>
In-Reply-To: <adeb013d-5881-e113-b865-599a3c572fa5@frhoelzlwimmer.de>
From: Mo Balaa <buddybalaa@gmail.com>
Date: Sun, 5 Apr 2020 16:53:12 -0500
Message-ID: <CAKmhVkpOVaZcenbTZKSM-2xKJDoF1u8s4OK=nZMVJzjfNu0UcQ@mail.gmail.com>
Subject: Re: More advanced user configuration like SSH?
To: =?UTF-8?B?Ri4gSMO2bHpsd2ltbWVy?= <git.ich@frhoelzlwimmer.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 06 Apr 2020 07:00:32 +0200
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
Reply-To: buddybalaa@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

You could deliver WireGuard configuration to peers via a ssh invocation;

Something like:

ssh user@host register_peer peerName
---
endpoint: 192.168.0.1:18521
ip_assignment: 192.168.1.2

Then just parse the YAML locally to configure the users interface.




On Sun, Apr 5, 2020 at 4:48 PM F. H=C3=B6lzlwimmer <git.ich@frhoelzlwimmer.=
de> wrote:
>
> Dear all,
>
>
> I would like to allow all of my colleagues to set up a wireguard VPN to
> our servers.
> We are managing our users (+ their SSH keys) via FreeIPA.
> Is there a possibility to integrate Wireguard and FreeIPA authentication?
>
> --------
> In my dreams, wireguard could be used just like SSH:
> "wg-quick user@wgserver.com"
> with SSH-keys read from e.g. "~/authorized_peers" or some authentication
> service.
>
>
> Best regards,
> Florian H=C3=B6lzlwimmer
>
