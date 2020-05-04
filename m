Return-Path: <SRS0=IpBN=6S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75696C3A5A9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 19:16:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9C9C206C0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 19:16:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="WX3EdH3R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9C9C206C0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9a4dee7;
	Mon, 4 May 2020 19:03:58 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b40a2a85
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 19:03:57 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1ec4e12
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 19:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:cc:content-type; s=mail; bh=9HI
 uWmHS4S1PzAl14yT9W8y3kqY=; b=WX3EdH3RaSQHZ4gOIkzGE4iMygHUoM5SNbK
 TqyuypaIzZhXNZC3OVL6qpJ7/t7Y1B0I2GEbIbJiP1Q6bPkPbaRZT7YaculmFa3R
 ulZSuRoOUPqzxrJsNbmdk2UuHGrIe7BG3pfv6HZOQfqKUh3lSZHSFxW7bPD84se6
 gatu7pzrGstTqYvJupH5HJ0hvuNZX+UnmP2Lfz4c0difNxqPDn6Yh7xspmFXv0jh
 4TEnMbn3xGbSU95p8uY43CNYrRFRCV9nfR4q3dtJHg0BlCU6mRj5pKCpPFFs6MQ3
 3Vefc0XrffPuPAiHYomlnOdD//OYxYAYt89oCJLu3hg+cqnh/7A==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d398d5a1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 19:03:56 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id y26so669122ioj.2
 for <wireguard@lists.zx2c4.com>; Mon, 04 May 2020 12:16:23 -0700 (PDT)
X-Gm-Message-State: AGi0PuZfIWKsSFgObjEjdJJemGb4jUzsPZZrlupauPv7xD70Joqu9WvR
 bBamlz6fD8VhfhoVF4GNK1jOzE6pkIe12lgV4mU=
X-Google-Smtp-Source: APiQypJEZfesQCEzpoBcfiRGIb+DmyBsCtFfcBlspmRNhD97XPuuchK73kr7lqeGVS6vukRSQ6AlwcqIJFTLc1E8ers=
X-Received: by 2002:a5e:9401:: with SMTP id q1mr16252271ioj.80.1588619782537; 
 Mon, 04 May 2020 12:16:22 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 4 May 2020 13:16:11 -0600
X-Gmail-Original-Message-ID: <CAHmME9oWPDuR4OAeHH7Fcau26bLKA0grVgbEzTQ3pF96AzUjqg@mail.gmail.com>
Message-ID: <CAHmME9oWPDuR4OAeHH7Fcau26bLKA0grVgbEzTQ3pF96AzUjqg@mail.gmail.com>
Subject: [ANNOUNCE] WireGuard for Ubiquiti devices/EdgeOS has returned
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Pascal Vorwerk <info@fossores.de>, Nils Andreas Svee <me@lochnair.net>, 
 Aleksandrs Fomins <alex.fomins@ui.com>, Feng Lin <feng.lin@ui.com>
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi all,

After a period of darkness, our builds of WireGuard for EdgeOS and
Ubiquiti devices have returned, thanks to Pascal Vorwerk stepping up
to takeover maintenance and CI. We've also moved this from Nils'
personal github account into the WireGuard organization. You can get
started here:

https://github.com/WireGuard/wireguard-vyatta-ubnt/blob/master/README.md
https://github.com/WireGuard/wireguard-vyatta-ubnt/releases
https://www.wireguard.com/install/#edgeos-module-tools

We also expect and hope that Ubiquiti will be shipping WireGuard
built-in in the mid-term future, which will be an exciting
development. Until then, here's how to get things running. The .deb
available on that site should have full Vyatta integration, which
hopefully will provide some basis for Ubiquiti's own integration work.

Please direct any questions toward Pascal, as he'll be maintaining this.

Enjoy,
Jason
