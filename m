Return-Path: <SRS0=Q0ZK=WW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C281BC3A5A6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 12:28:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 694C6206B7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 12:28:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R75MP3H5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 694C6206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 118f00e6;
	Mon, 26 Aug 2019 12:28:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5fc6b72d
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 09:40:18 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15760b62
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 09:40:17 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id z3so35805488iog.0
 for <wireguard@lists.zx2c4.com>; Mon, 26 Aug 2019 02:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=g+QCRx+4hx1XzEE1m3pokMr5KR1pj9OzN3x+VpDSBeI=;
 b=R75MP3H5vzX2qYcOfK/thpwWn3gVFQuz2TW+L7hwh8pSuAaZV9d+zUO4+ifKRw6g9X
 9Sa4E0pLrUdpoiBV2fXG1Vs8Bm9Xjcah43r01yWfbgyaSRUiTFFbOIHrZt6xdm9mcBm5
 /sSwjk+t6OIWvT6RkCpO6LXCFTfRtFWUL0+U2CVzheeOYeSP8grKNFZRkwWTPeHd5kuv
 bClg/MGwlrFLtJTciL0WQG3x9ZVPZOskdUIzx9sBgM51O8QEEjZO/kk9zvgFSONQVEkB
 8N7NnnREeJ0zIgLG00ifokKcDfOd5ok7Lnv+eJL/ieLALUPsI8/t6ML954dWcQY8Nm/Q
 mzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=g+QCRx+4hx1XzEE1m3pokMr5KR1pj9OzN3x+VpDSBeI=;
 b=lMhX9eoq0Zwuwd+qEm/IJsZhNBrwrUKu71spjDr4U1YbBTMCHHVo9hkSaXKBAsEBfH
 w0W3Yko7lWpRDHSFelq0tn9hwQCioz3iuFul/BW3EC5QU5fkRJOZ8OQlWXDk5FeXm+Df
 +E9SnkSdCXK89feS12jaUV1K9l0hXdLzyAxM/TnlnPLFUOgCH361WGbKeoIWESI4ZzNL
 U79TyWjNdkoVheLyieyx1+jBaxAnV+lhKDfylf8hId2JRlQ9X7cRDIxhUuDZdi1cuqup
 QM0Bz8A3rZtBDNYBVi9OqYFCsuAS8vhiGFmkhPijrLJFc7xZn4c/gDtns8lP+vEg8DCP
 Sgkg==
X-Gm-Message-State: APjAAAUv/MMIzVWuUSVzIGcBnsV5g79xxoLX94S0vEgdCkb8H6YgXT0A
 1OBUpBQMb+JwQc15RtFuOtfWA2gsiOguSBAO1IeWplgFaXw=
X-Google-Smtp-Source: APXvYqxAb7V+jzok2KzpjYy7eVR+Mndt5lBSjB+XKCqO7gglN/BhWi1rjPArtJxJQ/SqwZProdsTeezSFpNeXwr23Zg=
X-Received: by 2002:a6b:5116:: with SMTP id f22mr14926292iob.108.1566812417100; 
 Mon, 26 Aug 2019 02:40:17 -0700 (PDT)
MIME-Version: 1.0
From: Vasili Pupkin <diggest@gmail.com>
Date: Mon, 26 Aug 2019 12:39:57 +0300
Message-ID: <CANH_QeaA2XfXBHLoyWO7bd+32bs-iqjKiOpUqRh-vZrJ0Nzk1Q@mail.gmail.com>
Subject: Tun interface do not route packets on Windows 7 (extended no-NAT)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-Mailman-Approved-At: Mon, 26 Aug 2019 14:28:33 +0200
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

In my setup I have a client running Win7, the tun interface allows to
make connection from client to server but it only route packets back
for some time and then broke.

The client system is NOT behind the NAT and PersistentKeepalive=25 do
not help, the issue is local and external network route encrypted
packets as expected. Have tested it with wireshark.

I have checked the tun adapter with RawCap tool (wireshark do not let
you monitor tun interface on Win7) and decrypted packets sent by the
server actually generated inside the tun
interface on the client but aren't routed to the process nor processed
any further, they stuck on OSI level 3. If I then ping server from
client the tun interface revives but broke again after like 30 seconds
of silence. The support for Win7 will be dropped later this year but
it is still rather popular OS among users.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
