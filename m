Return-Path: <SRS0=WmTa=NI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1410C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Aug 2021 21:07:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F32F960FE6
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Aug 2021 21:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F32F960FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22ac9535;
	Tue, 17 Aug 2021 21:05:18 +0000 (UTC)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 50bfea62
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Aug 2021 22:19:44 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so1169503pje.0
 for <wireguard@lists.zx2c4.com>; Mon, 16 Aug 2021 15:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=yhjSILqe2I4caF6woLjzMIcY0HxDmcvgz1rOe8xKt/Y=;
 b=YSOeH00CVEgUBmG8jaNLtu1ZGmugSmT1edXbeHswUUSkjxNcdmx2ClMtDD5VYlmJLQ
 gru66/1+uenzEftKnp0D4+DzRe8VJg3ph35eocUiBrE6rQQPzxAqS/Z9A7vfJXFo1nbY
 OFIqd8zKE1QUfqjW8nNxuVoZX9ixX1wgdexubjgsdztIlMBmjefUT/3ougI3djlPPUHn
 CyWZ+3XuKvynptp8uc9sI/hMHmNHmuRe91Twj8Js8jcKsQykjCCfEqM7+YUCJs/SSfHe
 qVcOrWmr2jITSLwYS4xR9GeBvST7/2YWZM5r+gK4tFieHqxXaxamobjSK8vJnE979oog
 DFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yhjSILqe2I4caF6woLjzMIcY0HxDmcvgz1rOe8xKt/Y=;
 b=VMSLuMpIwdKAsBquRVj61IkgVUJuWc+S+a1KVtfWPNIjmVup3lUzu+GHfrfvKlDt6H
 bvyL/zN/oDMJE8VtFbr3eiaZpgcfX4cPQkmBecpKWMuz8huhTNNKVcFxDhapN03l8ibq
 X30LKWtvZtDLsw/E8hI/zkQS/XIfQFcpAU9Rb8GfTHDw3FCPSfpWUalDK6UJFv0paA11
 8KnqEH3qFIL7Weqyy4/zaugvL08wptb4wlaoJ3zjAwjovKS0cbYSKGlSOD6XZuNR0EIH
 82UJ8w7Qe/yFvPBjY93ciOyugNZkYPVSpjkYZ6j58hZqJo2B2aR88iGkDlzdtZLNdlCv
 SQRQ==
X-Gm-Message-State: AOAM531Nmgv0Wk9FavWwv8qMUq6rNnHoDxYefxZ6Psa0ivgDtQvBdaQ6
 42OsFE0kapkYnN94os4CSAvVaTBx0u0b1WIU3T8mLuH0urE=
X-Google-Smtp-Source: ABdhPJxIQsGqeM8Y+eS8NDLJ6oXghQkoOZ7SHOaGQXNEcmio4ibvfuYBtdVJius8brx8N5UjwpN8fVO7zjU9EYjb62s=
X-Received: by 2002:a17:902:7209:b0:12d:b9c8:3949 with SMTP id
 ba9-20020a170902720900b0012db9c83949mr185626plb.74.1629152382478; Mon, 16 Aug
 2021 15:19:42 -0700 (PDT)
MIME-Version: 1.0
From: Waishon <waishon009@gmail.com>
Date: Tue, 17 Aug 2021 00:19:31 +0200
Message-ID: <CANO0tfaBiU3r+bvBp5q57EBc4FNu0+FJ78_7G=vPzdJvuTi18g@mail.gmail.com>
Subject: Domain as endpoint when using wireguard with network namespaces
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 17 Aug 2021 21:05:16 +0000
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

Hey there,

I'm currently trying to setup a wireguard-tunnel inside a
network-namespace as descriped in the documentation, which fails when
using a domain as endpoint:
https://www.wireguard.com/netns/

First I've created the wireguard interface inside the birth-namespace
of the host using "ip link add wg0 type wireguard". Then I moved the
wg0 interface to the newly created network namespace, which doesn't
have any network interfaces and network connections beside the
loopback interface.

Then I configured the wg0 interface inside the network namespace using
    wg set "INTERFACE_NAME" \
        private-key <SECRET \
        peer "PEER" \
        endpoint vpn.example.com:51820 \
        persistent-keepalive 25 \
        allowed-ips ::/0

This however results in a "Temporary failure in name resolution:
`vpn.example.com:51820'. Trying again in 1.00 seconds..." error
message, which makes sense, because the wireguard-tool tries to call
getaddrinfo inside the network namespace. The namespace doesn't have
an internet connection and the lookup fails.
https://github.com/WireGuard/wireguard-tools/blob/96e42feb3f41e2161141d4958e2637d9dee6f90a/src/config.c#L242

As a user I would expect that the wg-tool does the lookup in the
birth-namespace of the interface and not inside the newly created
network namespace.

What is the recommended solution to resolve an domain endpoint when
using network namespaces and wireguard? Just manually lookup the
domain in the birth-namespace and use the ip as endpoint? The
implementation however would be quiete hacky to make it properly work
with IPv4 and IPv6.
