Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF97C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:45:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 037AB20678
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:45:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mawalabs.de header.i=@mawalabs.de header.b="UwG3Qapn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 037AB20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mawalabs.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3aa4b19;
	Wed, 27 Nov 2019 09:45:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ca0d00d
 for <wireguard@lists.zx2c4.com>; Tue, 1 Oct 2019 14:53:45 +0000 (UTC)
Received: from mail.mawalabs.de (mail.mawalabs.de [159.69.1.106])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05a90d00
 for <wireguard@lists.zx2c4.com>; Tue, 1 Oct 2019 14:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 martin@mawalabs.de)
 by mail.mawalabs.de (Postcow) with ESMTPSA id DDFBD40A83
 for <wireguard@lists.zx2c4.com>; Tue,  1 Oct 2019 16:53:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mawalabs.de; s=dkim;
 t=1569941624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
 bh=jIcCqKh+sgfJJdmt0hqaE35q+pz5iJwnbA9Rmm8lCLY=;
 b=UwG3QapnF1yOiPb3LMj1FDBeEtz5Qf/I9NM694MfYLsqnzol4ghO8nH39NOpNl+ZglE7v7
 lXhpcug/A470moSNPb2nqmptxs8JSR777BaaEqs/YWVh+8EMHDEw1+Br7WrPGDa6L+Stcx
 JufFt/YZO+z0alOmVth4yUWB0m0w7cE=
To: wireguard@lists.zx2c4.com
From: Martin Wagner <martin@mawalabs.de>
Subject: Wireguard using wrong source IP and confusing NAT devices
Autocrypt: addr=martin@mawalabs.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <66e5ad26-e518-384c-e723-cd78e61625e8@mawalabs.de>
Date: Tue, 1 Oct 2019 16:53:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Language: en-US
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=mawalabs.de;
 s=dkim; t=1569941624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
 bh=jIcCqKh+sgfJJdmt0hqaE35q+pz5iJwnbA9Rmm8lCLY=;
 b=WTQoS2tRi9GmW60hsjZbc7Oo5mPWll6NTCM/Dj0tkH/UtrYxRLEWAraXXNdbCizHGDmcqJ
 j0ixIUpNuwP8TynEIW9aoCgc4pGimnGdFLd9t6B0C3YztdQdlXArMXk6w7d2KJpUHWuXA/
 wJQj4cUFTpVgIE90vyQYYBGQ8xHbDuU=
ARC-Seal: i=1; s=dkim; d=mawalabs.de; t=1569941624; a=rsa-sha256; cv=none;
 b=tOLZmJY8eV1D4ELyzWLMjjl9aHmQ/lrhOK7PIkytlSSgpyhZNGbrX68ZnqbYKFJ+2i0PY7
 XYO0QPopj5+jIYue0pNQfeXVWvp6bumVOdZLOLKFH6pY2qHcS69ntPDTyrvudPaVy3ICEr
 JBn8DUd6Rp9jtPFhyMWPcUc5KZh/sZ8=
ARC-Authentication-Results: i=1; mail.mawalabs.de;
 auth=pass smtp.mailfrom=martin@mawalabs.de
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:45:52 +0100
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
Content-Type: multipart/mixed; boundary="===============2743278028900922022=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============2743278028900922022==
Content-Type: multipart/alternative;
 boundary="------------B51F5AE01CFFECC0EAF91802"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B51F5AE01CFFECC0EAF91802
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

One of my servers has two IPv4 addresses. When I try to connect to the
one that isn't configured as default route wireguard is still responding
on the other IP which is causing my NAT to drop the response. If I
change the Endpoint= in the client config to the default ip of the
server everything works fine.

Is this the expected behavior?

Traffic captured on the server:

    1 0.000000000 client_ip → server_ip_1  WireGuard 190 Handshake
Initiation, sender=0xF493E197
    2 0.000693930  server_ip_2 → client_ip WireGuard 134 Handshake
Response, sender=0x5A3B09B6, receiver=0xF493E197
    3 5.119191567 client_ip → server_ip_1  WireGuard 190 Handshake
Initiation, sender=0x4064907A
    4 5.119838133  server_ip_2 → client_ip WireGuard 134 Handshake
Response, sender=0xCAB5E13D, receiver=0x4064907A

Traffic captured on the client:

    1 0.000000000   nat_ip → server_ip_1  WireGuard 176 Handshake
Initiation, sender=0xBC6FCC0F
    2 5.116674624   nat_ip → server_ip_1  WireGuard 176 Handshake
Initiation, sender=0x87E999EA



--------------B51F5AE01CFFECC0EAF91802
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>
    </p>
    <div class="moz-text-plain" wrap="true" style="font-family:
      -moz-fixed; font-size: 12px;" lang="x-unicode">
      <pre class="moz-quote-pre" wrap="">One of my servers has two IPv4 addresses. When I try to connect to the
one that isn't configured as default route wireguard is still responding
on the other IP which is causing my NAT to drop the response. If I
change the Endpoint= in the client config to the default ip of the
server everything works fine.

Is this the expected behavior?

Traffic captured on the server:

    1 0.000000000 client_ip → server_ip_1  WireGuard 190 Handshake
Initiation, sender=0xF493E197
    2 0.000693930  server_ip_2 → client_ip WireGuard 134 Handshake
Response, sender=0x5A3B09B6, receiver=0xF493E197
    3 5.119191567 client_ip → server_ip_1  WireGuard 190 Handshake
Initiation, sender=0x4064907A
    4 5.119838133  server_ip_2 → client_ip WireGuard 134 Handshake
Response, sender=0xCAB5E13D, receiver=0x4064907A

Traffic captured on the client:

    1 0.000000000   nat_ip → server_ip_1  WireGuard 176 Handshake
Initiation, sender=0xBC6FCC0F
    2 5.116674624   nat_ip → server_ip_1  WireGuard 176 Handshake
Initiation, sender=0x87E999EA


</pre>
    </div>
  </body>
</html>

--------------B51F5AE01CFFECC0EAF91802--

--===============2743278028900922022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2743278028900922022==--
