Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6788CC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 22:35:46 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F89860C40
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 22:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F89860C40
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30c2947e;
	Sun, 8 Aug 2021 22:33:32 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1c0a15cb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Aug 2021 22:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628462005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=7ChRPMLHNYlIRXd7vMirDEWdSisTA3BZIsnFzVQUyaM=;
 b=M3+gELFIbquqL7NIDYIFMzMQfplA11e7bnz53k2gZ4ga0Bl/cZMOk2OvapLL7sSMaLvAAS
 ArmI669i/8yNCUbtLXnznssHldY9tPVmsLrFchKNL0tARorYY819UdiweGAvJR6e9MQMAA
 cjeMT/nFKgVO/sflKjvxQd2IWfln8/A=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c4b205af
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Aug 2021 22:33:25 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id p145so26061963ybg.6
 for <wireguard@lists.zx2c4.com>; Sun, 08 Aug 2021 15:33:24 -0700 (PDT)
X-Gm-Message-State: AOAM530ZSGRWc6DKRzdZu4zNkLPJQQ09igflguu95H/Ld/jHfZRLaUxt
 DZChjadzXCQLV4vVYCiQYSWyRJGXeLDk3H7btqk=
X-Google-Smtp-Source: ABdhPJzVmdz7Qs+OStWw3rVxxHypXsamYYS37M/GVjTP42xJ8oromEjtQPr1BLt7cMaVDLMaPUZjom9WNi99dmBp4uE=
X-Received: by 2002:a25:18a:: with SMTP id 132mr26457685ybb.123.1628462004093; 
 Sun, 08 Aug 2021 15:33:24 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 9 Aug 2021 00:33:13 +0200
X-Gmail-Original-Message-ID: <CAHmME9q_9frZ+EQ4_sq_aEoFn3sU01LcW25RysWj0mas4po47Q@mail.gmail.com>
Message-ID: <CAHmME9q_9frZ+EQ4_sq_aEoFn3sU01LcW25RysWj0mas4po47Q@mail.gmail.com>
Subject: another thread on montonic counter alternatives
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Karolin Varner <karo@cupdev.net>, noise <noise@moderncrypto.org>, 
 =?UTF-8?B?SXZhbiBMYWLDoXRo?= <labo@labo.rs>
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

Hi folks,

We've had this discussion a few times in various forms, but it's come
up again recently, with Karolin Varner (CC'd) emailing me with some
fresh enthusiasm about the problem space, so I thought this might be
something worth discussing again, perhaps this time with some input
from the Noise mailing list.

NoiseIK is 1-RTT, so WireGuard sticks a timestamp in the first message
to prevent replay attacks. Responders reject packets with timestamps
that are larger than the last one received. If a responder reboots,
there's subsequently no session to disrupt with a replay anyway, so
it's not an issue. Generally this works well, provided initiators have
a reliable monotonic counter. Generally timestamps are considered
reliable-enough monotonic counters. Issues with this begin from two
angles:

Angle 1) Embedded devices without a battery powered RTC that want to
use WireGuard to bootstrap have a chicken & egg problem.
Angle 2) Initiators that are using the old, crusty, and insecure NTP
protocol can have their time hijacked.

Angle 2 presents some interesting possibilities. An adversary who sets
somebody's time backwards can prevent them from connecting until their
time is set right again. Adversaries who set somebody's time forward,
say, to the maximum TAI64N value, and then subsequently have an
initiator send an initiation message, can then render that initiator's
static private key forever useless, since that future timestamp can
always be replayed, and will always set the responder's greatest-yet
value to that maximum. So, if your NTP is hijacked, your key is
forever DoS'd.

We've talked about a few solutions before to this. They all have
various pitfalls.

Idea 0) Insist people don't use NTP but rather some authenticated
alternative. Insist people have battery-powered RTCs.

Idea 1) Store a monotonic counter on disk, and just increment it by 1,
or even some random value bounded far below the limit, on each
handshake. The downside is this relies on storage that doesn't wear
out and is always available.

Idea 2) For a given system boot, store in memory the time of the first
handshake, and then increment that timestamp by 1 on each handshake.
The problem is figuring out when to sample that initial golden
timestamp. And it doesn't actually solve Angle 2, because that initial
golden timestamp still might wind up NTP sync'd at some point.

Idea 3) Insist people who must use NTP disable large jumps. This has
the same issue as Idea 2, in that the bootstrapping timestamp is still
an issue.

Idea 4) Require the responder to also have a synchronized clock and
reject handshakes that are too far into the future. This might
alleviate Angle 2 to a large degree but it causes big issues for Angle
1, potentially.

Other clever ideas?

Jason
