Return-Path: <SRS0=+Ywq=PB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E34C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Oct 2021 12:00:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33CB260273
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Oct 2021 12:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33CB260273
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eutampieri.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0263563;
	Wed, 13 Oct 2021 12:00:02 +0000 (UTC)
Received: from mail.eutampieri.eu (mail.eutampieri.eu
 [2001:41d0:701:1100::183])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16263bff
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Oct 2021 11:02:38 +0000 (UTC)
Received: by mail.eutampieri.eu (Postfix, from userid 128)
 id 8FEC13E928; Wed, 13 Oct 2021 13:02:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eutampieri.eu;
 s=mail; t=1634122958;
 bh=wjedUfKh2TKxVLrG7GpkYMlUj99+E2zYVEMS9PnLyog=;
 h=From:Subject:Date:To:From;
 b=NpwiOz3RO98U/ONtYyIAL1J+tyumPf6SyQh5v+mKpCEQPmq6OC07vBu3ObIaB6I+O
 I+jTvwr7RFLdjab/Iq89kyeEghLJnBHpJ/DLspO+c1Oh3RqETgXqsIWKXrDdOXA6Xw
 VupeOh2fa4D/b9GfCCzQy9RlSPGKjP24hgyd3a5w=
Received: from smtpclient.apple (unknown [10.2.14.3])
 by mail.eutampieri.eu (Postfix) with ESMTPSA id DDF7B3E8DA
 for <wireguard@lists.zx2c4.com>; Wed, 13 Oct 2021 13:02:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eutampieri.eu;
 s=mail; t=1634122957;
 bh=wjedUfKh2TKxVLrG7GpkYMlUj99+E2zYVEMS9PnLyog=;
 h=From:Subject:Date:To:From;
 b=ceTBHSnZ1kPoBX4XVitWs/oCuYJqsBKw01/3Gh1Cj0qktFL23Z4p8uTzJaMKurA5+
 7U64LFfVB8khdUWaxN6O/NOCrlOKdfc7niOeDLWZId2HFzLSdi1P/yD4p7xDY5mToE
 XMejy0FRNED1WCc2RA5eRpv8cBHvpo7bGL0qgfyU=
From: Eugenio Tampieri <eugenio@eutampieri.eu>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: wireguard-apple localization
Message-Id: <83B7BA7B-85A0-4461-B4E5-91EA33BBF2C4@eutampieri.eu>
Date: Wed, 13 Oct 2021 13:02:36 +0200
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Mailman-Approved-At: Wed, 13 Oct 2021 12:00:00 +0000
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

I=E2=80=99d like to provide a new set of localized strings in Italian, =
since the current one is quite broken, with a few strings missing and =
others not exactly correct.
I=E2=80=99ve noticed that the repo tries to sync the localized strings =
with an online platform and I was wondering what=E2=80=99s the best way =
to contribute.

Regards,

Eugenio Tampieri=
