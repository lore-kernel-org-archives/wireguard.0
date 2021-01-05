Return-Path: <SRS0=XdmQ=GI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D30C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 13:57:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 595E3229C4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 13:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 595E3229C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7c76ae1;
	Tue, 5 Jan 2021 13:45:25 +0000 (UTC)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [2607:f8b0:4864:20::130])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 15976ad8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jan 2021 13:45:23 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id w12so28621357ilm.12
 for <wireguard@lists.zx2c4.com>; Tue, 05 Jan 2021 05:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=MSikxOjkaxmACalJRRw+uU8gYi7hd380ZZ5a831ySG4=;
 b=USzDOlDKh1HKWRjmj8OnKa0YzBQ2i6VSwMx2hKQE5Zx44K4XXmT4iL5DFT2CQtC2FG
 tfdOPNbW2m1cafiVvU3vkCj4GJ9qhM2M6cy5w+M+C/Ywzf6lKhx02VY/pQlQsD/fAl8V
 lNHEcTzzeS2v657+C/1N1wuzO88wwErkz7UHjnLwjJ26wHkxqySK7dqzpneBscORjVWN
 5iZ91JqMnDux7LaDg7NQ86Iq2t4KoxmgQfn8M4kqEOGXCDLfLz0AjW/rRIFlw/K22ENN
 9+ZuMOvf2+OAiyTtbZDWd8MEewaepZKAjOqoCyW5VAs1ItfDNE0TWVi4bi7FW9607pGb
 C2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=MSikxOjkaxmACalJRRw+uU8gYi7hd380ZZ5a831ySG4=;
 b=BZIa2rrmpMozLwl1SF6xO2hxLK9Y2C+KzTUEo0WbL8w/K8nNPAMvvSYHz+96O/bo99
 b8hZsPlpucQcGqcHqUIgqOpPEbGITErHNm9gyc+3NxluLNySvMwY3E6DvK98R8ktRjg8
 aliNLTt5f3LEoug5oShTIQxP+NQ7c09dqafrEzt/qnXoijCwVi9pzxKv3d9mFFBNzKhM
 /qpz+yOp0PMTQWkPc/PZ2w3d5t4CtTX0JxLlcUXQjkkLyB9vycWgeJXW+qZJoX9QHI5d
 fyVOJX4ugPP0njp7LKkCLiFAtUgv5vSn2/HCRDUej/gf+VBjlFmJEMs4mVnql5aKYzWM
 5z9g==
X-Gm-Message-State: AOAM5312gfWot9qWvvaSk76Ra8CHg2t0Q+3/jlvEUV2KybBQ6zsGKqJO
 eWPPrTnWMiyC2/OtVXpeUlPTJ+bybkjPEBkNQouNIlwz
X-Google-Smtp-Source: ABdhPJzBoypjJUSYVstRG9IdSTPlbDDfsZruNnrjyXPZr6dNCMJ/X8zW2ih8EXaN/ii1fKRWGLANFc9oNFuIsOz6YGU=
X-Received: by 2002:a92:9881:: with SMTP id a1mr77304747ill.238.1609854982033; 
 Tue, 05 Jan 2021 05:56:22 -0800 (PST)
MIME-Version: 1.0
References: <a79af0c5-ad54-2b17-964b-9e7891064335@53c70r.de>
 <176cafeade8.27b6.fd5e59abeac6319e4fe4e8192ea7d08d@solidadmin.com>
 <CAHmME9pzOrvHX2bVcHVHh44_j1P_bYaz+o-wCnjnEgxoMeZCyA@mail.gmail.com>
 <CAH8yC8n-fC8MJxR7cA+otkqRyDZwhR7wz2Ni+-YTAgiKz7CRHA@53c70r.de>
 <aca7e86f-0c1b-a2c1-7508-67650c5f8806@53c70r.de>
In-Reply-To: <aca7e86f-0c1b-a2c1-7508-67650c5f8806@53c70r.de>
From: Jeffrey Walton <noloader@gmail.com>
Date: Tue, 5 Jan 2021 08:56:10 -0500
Message-ID: <CAH8yC8kwtW5qMM=vZxLe1VTKwtqy76u4SP8Vtib_nhpdpBWJag@mail.gmail.com>
Subject: Re: Wireguard not available for CentOS Stream
To: Silvan Nagl <mail@53c70r.de>
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
Reply-To: noloader@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Tue, Jan 5, 2021 at 8:06 AM Silvan Nagl <mail@53c70r.de> wrote:
>
> Thank you for this information.
> Since Stream is more or less like a very old Fedora version now I am
> convinced using Fedora Server wont be that bad at all.
>
> Gonna test it soon.

Yeah, I think you'll like it.

I got tired of dicking around with all the breaks and workarounds
caused by Red Hat and CentOS antique software. I also did not feel
comfortable with abandoned kernels.

I don't understand how Red Hat or CentOS can provide a 2.6 or 3.10
kernel in good conscience. Even the kernel folks tell you to use a
modern kernel, because those old kernels get no attention. The new
kernels get the bug fixes and security updates (and include the bug
fixes of the old kernels).

Jeff
