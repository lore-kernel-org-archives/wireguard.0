Return-Path: <SRS0=cL7X=H7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2DFC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Mar 2021 14:08:32 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06E2364E12
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Mar 2021 14:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06E2364E12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wandera.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89180aad;
	Mon, 1 Mar 2021 14:08:30 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 08a79132
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 1 Mar 2021 14:08:28 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id jt13so28467680ejb.0
 for <wireguard@lists.zx2c4.com>; Mon, 01 Mar 2021 06:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wandera.com; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc:message-id:references
 :to:content-transfer-encoding;
 bh=pksQgc7Q0PZPlnYLqJUUNPh2kegAE8RATooNqhtCY80=;
 b=N1xd8oywJ12niivyKsj0GwKZO9GohePFWWZsMnXQ1W/7eO4m4johNRttEcb5Aj0l2H
 ykJ2aD4PogQMRtaImFHD0yncggoHVdT0EC4xyNkwFZqOaUzJ7cgYQLeBJKH+aVXoWgkj
 l/Vk2C8reFaaoZgeLtW6RVHNFHgBObzgtIYlE0krGSAOZE/Hsxzrfw41jummP2mgOIXu
 6dOOaQKKqIXql963MLFHTdjrnD71sLxvzAeddqYF8UnZU+B3LpNI8qrRwoM1Pd5uvmIJ
 91NtaK9rOMuLt3UEYBDoxMyb+oQ8lzrB/hUVrsMKEQjnc3R5ZmMJkuPXP4/ElP2zIiQ1
 yVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :message-id:references:to:content-transfer-encoding;
 bh=pksQgc7Q0PZPlnYLqJUUNPh2kegAE8RATooNqhtCY80=;
 b=ZBlgAq7pmo9w/Oj+5aTbmZLFCrrGh1HkuBeidaJ6qeBLNLEyyP6WE9QtBvfH1RsYR4
 tDOGwGK2R87eVu55ZNR1gsxiVTwW3C8RsWcspxYe4zGY8nnTXNqXa58/TCshMcCZGKCj
 vOzDCsFfm5Z21YpkFEPDRNbmGLpAw0XjTgBpor8xlJRD7H3LS/6asnbzkT3ZUEj7F5yV
 HytUT/hwmPG4pROHuIAwljPVbpVvJuaOTU1N37s8lfaxE+GSoi4Op1fVfpDCuJOONA0s
 MIBgj8RRjNVJL7tEiKxWoX+Ehdu3+wIlCycTX0Po/h8kbwQ+KYJQYpHH4hdR0/TVIRpn
 I2dg==
X-Gm-Message-State: AOAM533XdHe6yB2/CDApH45531SW3KzAMjq1BDgqj22JsLsYD5Bgwfk2
 CrerVkSUhAy4fY993+9XiQa8uZNEpnwuw7+EKoxBnVfS8grjyhZsuAZShUIvqMfToDjzSp08RM8
 Bl/djCfguqWm31MLSjeQ8AQ==
X-Google-Smtp-Source: ABdhPJxyDvxD7BVyCuXmVcEwSbFOOWT36hzV6tBcCEerdivmaMvL3AlSiyeP75i3fjo/R34pyCsA3g==
X-Received: by 2002:a17:906:5607:: with SMTP id
 f7mr5776078ejq.262.1614607707997; 
 Mon, 01 Mar 2021 06:08:27 -0800 (PST)
Received: from ?IPv6:fddd:dddd:1000:0:9a12:47ec:bb66:3813?
 (ec2-18-130-213-235.eu-west-2.compute.amazonaws.com. [18.130.213.235])
 by smtp.gmail.com with ESMTPSA id lb13sm11427214ejb.84.2021.03.01.06.08.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Mar 2021 06:08:27 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: Handshake state collision between parralel RoutineHandshake
 threads
From: Laura Zelenku <laura.zelenku@wandera.com>
In-Reply-To: <CAHmME9oOKvMqvSw_CrjhiWU+R60AEVxLYzoaC8W7F7D5vWgWvA@mail.gmail.com>
Date: Mon, 1 Mar 2021 15:08:26 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-Id: <92B58443-8904-417B-A866-7BD2C6240B42@wandera.com>
References: <27D86318-AED9-49EC-94EE-1FFC806533DC@wandera.com>
 <CAHmME9oOKvMqvSw_CrjhiWU+R60AEVxLYzoaC8W7F7D5vWgWvA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Jason,
I=E2=80=99ll try to explain the issue.

For incomming hanshake, the `handshake.state` is changing in the following =
way:
1. set state handshakeInitiationConsumed
2. check the state is handshakeInitiationConsumed otherwise "handshake init=
iation must be consumed first=E2=80=9D error
3. set state handshakeResponseCreated
4. check the state is handshakeResponseCreated, otherwise "invalid state fo=
r keypair derivation=E2=80=9D error
5. set state handshakeZeroed

For outgoing handshake the `handshake.state` is changing:
1. set state handshakeInitiationCreated
2. <sending handshake and waiting for response>
3. check the state is handshakeInitiationCreated, otherwise skip the packet
4. set state handshakeResponseConsumed
5. check the state is handshakeResponseConsumed, otherwise "invalid state f=
or keypair derivation=E2=80=9D error
6. set state handshakeZeroed

Usually only =E2=80=9Cclient=E2=80=9D is sending handshake initiations and =
the =E2=80=9Cserver=E2=80=9D responding. But in case some delay (e.g. cause=
 by some network issues mainly for mobile devices) the =E2=80=9Cserver=E2=
=80=9D can start sending handshake initiations (expiredNewHandshake or expi=
redRetransmitHandshake timers). In this time the client and server are send=
ing hanshake initiations against each other. "go device.RoutineHandshake()=
=E2=80=9D is running in multiple threads. `handshake.state` is defined per =
peer. Two threads (RoutineHandshake) can process both handshakes (incomming=
, outgoing) in the same time and these threads are working with shared reso=
urce, handshake.state. Because the routine is expecting state that was set =
before and the second thread can modify the state, the routine can fail on =
checking the expected handshake.state.
This is happening to us. We are getting error "handshake initiation must be=
 consumed first=E2=80=9D. handshakeInitiationConsumed is expected but hands=
hakeZeroed is actually set (set by different thread). The error is logged o=
n error level (Failed to create response message).

Hope this will help to understand the issue well.

Laura


> On 25 Feb 2021, at 12:23, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> Hi Laura,
>=20
> I'm not sure this is actually a problem. The latest handshake message
> should probably win the race. I don't see state machine or data
> corruption here, but just one handshake interrupting another, which is
> par for the course with WireGuard.
>=20
> Or have I overlooked something important in the state machine implementat=
ion?
>=20
> Jason


--=20
*IMPORTANT NOTICE*: This email, its attachments and any rights attaching=20
hereto are confidential and intended exclusively for the person to whom the=
=20
email is addressed. If you are not the intended recipient, do not read,=20
copy, disclose or use the contents in any way. Wandera accepts no liability=
=20
for any loss, damage or consequence resulting directly or indirectly from=
=20
the use of this email and attachments.
