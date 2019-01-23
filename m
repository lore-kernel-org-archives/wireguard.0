Return-Path: <SRS0=u0A/=QA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D603DC282C0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 02:05:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F219218A1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 02:05:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buIyZvVH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F219218A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cb89528;
	Thu, 24 Jan 2019 02:00:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b9cc5e3
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Jan 2019 22:45:21 +0000 (UTC)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c725a30
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Jan 2019 22:45:21 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id s198so1751370pgs.2
 for <wireguard@lists.zx2c4.com>; Wed, 23 Jan 2019 14:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Mo/VTElfLV0EgnP5j2zawBKw4E/lezydXANs5qmsSig=;
 b=buIyZvVHHDvs4OEzM6OgX9rJerEs9bV15ISr7Q4YbPKHNbDzKvVewiNZ24sBFj0gXW
 YKeij8CHbfhDrfKaI7sYM7dqJcUK82n7pmkT08edXM2cpXlL0wqy54oQhvzGHtTGeUO2
 um4NIpHnzrUlmW1cLV+v/OugbNunTKsVgqabtuWfYQMDj6COl5qfC8r4roBbvY1M+GZ5
 Wy3LZwP1lhr6VTZPHmXLYwFn2A8c2xOlyDPuBef1fRa2Tu+/JhvkCJXaZn5eb8ZN/Yg7
 z0ZQZN6m99nVlT71y9OE1So3ykK829tyGH4xxYdGpv0pq2Io14vGVI7ayzf/ul3LE0MO
 pXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Mo/VTElfLV0EgnP5j2zawBKw4E/lezydXANs5qmsSig=;
 b=MCfqCOb8SAK5TCFx4qaEwln2TjqNG4M7AMruVy9Ewvh8Nt/aX+0T+q3HFeor2seTeD
 u8j5Ww0Yvcs+NION/IreUJNdNyIpTU/EPeFCocp4CEm2N1yLwWpUU/ToiUT/SsYh3lhP
 niiSOJVYBr4ivF6Z5PJwH9xZXjW0P6OhPQoXkflgDvvhpsgaieFWi+xfvLNsXqbzryFq
 0mzlNYOj/581yvzwkxIq3sV97n6rNkxriVbXUqwUnRmRM5KHTXgGfMcFYfdsBtuuWmRJ
 NTFncIV9SkJgH6Ft2i+j2AUQ5OupyxWwEXUkaPrlhh4xGgnntUIr7kpAfpHjMDhOcEnX
 LYMA==
X-Gm-Message-State: AJcUukciLokokZepaHDrjWm2BhKA+Kd0XBqz0WPONarsO1sl22BjME+/
 N4MWZlFP7mYKwIaEiq0XFrcaG4HC6l3E+3QPFvtrAq76
X-Google-Smtp-Source: ALg8bN6uLn6GgofjhFYQks3MQU+r/Sl+IG1TkE/M+D6Fl2zGECaT3tX78TJcfw4Br2MqvrB1TBBIO/PtlDQ4QB6lmIk=
X-Received: by 2002:a63:dc0c:: with SMTP id s12mr3772443pgg.398.1548283828493; 
 Wed, 23 Jan 2019 14:50:28 -0800 (PST)
MIME-Version: 1.0
From: Yegor Ievlev <koops1997@gmail.com>
Date: Thu, 24 Jan 2019 01:48:59 +0300
Message-ID: <CAMwURuCj4O2rik1kWeA22x7ovHxfGNTEyk_aNsTwc9yYbihvbw@mail.gmail.com>
Subject: WireGuard obfuscation using shadowsocks
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Thu, 24 Jan 2019 03:00:11 +0100
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

Recently there was discussion about obfuscation to avoid restrictive
firewalls. The conclusion apparently was that WG devs should add
support for pluggable transports. This is a good idea, but for now you
can just use shadowsocks-libev:

On server:

ss-server -s 0.0.0.0 -s ::0 -p 443 -k shadowsocks-password -m
aes-128-gcm -U # change to lowercase u if you want to be able to
connect to the server over TCP too.

On client:

ss-tunnel -s shadowsocks-server -p 443 -l 51820 -L
wireguard-server:51820 -k shadowsocks-password -m aes-128-gcm -U

Connect WireGuard to 127.0.0.1:51820. Done.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
