Return-Path: <SRS0=vG4s=HV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1603C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Feb 2021 08:02:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9EB364EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Feb 2021 08:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9EB364EB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b857cb7f;
	Fri, 19 Feb 2021 07:59:13 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [2607:f8b0:4864:20::134])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f43e5810
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Feb 2021 07:59:10 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id o7so3838020ils.2
 for <wireguard@lists.zx2c4.com>; Thu, 18 Feb 2021 23:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=V5gv4TYOTvQviHqCpOIzxNG2BNF3gqFJSRZ7oepJrFw=;
 b=lhxfcLCH1rVsf53dMnQNymEEd5jFX/grozFHK1rUnbEbXeVYb5ygJP2msuY57FsqmO
 YzqOr3ZC8VKVaIvN7SLBTpSGhvg97i/95LKhPUVjJ324ip2FhrkPtIA2xHSH5//EuBIg
 WnTxmHvUOeVclvQUuOSgbrnUqtCrz9Asv18r9uYRaWh6FMki5t5uWUOwHmpkbEdR54nX
 O0q5O7YQ8wSWdjAh3yYJt9GzsGXFypRqRuaHGNryGgCd3VGlIjvAtC6z+vOJ2e0idA0+
 WqMY+oeby3siyUnSl9vRLpzmSDpuxFgj0IYeGHCZ9ngMPBL6K95SAQOy04p0la097Wwg
 vmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=V5gv4TYOTvQviHqCpOIzxNG2BNF3gqFJSRZ7oepJrFw=;
 b=RDyvdoWzjpAQqjU8E6XSkc/FKdA8wqO3MV2W7KOug80QlyxS45/0Qio7tMBeiWeYWB
 UcCGkjW7S5LbY10WHEf0fLEtwx4/KVobs8rSuLL5kQKdW//VrVai21gRVf7p9+Ezbm0e
 uj21anGDbzAc+3tUX/M90mGoHY/4xwLqxKNr8yEC6nqmI7RZZB6Ev15SyxUY91Z3JrOf
 wbVy6CcjyBrKfcFvkH1bh5tTWLiaDXDkEwK8dRCs1W67nsQSG5udL2nZjXD33Z+qIPxo
 SELuiyttulufTj3YLy2zr+dVlDcCkwICrqnouMJokvDnLWW64a4yGTPFRBDSnZkIh9xJ
 wUTw==
X-Gm-Message-State: AOAM532RSbyW/dBRrqLVaDwWEjnVQ4B15rkdKZ7qs9IjsBwyImBGwJVg
 7gLRMV+1GMxlT+ebHF2rgZfIrxDfGOR5lWAb/A1C4z7O3ZY=
X-Google-Smtp-Source: ABdhPJyS+QcEGaClByYCLP/OqqM6gsiOeNAMNpmhZT9mtauey+2RBvb0elwpv9htiS0Lhe3hQwKBTAtVuh4RqwkJ4Qo=
X-Received: by 2002:a92:6b0f:: with SMTP id g15mr3153270ilc.144.1613721549242; 
 Thu, 18 Feb 2021 23:59:09 -0800 (PST)
MIME-Version: 1.0
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Fri, 19 Feb 2021 08:58:53 +0100
Message-ID: <CADdae-jn684uFbFPgkWY47TsmOAnTfzLq7dVGrBxv8Vv8Gcg-Q@mail.gmail.com>
Subject: ipv6 multicast peer ?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hello,
On a "server side" I've for example these peers, and i want to send a
ipv6 multicast group
ff02::1
How can I do that with peer / allowed-ips routing ?

Regards
Nicolas

interface: wg0
  public key: **************
  private key: (hidden)
  listening port: 6081

peer: ************
  preshared key: (hidden)
  endpoint: x.x.130.134:6081
  allowed ips: fd00:0:222d:0:f64d:30ff:fe6e:222d/128
  latest handshake: 52 seconds ago
  transfer: 56.96 MiB received, 1.96 GiB sent

peer: **********
  preshared key: (hidden)
  endpoint: x.x.x.x:6081
  allowed ips: fd00::8e2:97ff:fe2e:3/128,
fd00:0:2836:0:1e69:7aff:fe01:2836/128,
fd00:0:3340:0:a00:27ff:fe5a:3340/128
  latest handshake: 1 minute, 54 seconds ago
  transfer: 513.17 MiB received, 6.27 GiB sent
  persistent keepalive: every 25 seconds

peer: *****
  preshared key: (hidden)
  endpoint: x.x.x.x:6081
  allowed ips: fd00::/32, fd00::8e2:97ff:fe2e:0/112,
fd00::8e2:97ff:fe2e:eeee/128
  latest handshake: 1 minute, 59 seconds ago
  transfer: 2.70 MiB received, 6.69 MiB sent
  persistent keepalive: every 25 seconds

peer: **************
  preshared key: (hidden)
  endpoint: x.x.100.142:6081
  allowed ips: fd00:0:ec58:0:b26e:bfff:fe1e:2d5a/128
  latest handshake: 2 minutes, 5 seconds ago
  transfer: 195.00 MiB received, 2.19 GiB sent
