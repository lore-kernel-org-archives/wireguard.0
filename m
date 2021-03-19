Return-Path: <SRS0=a6UP=IR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DD9C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 16:58:33 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DC0D61953
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 16:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DC0D61953
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d588e039;
	Fri, 19 Mar 2021 16:49:15 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 30c236d2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 16:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1616172536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uh3kWxwN83Mq4HiHoQ9kmpBX0jVmk/Ld1Cy0AqD0ZBk=;
 b=lmee+1kJ3zHIaMgdBu7Xt7EfVLOsdDWpgcLJIo8RxC1bBSN6kXJwj4dHVaKqaTIUeJZAsB
 ytW8OobOTC4rb4BLRwkpLu24fAy7ZJP6EQjq5cjlV7HDygUzczlGhsc6H3woUADxG/Ck+2
 r3fPZ1EUfcQ7VxY3oUPhWuTKzKcsUQ8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1f2fd8c6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 16:48:55 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id f145so6903430ybg.11
 for <wireguard@lists.zx2c4.com>; Fri, 19 Mar 2021 09:48:55 -0700 (PDT)
X-Gm-Message-State: AOAM532z399cBFWsssPv9lgHiknOx+9CQv+j0iTto2MOCRmbYOSg6n6q
 R0n77KfScl3qwS3vGJQ3dLCy2JQFUENeXpX6qDc=
X-Google-Smtp-Source: ABdhPJwmAUN065XMPvDlnUsJJv7l6DZBXfhl6/gsmjE+Bvo+W4zQDH7m9T6Rs+qv0DuP2uw3MoTqF6ykM639diBwLxY=
X-Received: by 2002:a25:9bc5:: with SMTP id w5mr7807805ybo.279.1616172535610; 
 Fri, 19 Mar 2021 09:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <e1a14dfa-014c-7740-6205-75cd96933dba@lostca.se>
 <CAHmME9ozQjtg-Rpe9RmwKL6HtDHPkxVQ9d_1EfPQFS5=Zjj4BA@mail.gmail.com>
In-Reply-To: <CAHmME9ozQjtg-Rpe9RmwKL6HtDHPkxVQ9d_1EfPQFS5=Zjj4BA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 19 Mar 2021 10:48:44 -0600
X-Gmail-Original-Message-ID: <CAHmME9pnnAY-ugHRbFAVkVukKfgxq3s0iqox4aADGiBWVh7XnA@mail.gmail.com>
Message-ID: <CAHmME9pnnAY-ugHRbFAVkVukKfgxq3s0iqox4aADGiBWVh7XnA@mail.gmail.com>
Subject: Re: Unable to serve TCP connections over wireguard interface on
 FreeBSD 13.0-RC2
To: Ashish <ashish.is@lostca.se>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 19 Mar 2021 16:49:14 +0000
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

Fixed: https://git.zx2c4.com/wireguard-freebsd/commit/?id=bb59a61785322a086dfc437c51e7cbcd918a5241

Thanks for the report.

Jason
