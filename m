Return-Path: <SRS0=tp6W=C7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6C6C2D0E2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Sep 2020 19:39:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 385B8221E8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Sep 2020 19:39:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekkU2ADk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 385B8221E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f0f33e9;
	Tue, 22 Sep 2020 19:08:24 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id be1389e1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Sep 2020 19:08:22 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id u8so19361258lff.1
 for <wireguard@lists.zx2c4.com>; Tue, 22 Sep 2020 12:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kFsqd5UDFGod8Is5YvwdX3RY1oNxS0AT4lG/cEuicQM=;
 b=ekkU2ADkJtUD3BpBUmwgxnihLTEUvUsXjuxLQxYlD9dnFAew/FZM6vylbiwMDnwmYl
 pfw/jkf3al1E79oGITmNSbxGxVIRDei+VHYaZ9eRRK7IIFW9cVpGEdFugHbsTDdSZhd/
 6q1FVMauQM5YvfE9un6AsdOgB9z26Gwd1xQD5XzlutjYcpid00xvuHM2UufTVM/YmBSf
 uV11Qy0fdgsh2JgJU64ffAuYsfBeVudsikQTmDzrl3U34WsWymdhDTsHbcJ50jwJhF8+
 b8nskPA8o61v16EeJUXK2nxu3eDzvo6Jcu2eH6taYcvo4yfYgYVkZbaVjAnKBKR4zFya
 7a0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kFsqd5UDFGod8Is5YvwdX3RY1oNxS0AT4lG/cEuicQM=;
 b=hE13bJulIAYw3jVQNCp/MuRECIg0hFlKmCPtL0VDqhXCIL5SyEbT/4zQapJ0k8mKp1
 WmIcZAChgGhyzQlGyOlxRq6PceySikYvbuEMyJqH3bZRx+Fd33yy1HeUnIo/FkzmZx+3
 vNVd9LRQzHp9VPLgfgvpv8TqAwFByvMWus+pUj6xWz/bvGBPW/nzD+PmoWQVBNViGQ5Z
 Ya5kqVbbmse1GkvX8GHB426NmSgNh5O1izAjRR192y5n3hMTZN5vUE3wW0Kx+cyKZkd5
 XEDSAfPj1q6bh+CDJsABBZGRz3DgpYg0mCwTisFJXzdmFT9oZZvnbGJqZxXUMqxw0XsI
 qwJw==
X-Gm-Message-State: AOAM532kdDDdWl4IxX8NRsKlJTYEXeZG1faOGIhN6pK4RpbnG16AJ4bc
 X6+2gfVLEQKhsvM3nzTRRdLLoAImjHHMrRG0f7cgLlvp6o6rZQ==
X-Google-Smtp-Source: ABdhPJwI+AWRvnnQL+dhHSk59mZPNnIssl7WDibw6x2xkOsEtfi8hUWAicr64/yT7zOoLtiP3Zgy059w1SJgodg03/4=
X-Received: by 2002:a19:be0c:: with SMTP id o12mr2355954lff.313.1600803544261; 
 Tue, 22 Sep 2020 12:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <9b4ba85a-633a-04ed-ca15-eb29d476cd57@pallas.us>
 <CAHmME9rU3AhppjN+6OM8vYHHbpK1Fxj2chVCCyHQBL-XvKk2uA@mail.gmail.com>
 <CAMaqUZ2B3H1Fa3=TFh6_PoV_Thz4javkKFHyeGPpdsma_GC0QQ@mail.gmail.com>
 <f3ec618d-3244-899b-f6bf-d7c988009acd@pallas.us>
 <f344814f-034e-4e37-06f5-85e74a0ba582@pallas.us>
In-Reply-To: <f344814f-034e-4e37-06f5-85e74a0ba582@pallas.us>
From: Reid Rankin <reidrankin@gmail.com>
Date: Tue, 22 Sep 2020 15:38:27 -0400
Message-ID: <CAMaqUZ0pUO-UBbJn3jED4HG-t5HiR3MLRBDrkSMz3fv_qpVsNg@mail.gmail.com>
Subject: Re: Interest in adding multicast support to Wireguard?
To: Derrick Lyndon Pallas <derrick@pallas.us>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

While I'm all for multicast support, I don't think this is it. TunSafe
only has that option to allow you to turn off an extra anti-multicast
filter that's on by default and drops anything incoming from ff00::/8
or 224.0.0./3, even if it's from a peer with those ranges in its
AllowedIPs. (Actually, 224.0.0.0/3 is technically the wrong range for
IPv4 multicast; that's 224.0.0.0/4. The upper half of that space,
240.0.0.0/4, has been "reserved for future addressing modes" since
1989.)

TunSafe was available long before the official WireGuard
implementation on Windows, largely because Jason insisted on
implementation of a proper Windows tunnel driver that operated at L3
(Wintun). TunSafe instead used the TAP-Windows driver from OpenVPN,
which shows up to Windows as an L2 device. It can do this because it
pretends that its peers have "MAC addresses" and uses a built-in
ARP/ND responder to fake the associated L2 traffic needed to bootstrap
L3 communication. I'm pretty sure this extra multicast filter was
added specifically because it prevents peers from interacting with
this internal ARP/ND machinery, either maliciously or through
misconfiguration.

--Reid


On Tue, Sep 22, 2020 at 2:54 PM Derrick Lyndon Pallas <derrick@pallas.us> wrote:
>
> On 9/21/20 8:16 AM, Derrick Lyndon Pallas wrote:
>
> >
> As an aside, it looks like at least one Wireguard (protocol)
> implementation [1] actually does implement all-or-nothing
> multicast/broadcast in their client: note the AllowMulticast option in
> [2]. They also explicitly enable ICMPv6 Neighbor Solicitation.
>
>
> [1] https://github.com/TunSafe/TunSafe/
>
> [2] https://tunsafe.com/user-guide/config
>
>
