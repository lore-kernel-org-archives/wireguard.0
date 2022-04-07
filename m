Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34A8C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 00:45:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id fb4763da;
	Thu, 21 Apr 2022 23:50:29 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d9d638c7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Apr 2022 00:06:12 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id l26so7552653ejx.1
 for <wireguard@lists.zx2c4.com>; Wed, 06 Apr 2022 17:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=yh/90ZjVqgfgr/+m/Xm/FlKEBN103n6icBLi2imp7bQ=;
 b=ESzoEbhHKUZLnL8+3VtdXiPFHRDEWSQLmJGZzehsyQeQAgifkjxo5wIbiDGRQlhHDo
 cR1f4BDQESOLCtLEe9EDh45LMvkL1gllIR8F+czbvfXRaTXVvlzCrgAyFT0sd/x4lUw/
 C8l4F7d82alsuwplDg5kjUN672ISwWdsyaxG3db9AvJLJCzNcuswt+VIJV1dPH6rkkVQ
 UOub9v/oCcmzgfERpdqtnweJz9xYQ/OnEwymLiagbiXQowgm+TNFdZUObLkEa0bu3rIT
 yX2U8JwrsDQS7zRP2T9de2bk6zcCkhGYd3FGsijKkBtH8DvAPNR1hAhLcs5Qhh3eYt5I
 bT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yh/90ZjVqgfgr/+m/Xm/FlKEBN103n6icBLi2imp7bQ=;
 b=Z104NhnkJXEaDV3sinRPsBTM1Z+QYOXgdv57XCeUEUsID6uaWPQR1EwvJhqcOOEFoF
 9ZCQK4PIPI+Vv0LZK2Xejuu2XPu3m46tiItVQ+VsgvczGOFf7rHh+K+lXJIwJAM9LGuD
 zdbhNc8fRAxcTHKBGzQDEvQpMdRYJaktd7fTvtUTjZpxiM7PtWhoLKRzrieB3Y72ueqB
 p0I3nuylFwiZuThDcjiHsuVHoksU0N5zGanpZxZh91tG57XiEkp+8xvLhPAo8gcheW/Z
 1t6rRSwxyp7hQfGWdVIWJhtq6DdQaBPM3bZ01MzIYmu2r0u0fMtbS7McC8AZ638F1VYL
 O8lw==
X-Gm-Message-State: AOAM533FbCGCBv32J0CVpCDZh345LV4zT3aM39EkWRZ4eVhjuio1dKPr
 17NyRgfOhkiiLq8BVFn5Pc0TY7M7vygvhWqGrgcLMJnaPjM=
X-Google-Smtp-Source: ABdhPJxFgHlw8RVAeTIcg8wKmsE3Vle87K8qtXZe1NPi5wXDPkW1lliRtjootN8zT9mG93z+ZufGKyue10MUwCrEEME=
X-Received: by 2002:a17:906:58d2:b0:6da:b635:fbf3 with SMTP id
 e18-20020a17090658d200b006dab635fbf3mr10416692ejs.40.1649289972344; Wed, 06
 Apr 2022 17:06:12 -0700 (PDT)
MIME-Version: 1.0
From: Aaron Turner <synfinatic@gmail.com>
Date: Wed, 6 Apr 2022 17:05:46 -0700
Message-ID: <CANAZdzV=aU51WJO+8F9hUHrRL+V-+tQPHYHUKD8bHqhtvmnjsw@mail.gmail.com>
Subject: Wireguard crashing MacOS when going to sleep and tunnel active
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:50:26 +0000
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

I asked on the #wireguard channel and was told to post here like it's
1999, but here it goes:

MacOS Catalina / 10.15.7
MacBook Pro 16"/ 2019 (intel)
Wireguard from Apple Store v1.0.15 (26)

Recently switched from using OpenVPN to Wireguard.  Since then, I've
twice had my computer reboot upon wake-up which is definitely a new
behavior.  The only commonality I can think of is that both times I
had a Wireguard tunnel active when I closed the screen to put it to
sleep.

Not getting a kernel panic/report to Apple message upon booting.

Dunno what else would be useful to help diagnose or disprove this, so
feel free to reply directly to me.

Regards,
Aaron


--
Aaron Turner
https://synfin.net/
My father once told me that respect for the truth comes close to being
the basis for all morality.  "Something cannot emerge from nothing,"
he said.  This is profound thinking if you understand how unstable
"the truth" can be.  -- Frank Herbert, Dune
