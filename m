Return-Path: <SRS0=a6UP=IR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FDCC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 16:48:56 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB69261949
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 16:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB69261949
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5318ad9;
	Fri, 19 Mar 2021 16:48:55 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 295e9ba9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 16:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1616170550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wDYavgGsKH2BxyEMIHnfG4cRKF19WPWxXDyUfj7m/vs=;
 b=YMyD5hGZf5M7CN+40JshXdv/1bP1znnUrTUtDVDrpn7oAUqkc0zBaZZ435IO1js1IVnCm2
 A6Rjv23/JD049tKnNZq4Mx3NoCYSd/yYAe/QCHZSQTjGu7wWVQMf4i/KXOlNlsYtMrXV9/
 iBu+qp8kYNG5kjgU5P7ZiSTV9R6tcmg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 67d4ac3e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 16:15:50 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id y133so6789316ybe.12
 for <wireguard@lists.zx2c4.com>; Fri, 19 Mar 2021 09:15:50 -0700 (PDT)
X-Gm-Message-State: AOAM532RGkxU0L2rMvtvf3ryPbI3+veMIGjkzWaexQ5wFd4K9bSNqGXx
 s3GUl/8XDgDGSkpgJCz/cyR3ucUumCMaZ+67w18=
X-Google-Smtp-Source: ABdhPJxJO+4yxjcCclL6xzp0PW0bNJ8q2hkEuXfphaEiokGWEoxW7aNiUS0HbHksTyvMiBqExfeEy3jklUFNvGQ7udo=
X-Received: by 2002:a25:9bc5:: with SMTP id w5mr7607529ybo.279.1616170550166; 
 Fri, 19 Mar 2021 09:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <e1a14dfa-014c-7740-6205-75cd96933dba@lostca.se>
In-Reply-To: <e1a14dfa-014c-7740-6205-75cd96933dba@lostca.se>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 19 Mar 2021 10:15:39 -0600
X-Gmail-Original-Message-ID: <CAHmME9ozQjtg-Rpe9RmwKL6HtDHPkxVQ9d_1EfPQFS5=Zjj4BA@mail.gmail.com>
Message-ID: <CAHmME9ozQjtg-Rpe9RmwKL6HtDHPkxVQ9d_1EfPQFS5=Zjj4BA@mail.gmail.com>
Subject: Re: Unable to serve TCP connections over wireguard interface on
 FreeBSD 13.0-RC2
To: Ashish <ashish.is@lostca.se>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 19 Mar 2021 16:48:51 +0000
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

Hi Ashish,

On Fri, Mar 19, 2021 at 8:06 AM Ashish <ashish.is@lostca.se> wrote:
> I'm running if_wg kernel module (git revision: 5ef4d3efa691e71) on
> FreeBSD 13.0-RC2.
>
> With 172.18.10.1 being my local host's wireguard interface's IP address,
> I can receive SYN packets, but it does not seem to send any
> corresponding SYN/ACK.

Huh, that's curious. I'll look into it and play around. One
peculiarity I noticed in this thing is that it calls the ip_input
function directly, which other drivers don't seem to do.

Regards,
Jason
