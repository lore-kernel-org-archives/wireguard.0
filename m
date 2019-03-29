Return-Path: <SRS0=Yiz6=SI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C6DC282DC
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 11:56:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9139E2173C
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 11:56:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=poczta.onet.pl header.i=@poczta.onet.pl header.b="NPZ6b6aN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9139E2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poczta.onet.pl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61124b10;
	Sat, 6 Apr 2019 11:54:22 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 621538e4
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Mar 2019 14:35:07 +0000 (UTC)
Received: from smtpo31.poczta.onet.pl (smtpo45.poczta.onet.pl
 [213.180.142.176])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d021d755
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Mar 2019 14:35:07 +0000 (UTC)
Received: from [192.168.4.198] (ekg125.neoplus.adsl.tpnet.pl [83.21.174.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 (Authenticated sender: namiltd@poczta.onet.pl)
 by smtp.poczta.onet.pl (Onet) with ESMTPSA id 44W4710RXTz1XS0lD
 for <wireguard@lists.zx2c4.com>; Fri, 29 Mar 2019 15:36:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.onet.pl;
 s=2011; t=1553870189;
 bh=7IkMLx+4KwVEE+poWI7lW6KyWv4tlk3XFnjrx7OH8rY=;
 h=Subject:From:To:References:Date:In-Reply-To:From;
 b=NPZ6b6aNI/xQ9aAjTfKH1fk6jSv0umaLKTyrz6RUyDbJcVnzoZBvP0kTjlTOaK+aP
 enXobRrYdWldZKS8lphE6SONe+yEl3Db4Hoavv0HP6rgA+mwO1l5thY98FZ5PA48qo
 Vy81OedOkUB8u++6xHNyOjcCFzWuL/6p0NI2tTkA=
Subject: Re: [PATCH] centos 6 compatibility
From: =?UTF-8?Q?Mieczys=c5=82aw_Nalewaj?= <namiltd@poczta.onet.pl>
To: wireguard@lists.zx2c4.com
References: <dd1d1bde-dd6b-6f36-e08f-3552ee0686a2@poczta.onet.pl>
 <c3e6e9e7-40c6-def5-df0c-cc9fc0740301@poczta.onet.pl>
Openpgp: preference=signencrypt
Autocrypt: addr=namiltd@poczta.onet.pl; keydata=
 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
Message-ID: <a5e21f8d-da02-c52f-83a8-3a50e1bdaf94@poczta.onet.pl>
Date: Fri, 29 Mar 2019 15:36:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c3e6e9e7-40c6-def5-df0c-cc9fc0740301@poczta.onet.pl>
Content-Type: multipart/mixed; boundary="------------B7D3787D915951597EFCB7DE"
Content-Language: pl
X-ONET_PL-MDA-SEGREGATION: 0
X-Mailman-Approved-At: Sat, 06 Apr 2019 13:54:19 +0200
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

This is a multi-part message in MIME format.
--------------B7D3787D915951597EFCB7DE
Content-Type: multipart/alternative;
 boundary="------------139275C65C9E9C69C79968C0"


--------------139275C65C9E9C69C79968C0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit

New, improved version of patch for WireGuard Centos6 compatibility.

W dniu 2019-03-27 o 15:48, Mieczys³aw Nalewaj pisze:
> Is there any chance to add this code?
>
> W dniu 2019-03-03 o 14:30, namiltd@poczta.onet.pl pisze:
>> ---
>> src/crypto/zinc/blake2s/blake2s.c | 17 +++++++++++++++++
>> src/socket.c                      |  7 +++++++
>> 2 files changed, 24 insertions(+)
>> ....
>>        .ipv6_v6only = true
>
>


--------------139275C65C9E9C69C79968C0
Content-Type: text/html; charset=iso-8859-2
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=ISO-8859-2">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">New, improved version of patch for
      WireGuard Centos6 compatibility.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">W dniu 2019-03-27 o 15:48, Mieczys³aw
      Nalewaj pisze:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c3e6e9e7-40c6-def5-df0c-cc9fc0740301@poczta.onet.pl">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-2">
      <div class="moz-cite-prefix"><span class="tlid-translation
          translation" lang="en"><span title="" class="">Is there any
            chance to add this code?</span></span></div>
      <div class="moz-cite-prefix"><span class="tlid-translation
          translation" lang="en"><span title="" class=""><br>
          </span></span></div>
      <div class="moz-cite-prefix">W dniu 2019-03-03 o 14:30, <a
          class="moz-txt-link-abbreviated"
          href="mailto:namiltd@poczta.onet.pl" moz-do-not-send="true">namiltd@poczta.onet.pl</a>
        pisze:<br>
      </div>
      <blockquote type="cite"
        cite="mid:dd1d1bde-dd6b-6f36-e08f-3552ee0686a2@poczta.onet.pl">---
        <br>
        src/crypto/zinc/blake2s/blake2s.c | 17 +++++++++++++++++ <br>
        src/socket.c                      |  7 +++++++ <br>
        2 files changed, 24 insertions(+) <br>
        ....</blockquote>
    </blockquote>
    <blockquote type="cite"
      cite="mid:c3e6e9e7-40c6-def5-df0c-cc9fc0740301@poczta.onet.pl">
      <blockquote type="cite"
        cite="mid:dd1d1bde-dd6b-6f36-e08f-3552ee0686a2@poczta.onet.pl">
               .ipv6_v6only = true <br>
      </blockquote>
      <p><br>
      </p>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------139275C65C9E9C69C79968C0--

--------------B7D3787D915951597EFCB7DE
Content-Type: text/plain; charset=UTF-8;
 name="wireguard.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="wireguard.diff"

diff -ruN master/src/socket.c master-centos6/src/socket.c
--- master/src/socket.c	2019-03-29 15:10:20.000000000 +0100
+++ master-centos6/src/socket.c	2019-03-29 15:10:31.000000000 +0100
@@ -16,6 +16,9 @@
 #include <linux/inetdevice.h>
 #include <net/udp_tunnel.h>
 #include <net/ipv6.h>
+#define GCC_VERSION (__GNUC__ * 10000 \
+		    + __GNUC_MINOR__ * 100 \
+		    + __GNUC_PATCHLEVEL__)
 
 static int send4(struct wg_device *wg, struct sk_buff *skb,
 		 struct endpoint *endpoint, u8 ds, struct dst_cache *cache)
@@ -363,7 +366,11 @@
 	struct socket *new4 = NULL, *new6 = NULL;
 	struct udp_port_cfg port4 = {
 		.family = AF_INET,
+#if GCC_VERSION == 40407
+		{.local_ip.s_addr = htonl(INADDR_ANY)},
+#else
 		.local_ip.s_addr = htonl(INADDR_ANY),
+#endif
 		.local_udp_port = htons(port),
 		.use_udp_checksums = true
 	};
@@ -371,7 +378,11 @@
 	int retries = 0;
 	struct udp_port_cfg port6 = {
 		.family = AF_INET6,
+#if GCC_VERSION == 40407
+		{.local_ip6 = IN6ADDR_ANY_INIT},
+#else
 		.local_ip6 = IN6ADDR_ANY_INIT,
+#endif
 		.use_udp6_tx_checksums = true,
 		.use_udp6_rx_checksums = true,
 		.ipv6_v6only = true

--------------B7D3787D915951597EFCB7DE
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--------------B7D3787D915951597EFCB7DE--
