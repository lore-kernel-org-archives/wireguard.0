Return-Path: <SRS0=6TfW=GY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55504C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Jan 2021 13:44:04 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9310B23444
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Jan 2021 13:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9310B23444
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tls.msk.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2685a3f;
	Thu, 21 Jan 2021 13:40:52 +0000 (UTC)
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8fcfa6db
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Jan 2021 10:18:03 +0000 (UTC)
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 307014049D
 for <wireguard@lists.zx2c4.com>; Mon, 18 Jan 2021 13:08:13 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with SMTP id 1B3708D
 for <wireguard@lists.zx2c4.com>; Mon, 18 Jan 2021 13:08:13 +0300 (MSK)
Received: (nullmailer pid 8673 invoked by uid 1000);
 Mon, 18 Jan 2021 10:08:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] make conffile a bit more useful
Date: Mon, 18 Jan 2021 13:08:00 +0300
Message-Id: <20210118100802.8568-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 21 Jan 2021 00:20:04 +0000
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

Hi!  This is my first submission after using wireguard and facing
a few trivial issues which makes using it a bit more clumsy than
necessary.

Following are 2 simple patches.

First one makes wg tool to be able to read the keys specified in
the config file as files, not as inline keys. This way we can
specify either
  PrivateKey = 12345=  (inline)
or
  PrivateKey = /etc/wireguard/iface.key  (referring to ext. file)

This is useful because this way whole configuration file becomes
not as much security sensitive as it is now and can be made readable.
This, in turn, is useful when you want to see which key correspond
to which peer, for example, by reading comments in the [Peer] sections
(more about this later).

For now I made the code so it recognizes a filename in PrivateKey
option (and PresharedKey too) by looking at the value - if it
startw with slash and does not "look" like a base64 string it
is treated as a filename. An alternative is to use a separarte
options, such as PrivateKeyFile and PresharedKeyFile.


The second change is the most useful for me. It allows to use a
wg-quick config file by the wg tool directly. This is useful if
one want to quickly reload configuration after a change - this
does not always need to bounce interface. wg will recognize the
configuration commands used by wg-quick and just ignore them.


There's one more thing which I found useful but is currently missing.
It'd be useful if wg can name peers in its output, in addition to
using their (public) keys. Currently when I look at wg output I
see many keys and "allowed IPs", but in order to determine which
peer it is I have to lookup the key in the config file and read
my comments in the corresponding [Peer] section. It'd be nice to
have wg print a Name for the peer automatically. This requies adding
one more command to the config file and to the command line, and
maybe having the interface in the kernel to keep the name together
with the other Peer attributes (this obviously requires changing
the kernel interface), or to have wg to find the Name in the config
file (which it does not know about when invoked without arguments).
I'd go for the kernel option.

Thanks,

/mjt


 config.c |   18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)


