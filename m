Return-Path: <SRS0=TBPu=IH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832D0C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 15:13:03 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93E7064D90
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 15:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93E7064D90
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 617761fa;
	Tue, 9 Mar 2021 15:09:38 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 22134175
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Mar 2021 15:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615302568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AkSRcU7lF4mG/hbkkDsOiwuk4I3VlTVqf18qDjwLuvA=;
 b=ZHjUdOx/uBOT6SBnqs33Hz6eefywq0ktc4uE2xswBnu0Z2V4jQSWku9aUoO5qY7nQ/9Rp7
 e2b1Y6psAuZ36RTws2BmKOK2rEf08lp26P7JLbbR6eiz8k/QeAnYLv/38H0tBxabCHToTo
 1SuFRQj7CEcB1Le0O2iup9RUHXIhuik=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f305e79b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Mar 2021 15:09:27 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id 133so14292009ybd.5
 for <wireguard@lists.zx2c4.com>; Tue, 09 Mar 2021 07:09:27 -0800 (PST)
X-Gm-Message-State: AOAM531Yr9mGLQ/NyFGknY9FplVyj0/0gla6eoDRiZQf64HOHXaG4xay
 GNZcalOe86ku1d1JC6Y/ZW4twxC1YKWut+rlPSg=
X-Google-Smtp-Source: ABdhPJwHpIJDBNIJrA/8oIVrkYv64SWXd8nJYDjmEgfaAwanYWZVYgZi7EmSntPxReyeISwCeag5VC3VZ4gR5FqCwsQ=
X-Received: by 2002:a25:2d1f:: with SMTP id t31mr43197933ybt.239.1615302567511; 
 Tue, 09 Mar 2021 07:09:27 -0800 (PST)
MIME-Version: 1.0
References: <038632B3-A3F3-4FC6-8242-265A42F89F1F@wandera.com>
In-Reply-To: <038632B3-A3F3-4FC6-8242-265A42F89F1F@wandera.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 9 Mar 2021 08:09:16 -0700
X-Gmail-Original-Message-ID: <CAHmME9rakmzN2ndkXchvcRXONjfk4ikJScWCSEYzNR8+1ow03w@mail.gmail.com>
Message-ID: <CAHmME9rakmzN2ndkXchvcRXONjfk4ikJScWCSEYzNR8+1ow03w@mail.gmail.com>
Subject: Re: [PATCH] device: revert pipelining UAPI requests
To: Laura Zelenku <laura.zelenku@wandera.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Mar 9, 2021 at 8:04 AM Laura Zelenku <laura.zelenku@wandera.com> wr=
ote:
>
> Hello devs,
> there is an issue when using wg-quick tool and wg tool bellow from wiregu=
ard-tools repository (version v1.0.20210223). I=E2=80=99m running: wg-quick=
 up operation with config file in /etc/wireguard/ directory. Get operations=
 are ok. Processed without a problem. But for Set operation the processing =
will stuck on "buffered.ReadString('\n=E2=80=99)=E2=80=9D (in the second ru=
n of for loop cycle, after set command is processed in first for loop cycle=
) because bufio.Scanner will read everything from the socket.

I'm unable to reproduce this issue. Can you send a small shell script
that does so?

> Please revert till proper fix is ready.

How hard can a proper fix be? Can't we just commit the actual fix instead?

Jason
