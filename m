Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E23ECAAA1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 31 Oct 2022 13:08:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id fc415132;
	Mon, 31 Oct 2022 13:08:03 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a3d88140
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Oct 2022 03:27:09 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id bp15so17303631lfb.13
 for <wireguard@lists.zx2c4.com>; Sun, 30 Oct 2022 20:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NZ95nWAy3OKMkzvpp16ZfFh0FCfnaqYgy/5vWc7AvAQ=;
 b=FK+sNAsmaRBi6psG56Q/OmNDsYHeSkPSBIW2eMKrZOa6PjoWku1iwl3QoI10Ti/xwS
 t+3pNiksPBf6uBkfQodvMAOg8UZfs8CaSmVS3zJh3ePORBjtA3XL/1tCPuVrgrxcZoIE
 crWU6nLWN4E4i/Hhv/fCJJoVRmL/QvjOe82MxQKpemelHs24ez6d3EUOdlHu8S5215RL
 wY4nUw1UJeL2nbUEx3/zgt6PhGAVfeDFq7y9UitBd8QAoWX5Mp1uB/uACLUeQFgOCQh/
 IRUOTyOAvXYjidavmBsmMoVQKF3dLTvSEgYFyLkY87tadqbbYAEOyIrcM4jgiLC4yODX
 oJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NZ95nWAy3OKMkzvpp16ZfFh0FCfnaqYgy/5vWc7AvAQ=;
 b=eGx55767kfEpBKpXI7U2xM6kNI6C1g/qZciZe7mXpr7QYm30uLHB4PSfMa8mwbwTiW
 SJ3CKnhy7b0y/bZhkUjyngPQHYtnKfK22ZZBGtjwjaT0cthCdMwIRYjSNiHnGbbIkzk9
 F8d76nC5ZGflEmqGt4baZ17enRKTOu6hAHj5e3wOn87JfMj5YiTCfKNDyYI0Cu99K9Hg
 5I9LC+WNA0hletAUDr47CFHeJ4ayV/z/E49Vc2jrUb/an8KDV+RwB17qvDI82hdRam82
 QurtWM2rl+NPrUIcsDc51po24v9QWNvQtX2uyCK5XhQERB+DGsIaK0CoVncWsqp/LZJL
 WoJQ==
X-Gm-Message-State: ACrzQf1z80I7/8jtgGNShST9A1268FBxN5VM44ajL6P90TSrHrLy3FJ5
 GYGPzWT5q8eMVHDsLFyWfNf8btfjNZc4vjISE47i0An13nA=
X-Google-Smtp-Source: AMsMyM4E2jKnaWseBqcepUVmVgMZmQkwzuRiRFppS6V4HFNdudyBFCuDhSIK2nTmRMlCPjNPPeBCwUcJieYHRN9mPp0=
X-Received: by 2002:ac2:5b08:0:b0:4a6:1181:1b15 with SMTP id
 v8-20020ac25b08000000b004a611811b15mr4448097lfn.494.1667186828570; Sun, 30
 Oct 2022 20:27:08 -0700 (PDT)
MIME-Version: 1.0
From: Madars Virza <madars@gmail.com>
Date: Sun, 30 Oct 2022 23:26:57 -0400
Message-ID: <CAPoS0C3LWh3asNLruJNWBASrKkkrekdHWTWx3+S38usiEo+S7A@mail.gmail.com>
Subject: WireGuard namespacing/isolation on Windows
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 31 Oct 2022 13:08:01 +0000
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

Hi!

Consider the following use case: preventing accidental WebRTC-style
information leaks. These leaks used to happen because WebRTC JS API
exposes IP enumeration even if no packets get sent over the
corresponding interfaces (i.e., even though the default route is the
VPN endpoint, WebRTC API would "betray" information about other
interfaces visible to the browser.)

In Linux, an elegant way around such leakage is to run your
application in a separate network namespace a la
https://www.wireguard.com/netns/ . For example, you can launch your
browser/BitTorrent client/etc in a separate netns that only sees wgN
so that even if there were WebRTC-style leaks, the application would
not immediately see interfaces outside its network namespace.

What would one do to achieve a similar result for WireGuard clients on Windows?

I'd be happy to write a little bit of code / accept solutions that are
not production-grade (this is all meant for a developer workstation).

Madars
