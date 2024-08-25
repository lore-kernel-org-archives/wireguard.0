Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBBCC5321D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2024 08:47:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e71becf7;
	Mon, 26 Aug 2024 08:38:37 +0000 (UTC)
Received: from slategray.cherry.relay.mailchannels.net
 (slategray.cherry.relay.mailchannels.net [23.83.223.169])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d8da2552
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2024 16:50:31 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|03s_mobile@tclish.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 53CAF3657B7;
 Sun, 25 Aug 2024 16:50:29 +0000 (UTC)
Received: from pdx1-sub0-mail-a262.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 0AA913653FF;
 Sun, 25 Aug 2024 16:50:29 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1724604629; a=rsa-sha256;
 cv=none;
 b=aSIMzkcFUQ7yIOatg5qwhN950gDZkGUHk1dPIzg2UXHDO8GR07XrXRE4rF3y5putx4PH8q
 z6DJtpl95lO8hccaxEsPu7/S0Is5U9G4g5WTiyvUfh1qjo3AcMQrQk3Z3KauuUTnj+gwcP
 3emKztFz8ie1D90qOul8akmyfIgWZvz21c7Lllk2qkLwSF+WMcj6SPHMO5+SR0mQMCAq8K
 ifwtYGF7At6Cxui2+M1lX806RMmGqwfpTKkHY4uJl+OEw9kjFLu4Xnl3TFXqB9xx7Fd+w7
 RFEgLvwiL+6t88sjJbxd/eJwCz71dPOKyc8v3KuP/HIe3QBgRwgi8M1VLjgucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1724604629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:dkim-signature;
 bh=U0RVP0GBtQdkAnSuAVCHEe+jnJ/d4HDQhdFNTpJzvZM=;
 b=mYqYPemchnpS2IX1LaLnJNpO42/BABhE7xtqiu/lAfZE1ZHc2ZXqNT207APUBu12Zg8yZ6
 8Tec+9pWtCjLE1dq+pRqn/z4s4fH0djVV/sp9q6NlJRtGgs467+hPRp3OUcyji+lQiZ4n8
 vFpcwWNOWLdv1BHyGshzsoSTU8FUNchKR5YhdCXoAhCt1rcVEux5dv8Imekl9zkHnqaDIo
 xKtU8vcUNrQttaiv2d7xcbxRbGg8DGUbOz1y+1fnzoii5qS6FAzK+3WuqNsNwxfUDf/G5W
 o2+ibn6Oy8L7iv+m4VHdk1H+4qjvWHj6oFHZpJhWVOWLQsfB13hNYEDGxMQ29w==
ARC-Authentication-Results: i=1; rspamd-5549cdcdbf-bgp4w;
 auth=pass smtp.auth=dreamhost smtp.mailfrom=ml+wireguard@03s.net
X-Sender-Id: dreamhost|x-authsender|03s_mobile@tclish.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|03s_mobile@tclish.org
X-MailChannels-Auth-Id: dreamhost
X-Desert-Bored: 59a276a528c2ba7d_1724604629256_1150660354
X-MC-Loop-Signature: 1724604629256:1012206538
X-MC-Ingress-Time: 1724604629256
Received: from pdx1-sub0-mail-a262.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.103.214.147 (trex/7.0.2); Sun, 25 Aug 2024 16:50:29 +0000
Received: from smtpclient.apple (unknown [175.156.81.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: 03s_mobile@tclish.org)
 by pdx1-sub0-mail-a262.dreamhost.com (Postfix) with ESMTPSA id 4WsKYb74HkzHf; 
 Sun, 25 Aug 2024 09:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=03s.net;
 s=dreamhost; t=1724604628;
 bh=pI1cUAai7Pnh6MhIJbIR18LpT0B2dYADeKkCKmzlFO0=;
 h=From:Content-Type:Content-Transfer-Encoding:Date:Subject:To;
 b=CoNsvaQ+cZ3vbjIWNgnksIUlw7BdFz5uUPPjVgY7s1JHN6AzCd2mYh+zy0E5GNowt
 2o0nbuFS+8N7UTs4MzeM0HWUNx5VMjuzb9MNq9E+q/EF3XSk8CfexIUBYIW64JsW8S
 56vLCyVjC4c570LrtIMESqSoenT2PmO5CimBKlOjxrSOEaWhKXW/o0idChu/xY+C5z
 o9b70av2zIVU8QxVENNmokZ9W6hSisu+jLJUhOEyIQzZ9LpevpkQCbILvpkhVoBE0v
 TznnrvAGmQ4B2CyKEX7S1PNtkiW1cLY4dpZg0Az6viPyvpGdNXKcW/US5rxhCJ8QVO
 RpeDGp9Tgdt8w==
From: Adrian Ho <ml+wireguard@03s.net>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Date: Mon, 26 Aug 2024 00:50:14 +0800
Subject: Changed SHA256 of wireguard-go 0.0.20230223 source tarball
Message-Id: <610ED0E6-95D0-4D54-AD9A-8BF0AD8D25E9@03s.net>
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3776.700.51)
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

[Originally posted in IRC, but my Libera Web client seems to have logged =
me out, so apologies if it was already answered there, as I don=E2=80=99t =
see any history.]

Hi! I help out with the Homebrew project, and one of our users just =
alerted us to a SHA256 checksum failure on the above tarball =
(https://git.zx2c4.com/wireguard-go/snapshot/wireguard-go-0.0.20230223.tar=
.xz). The checksum at the time our formula was updated with this release =
was ed3694e808d96720e79e17ae396f89f7c2024da07f3449ff0af8fbc6dbfa7f6a, =
recorded on Thu Feb 23 12:49:17 2023 -0800. The current checksum is =
50029ca43196cc3d925c0f0b98a9fcfd7f6c28465122da90ebe5262398f3b31c, so was =
the tarball regenerated since that time?

Thanks much!

Best Regards,
Adrian

