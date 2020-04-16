Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F720C55199
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:56:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E74CF21556
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:56:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=davidslab.com header.i=@davidslab.com header.b="IrTOKL2Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E74CF21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=davidslab.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 849182eb;
	Fri, 24 Apr 2020 20:38:11 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a0d99a7a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Apr 2020 15:16:13 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id gr25so1563134ejb.10
 for <wireguard@lists.zx2c4.com>; Thu, 16 Apr 2020 08:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=davidslab.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=wwGv5gfjLDxyVCXEW08nhZgUhXOgCAba99CA2w6HCJE=;
 b=IrTOKL2Q/ebb3p0ZraC7boPy/7WzG5DZGnrAOxXKqgU5KVYCuggMoAKXyjl3sTZJod
 DtkeUOAE5zxFlxKpHEw4M8qmBoSk/uVcNwO8qSYTE1BYNf7osWq8yH6jnKU1JUaPAJUq
 +JML6IpPxSaJ1ZmUa0ODhEnDuFAfoOSUUYA7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wwGv5gfjLDxyVCXEW08nhZgUhXOgCAba99CA2w6HCJE=;
 b=SF5w9sbtGIe5ifrouV+Me6vSjuOFLbB6YRaC+7z5e/r9e7kR46W+wwop7kg6Tq3BJO
 NFW+GzxXHGJmgbky5hLiu1Wc4nVZ/Ojqttgr27+Kr5x+yXmGyfv47Gp020KA1pGym/gm
 2SaeGyNaUDYHUXeM0Cdsyyn0JoTRWvNUYcD9hE/b96RR/PXsMLFDW01WJBZdECl/093g
 ntWelI+JdZ3huzU2EDygTgHaeNime7Ws6p2NG9+oJMZXVlwUAvKppE8JMevNPqA78cpO
 UPleTLtXUlxiedjqqiL1k+5kYgH93lR08quA6gS/D1qXqLs+VLAHdvlAEd4Hgdt7QEx/
 f/JA==
X-Gm-Message-State: AGi0PuaDA1nSKmsbKytYAdL6jjlQPgX+gUrpe+iStA5VnvD8NJNLFeIM
 z010KCeb6Eu3WmHrBmev4o0Y2yLCV6cI7EpXVF5B0Zjd8/h//w==
X-Google-Smtp-Source: APiQypJr5DSgBtAqB5czjnaKnGiOjKkaRPwcTVFwmmyQQvOeh3YOQluD4vNFq9kQJSkqz0bw/FfCKz+ZdflAN7CLIKE=
X-Received: by 2002:a17:906:2296:: with SMTP id
 p22mr10067974eja.269.1587050778063; 
 Thu, 16 Apr 2020 08:26:18 -0700 (PDT)
MIME-Version: 1.0
From: David Leung <david@davidslab.com>
Date: Thu, 16 Apr 2020 23:26:07 +0800
Message-ID: <CACfAimOGRV7atBGjwGzDc=tgaNZYpzPjscGygLFBR=TYojJ3DQ@mail.gmail.com>
Subject: Netlink API returns wrong attribute ID for peers on Ubuntu 19.10
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 24 Apr 2020 22:38:10 +0200
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

I've been using the Netlink Generic API to get a WireGuard device's
peer endpoints successfully on NixOS.

When I run the same program on Ubuntu 19.10 (running wireguard version
v1.0.20200206), the peers attribute returned is 32776 instead of 8.
This doesn't match what's defined in
https://git.zx2c4.com/wireguard-tools/tree/contrib/embeddable-wg-library/wireguard.c.

I wonder if it's caused by a decoding mistake on my end, or if there's
something strange happening with the Ubuntu package.


Best,
David
