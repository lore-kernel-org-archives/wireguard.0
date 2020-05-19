Return-Path: <SRS0=UEMD=7B=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB5CC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 May 2020 09:09:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AD05206D4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 May 2020 09:09:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbayzdqt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AD05206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aeed76ba;
	Tue, 19 May 2020 08:55:22 +0000 (UTC)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [2607:f8b0:4864:20::12f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fb6eea10
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 May 2020 08:55:20 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id m6so522587ilq.7
 for <wireguard@lists.zx2c4.com>; Tue, 19 May 2020 02:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NyNSa49iwAkCMElyl6wKsESdZKBhYOH6twtX0I0LWBY=;
 b=mbayzdqtMyymgHsxTRVWWNREyuN5SSOJ1Yx9zl4+Jpz5ka+XojtKYthCWl3G1cK7KN
 jzAy6aNHnObYvMeXtHkP0qzezEO9JvjRDfzHFc5qE5dJGu0XiJ7ixDLWbuN+fnbGDzs8
 EWjrd9/Yx5j8Cqeh35KKnNcImylUrzUYFQ/qm5wI/wJIiVArhavCEBjg+w+LuoykwX6c
 vmEdrf1Qt09fxCFXa0YbVYbA5iS/UF5SfQ5rJhoDD9jXKRUxFzpzq3QxLj1xwl4oLa8Q
 r0v/2VeZ+iD+BaSwHwhJJUEn7cMn0TQ1UzwEhngzLhrIhSDixCSTahESwRxXLF5uKUac
 gKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NyNSa49iwAkCMElyl6wKsESdZKBhYOH6twtX0I0LWBY=;
 b=D2q1BrKYX8fbnOojBCGQ57tHHdtjLQPLXUMcX5v6vmkefe3vTnv5tgX28nSpqqrXEf
 TTBZwX8UbovI4EKIUSnbsls4JJJR01DNsI0nG/O6NedSfbnuqAZvkA+hd4y/aCZaw3ap
 Tcp/4QP2PaU8ygvnidwfT6y2nESj+QtQrK2bdvcsvqEEWIYFApOQPXXjPuyZjcILVLKo
 KW4djsxLGWnYSEUf8vmH0yiCv89Fmue2An9Jfmou5FGMOzA3cgYTvNufIKoWgrOFkpq+
 PA02njX+T5sRQsX3J9Vunp4pSb5seC+w8uG8ZYcL4ul3sryXbAS5kB68/WhvPMa4o4e/
 EvSQ==
X-Gm-Message-State: AOAM533APt2hkwX+wA+qLrN5DRmitQDsIfS0hbF71kEUeeSLsFhnX2zz
 ArXwr5xVbVBcxGC2VRQ/Rqju8Vs2L+QIjmtEGcveurafOEI=
X-Google-Smtp-Source: ABdhPJw4ruKx6S4Kh8h7YJuZgozgVNmb3KktLIaANqPlnyWpARBxJ41A3j1ZWxG6WoVGhpAWNhudTj/NH7LvIPvD1GE=
X-Received: by 2002:a92:1949:: with SMTP id e9mr21204421ilm.106.1589879379947; 
 Tue, 19 May 2020 02:09:39 -0700 (PDT)
MIME-Version: 1.0
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Tue, 19 May 2020 11:09:24 +0200
Message-ID: <CADdae-gBznYaqgYwv9JPeGhMm86s4EZLABc-hKkTdMgUVpL-gA@mail.gmail.com>
Subject: Wireguard, allowed-ips, ipv6 and multicast
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
I'm trying to use vxlan encapsulated into Wireguard tunnel, with a
multicast group for announcement.
Ex :
ip -6 link add vxlan100 type vxlan id 100 dstport 4789  local
`wg0Ip6_lock`  group ff05::100 dev wg0 ttl 5

All works very well when i set wg tunnel with ::/0  as allowed-ips,
but if i'm trying to be more restrictive, as ff05::/32  for example,
it does not work.
Is a specific interaction between allowed-ips and multicast group in ipv6 ?

Regards,
Nicolas Prochazka.
