Return-Path: <SRS0=vIw3=43=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA30C10F25
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Mar 2020 01:37:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E87C20637
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Mar 2020 01:37:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="TLPpmqax"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E87C20637
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b13ec8e;
	Tue, 10 Mar 2020 01:31:31 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6797ab32
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Mar 2020 01:31:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ecf2e75
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Mar 2020 01:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=MQYksWaDY+7+kSK5bT6IdYSNE14=; b=TLPpmq
 axNf6vFKEZy/tt/Fsnc1lMfN2Fp/gfGNG87nb40r6rNK0CKSf8ZmHpRzJkZe7D5k
 A4xQ+UHm5QwKmZpnZjoiN1B+9ArE1LpBrIr/rWskO5jjyKgkuF8bBztVNPUyZ0lD
 +I8vBFMBJ/VR4+y8ssZvkW7Fk7BYQL9IYPfwroKrStQaj2MtLnkUqaAKoQRDWZ7n
 zokZxVckePnYN4+g/IBtRqFngQm9O/KjNe3nhqdXTHmtMOxpVoaWjg4ts9IRaUNB
 gURaF6XW6zVt1zQGtSGSFoX3vRqDQOgmp/CxRUDMEhI6WIpOoNZp7VY0hBdUF4w7
 nKeETG75/Twkwz0g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c3cb163c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Mar 2020 01:31:29 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id v3so5130809iom.13
 for <wireguard@lists.zx2c4.com>; Mon, 09 Mar 2020 18:36:44 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0fNUmJPSXIbM9Bl4DCCwtc38Pp9VvfxxFUgT3oc43LZWHWKlQk
 81MjETF/0Y2PZY/qKTnF4D2sdOl0KjsBhWa+fqQ=
X-Google-Smtp-Source: ADFU+vuK6lsMtJ2E0oXISK4fDYNlgk+48G49bnIgquy1SH+xXBF1X/7JMmw1A3xH6shQY/MURy2x0AKqNmrkn756FGM=
X-Received: by 2002:a5d:9805:: with SMTP id a5mr15377321iol.80.1583804204348; 
 Mon, 09 Mar 2020 18:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAEW+QQ6L1vLsunSOOJ910WQdHHNe_F4-tV3AwFpijtyrjgJRUg@mail.gmail.com>
In-Reply-To: <CAEW+QQ6L1vLsunSOOJ910WQdHHNe_F4-tV3AwFpijtyrjgJRUg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 9 Mar 2020 19:36:32 -0600
X-Gmail-Original-Message-ID: <CAHmME9rrFXQLDiufnG+OxW_JZY8soQD5R7RO901vJ2Y94TMDAg@mail.gmail.com>
Message-ID: <CAHmME9rrFXQLDiufnG+OxW_JZY8soQD5R7RO901vJ2Y94TMDAg@mail.gmail.com>
Subject: Re: wireguard-android Kotlin
To: Patrick Fitzgerald <paddyfitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Harsh Shandilya <msfjarvis@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, Mar 9, 2020 at 7:34 PM Patrick Fitzgerald <paddyfitz@gmail.com> wrote:
>
> Hi,
> I've noticed the wireguard-android repo is written in Java.
>
> Has there been much thought put into converting it to Kotlin?
>
> There's an unofficial version of the Android client in Kotlin:
>
> https://github.com/wlaotou/wireguard-kt
>
> Would be glad to help out with the migration to Kotlin.

That repo is a fork of a very old version of Viserion, Harsh's
experiments with Kotlin. Harsh is now working on porting that over to
wireguard-android, which was recently modularized and some Kotlin has
already been introduced. We're trying to take care of ui/ first.

Happy to have all the help we can get. Perhaps poke us on #wireguard
on Freenode and we can talk.
