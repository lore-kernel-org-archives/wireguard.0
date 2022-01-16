Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0333FC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Jan 2022 21:15:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b00e3d21;
	Sun, 16 Jan 2022 21:10:58 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [2607:f8b0:4864:20::d2d])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c702dd92
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Jan 2022 00:11:22 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id v6so16985573iom.6
 for <wireguard@lists.zx2c4.com>; Sat, 15 Jan 2022 16:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=WkVlYKWmd79A1dtTW81x7oY4qmX6f0g+FdXxlI/TFxw=;
 b=T1Vdd6ZvGWZkEWrfurvhFoUqu0bKQSGlhbXY3I9CU+VHcAU9uJ5i+mrp+y9F3N3PNt
 jb4IA5kHN9wbTPL8R/t3V4Z8xM6QO4SZSlLS5yB4YWcrRvE7qyEmnqBNnNZELM3JkJ8d
 xFS0OjCavJ3oLpsF0LnlQW2GOFSRUf45pBywJKqrhHnW9nfSdrLAzwaR7h9iVkBa4iy3
 VdcFRWkpYiD0kgaAPBvuyH/yPbqQ6BzSP4P7Aj1R6zieEVKDtjXwHS8XMwtdFtwvrJM9
 dgJ27tqYn/Kz1aN8fZY/wu8xXJ5fK7OogpqvlMXgaj0Mk24UrQN/yXAt+HnRxjJukMmt
 LbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=WkVlYKWmd79A1dtTW81x7oY4qmX6f0g+FdXxlI/TFxw=;
 b=6yXDlIWC5wgC5SZp9jU+MdjKByEU+djkzVR8BhykcwSUuUWiRj8CgX76RRSG7b+3jP
 bNYWI108QgXhdfJp3f/WBbvTYpTYEU7Cjoe2KVfGUNMjOtJ1Rxr37BG0BtVc3BkumN7g
 RYkOZqblgJ6ApBmvrapFGzNxAf+5SYNsD7OyqS2ecRCDUFqk5/dv+fuEnWw+O0xCpvAH
 E9OcjyGNuh58x0UjTPlIETzT+go7LQsavcta3eF8iryrs0tpGUV3o3FceMTgL+9Uj4f/
 DaDOnG1aF0HaBrH14h5CZXkwA74DbZAl4AU0VSxsMd6FEb+eDvPO106aFgyfOuO7VETB
 /SnA==
X-Gm-Message-State: AOAM531w0bDa016AVfHkG7Jdxfb/cE5y5y3dHD5+fdH00XNc3qmVe2Yr
 VF6QUEPSD0fdAjLMBimMTC+MxJaZwpMhHG/UXplVCOCU1IFHqA==
X-Google-Smtp-Source: ABdhPJxZJGiIf/9cY4SsOwcdATBwF9kL4jFv1uux0/9XDXN9Sv5oPk4VwopCuT/i3vlLhU6MyZHWAXrFr//Dhc1D3i0=
X-Received: by 2002:a05:6602:1543:: with SMTP id
 h3mr7008933iow.31.1642291880365; 
 Sat, 15 Jan 2022 16:11:20 -0800 (PST)
MIME-Version: 1.0
From: Alessio Nossa <alessio.nossa+list@gmail.com>
Date: Sun, 16 Jan 2022 01:11:09 +0100
Message-ID: <CAMTfdYr3YRv4MQKBhbj=Mq-QK_7nQF_DsbsB2wPLCf-idV8=ig@mail.gmail.com>
Subject: [wireguard-apple] Siri Shortcuts/Intents integration
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 16 Jan 2022 21:10:46 +0000
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

Hello
In the last month I worked on the implementation of Siri
Shortcuts/Intents integration for the WireGuard app (at the moment,
only on iOS), to automate some tasks like connecting a
tunnel, getting tunnel peers, and updating configuration at runtime. I
saw that this feature was on your TODO List too [1].

My idea is to have an interface to manage connections, to make up for
the absence of wgctrl-go [2] on iOS. I need this to dynamically update
endpoints at runtime for NAT Traversal purposes [3]; specifically, I
need peers' public keys and a way to set endpoints at runtime [4].

There are some issues due to an Apple's bug [5] that doesn't allow an
extension to update the configuration owned by its parent app. As a
workaround the update configuration action will launch the main app.

As this is my first time contributing to wireguard-apple, if you have
any advice, I'm here to hear from you.
As suggested in macOS and iOS TODO list, I=E2=80=99d like to have push acce=
ss
to the repository (or any other way I can submit it) to contribute
with my work (I already sent an email to team at wireguard.com, but
received no response).

Kind regards,

[1] https://docs.google.com/document/d/1BnzImOF8CkungFnuRlWhnEpY2OmEHSckat6=
2aZ6LYGY
[2] https://github.com/WireGuard/wgctrl-go
[3] https://www.jordanwhited.com/posts/wireguard-endpoint-discovery-nat-tra=
versal/
[4] https://github.com/jwhited/wgsd/blob/master/cmd/wgsd-client/main.go
[5] https://developer.apple.com/forums/thread/96020
