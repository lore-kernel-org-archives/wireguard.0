Return-Path: <SRS0=ix1r=PO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369FAC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 Oct 2021 09:05:46 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CEFF60D07
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 Oct 2021 09:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CEFF60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17a1a818;
	Tue, 26 Oct 2021 09:05:43 +0000 (UTC)
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [2607:f8b0:4864:20::92d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1e100aef
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Oct 2021 17:17:21 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id k28so19361678uaa.10
 for <wireguard@lists.zx2c4.com>; Mon, 25 Oct 2021 10:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=qFQ/KL37W7zQJf6B9uuwI1gF8Ak1UEaG/+KYAIndAzo=;
 b=oA96+S8+GyjamjxUMI1NucQUYyoqNAAS7LXZbF0dugwE/EY9596Bggo1aWIwbquauO
 iSqxZxIhOnr8g4d8BogyYTVxC3lZmPT9S4qO0cHIIfNS8XTsRCQk9tNcecXRiqRmUzqY
 D7dhX7M0a+ohyxoMDV3jB20v2V4xsMVNIampTPC3qelgMr4hns0Jm+4sMa5YV6DD6auc
 nTnTdliHKUZ0JTlRNP81B83bS8bRoHpIYQKovnl7LefwkeI24BEwGToszeS8jvdhb+19
 8tqE5p5y5WNhGri8On6FRujLgJznNQ0QbGwweH2OmcFp1fptvTlUbgel29fd6+XdSobX
 CzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qFQ/KL37W7zQJf6B9uuwI1gF8Ak1UEaG/+KYAIndAzo=;
 b=eh8LqZ47ZHU1wFmQmkULyZ+qz6m663jq0D3Kkj/M0yIkz4/J0P8EHGcVKvMs/7Rj9t
 u0wJFOTgJJDjbaKorMDYCNuHvYlc3al1vjuD3o7TmodS0/C1lz26FB9+aJTF6vEN1/Db
 pnq3YRH102A4kzFIJuIvFtAprchZo9zVSJLIGKvLtB7e7AoILd0UbKBrEFYgVSOHNgEU
 DLzJ6RQwC0IiH7pmwsu4vdAJ+lT7/4+OsJWMzLjzcUoMDQjY0krgqMy8cK4EjXXzmtCe
 uI3V/iI+37pZveV1am5TpwCgw+3wpzdTMI3EYcvcyRiEqTud+FBDgexUBQtu9E8klQVo
 8nlA==
X-Gm-Message-State: AOAM5322iXruCN6Hc1vnHZaYKoaK8nMjTclzrDGy80HrvE24gEG6zTE9
 UtI3gml2DiNrbwZpjOOIHeUVYD9ITdtb0kpC+A/HGAjLivo=
X-Google-Smtp-Source: ABdhPJwMESjQZ7qKK/52e+EDo2C7ZmvquzTRv2GgfP0bwfdag8/1fiy1wUmmUzWL5YTUXmAwt17X4ZFXQFOTQgpbX8g=
X-Received: by 2002:a9f:3e47:: with SMTP id c7mr16472237uaj.1.1635182239504;
 Mon, 25 Oct 2021 10:17:19 -0700 (PDT)
MIME-Version: 1.0
From: Ryan Roosa <ryanroosa@gmail.com>
Date: Mon, 25 Oct 2021 13:17:09 -0400
Message-ID: <CABOEyuLiu96_KxEH5sdGLaE5-s9e8F_c0a1PKHSnFcMKp5YHow@mail.gmail.com>
Subject: wireguard-freebsd handshaking issue upon underlying WAN
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 26 Oct 2021 09:05:42 +0000
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

Hello,
First off, I want to say thank you for the FreeBSD kernel module work
as it is greatly appreciated by myself and many others running *sense
firewalls :)

Generally wireguard-freebsd (wireguard-kmod 0.0.20210606_1) is running
quite well in my experience however, there is one issue which I have
been able to reproduce consistently: when the underlying WAN
connection that a tunnel is using is disrupted for the span of time
amounting to two missed handshake attempts (~4-5 minutes giving the ~2
minute average of handshake attempts), the tunnel will never handshake
again upon subsequent WAN restoration. This is the case even if one
resets the tunnel with 'wg-quick down ; wg-quick up' or restarts the
underlying OS (tried with both the latest stable versions of pfSense
and OPNSense community). For reference I am using a keep alive value
of 30 seconds in this scenario.

The only thing I've been able to do to get an existing tunnel
configuration handshaking with a peer endpoint again after its
Internet connection has been disrupted (outside of a complete removal
and rebuild) is to arbitrarily change the configured tunnel's
listening port (ex. 51820 to 51821 etc.). Upon saving and application
of the port change, the tunnel then handshakes with the peer endpoint
again immediately.

Given the symptom, it seems there may be some issue surrounding tunnel
handshaking resiliency when the underlying WAN drops out unexpectedly
for an extended period. If there is any way to look into this to
improve upon it so that after a 5+ minute internet outage a tunnel
could resume handshaking on its own without manual intervention, this
would be greatly appreciated.

I've got a 'bandaid' script running every 5 minutes currently which
checks the peer's handshake age and then changes the tunnel listen
port arbitrarily to restore connectivity then changes it back after 5
minutes of successful handshaking but obviously this is less than
ideal. As an additional data point I found if I switched the port and
tried to switch it back before another 5 minutes had passed, it would
stop handshaking again so there seems to be something special around
the 5 minute number regarding handshakes. Not sure if this is helpful
or not but thought I would include it.

Thank you in advance for looking into this and if there is any
additional information I can provide which may be of assistance I
would be happy to provide it.

Cheers,
Ryan Roosa
