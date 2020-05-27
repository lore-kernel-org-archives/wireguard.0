Return-Path: <SRS0=KoV/=7J=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18254C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 May 2020 09:01:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DFD4207E8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 May 2020 09:01:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcRfHsF4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DFD4207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67d0ed70;
	Wed, 27 May 2020 08:46:16 +0000 (UTC)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [2607:f8b0:4864:20::12a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 99b8bb62
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 May 2020 08:46:13 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id a18so5981365ilp.7
 for <wireguard@lists.zx2c4.com>; Wed, 27 May 2020 02:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NP3QSti9V22/14XO99+S9oZa6kfhOzekR9oam6dejKE=;
 b=LcRfHsF4qscfuJ5fyMKfkvLbvV6VQauAR6QiwHXl6oefFCKBzOvLUC5jNBeW4aU7o1
 pnzZg8J6lLdqdh/h4UOMwevkzDTH/FbdgnSVYRT81BfdRutKYIxTKPv+lXc9AyNoVwuE
 pGhp8jZAA4xNwHaSXwAXkhRosZfrCLljz5sEYjMfW6uwaKtmUxxeAOGvDYnPV/P5Uzfd
 tGluuuiKkRc1c1ZqkO8Gb8Wy2qfTRIYjEmECpkp9Ysiy2sDKdemPHNvuL5p3iwVdh5Aq
 uwSNCa6yV666XL3iRJ/J4Lr1kYGCt/dSwCpCKYMaEty7QpbrSoLXBNYAymFu3GCJYwYn
 bfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NP3QSti9V22/14XO99+S9oZa6kfhOzekR9oam6dejKE=;
 b=ai472EPS7ZwCIOHRQOmAfRRRqKGAv8Rk4XX6Bu45Tzh+n66hPLuqM54+Yhvsusi5En
 BLlvZVrfQdHicOYehI/6pC/oiJEjdNb71s/jU+LN+kXYO4reZH2hzemdDOv5XIFgknjd
 lEqcxdsW3Zg8pRQz/vyhlYe5gYSahmTHJ/2nqJ/JL9F8kDphlPkVL3JkCV35Qq2m0Ll2
 Lw+sXOeIiZXD4ctiY6b4+Lhu0nJz1JRvaAsEIKL6cpVXB0WBqjB9YxFoFqgf0C97qPkb
 mj5N4pE9gwRO4m1c+/mI0CVPyc/fb1BbgIhtJuRGdz566wBCAJJSUeUMGq3iw5G1gvft
 s38Q==
X-Gm-Message-State: AOAM532UJ0uOOo/E5rjcVaflY9rAyRc0Eubq4egqeUPLrfdmny5FUXdV
 +VrCySr1Ckbl8rQzI3GDZFLOFTyt6qCHOfY/rVLAqigX
X-Google-Smtp-Source: ABdhPJzvF6WeFYWenThsb1bllTQJPnAo8K+G4uQc0N9sUzYQU9eBYLsz9O88DO3UrWohgYfMQ/s131Nzebt2AQF0344=
X-Received: by 2002:a92:d183:: with SMTP id z3mr5080584ilz.102.1590570094448; 
 Wed, 27 May 2020 02:01:34 -0700 (PDT)
MIME-Version: 1.0
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Wed, 27 May 2020 11:01:18 +0200
Message-ID: <CADdae-huQZkB2yZ1mD8vTt=0K8X81K3A3LYuCnKbF=GQ3x50xg@mail.gmail.com>
Subject: Question about origin of packet relative to peer
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
Using one wireguard Interface, with multiple peer
How can i know that a packet come from peer X ?
Is is possible to mark packet not a level interface (wg0) but at peer level ?
I can dump packet at wg0 but i lost the peer origin.

Thanks,
Nicolas

interface: wg0
  public key: A
  private key: (hidden)
  listening port: 6081

peer: B
  preshared key: (hidden)
  endpoint: ipb
  allowed ips:
  latest handshake: 1 minute, 27 seconds ago
  transfer: 1.61 MiB received, 6.20 MiB sent
  persistent keepalive: every 25 seconds

peer:C
  preshared key: (hidden)
  endpoint: ipc
  allowed ips:
  latest handshake: 1 minute, 38 seconds ago
  transfer: 24.75 KiB received, 309.71 KiB sent
  persistent keepalive: every 25 seconds
