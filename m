Return-Path: <SRS0=B3Yb=IO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0B3C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 14:03:17 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31B6C6506A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 14:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31B6C6506A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wandera.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 848f560e;
	Tue, 16 Mar 2021 14:03:15 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cfcc6cfb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Mar 2021 14:03:14 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id x13so7492643wrs.9
 for <wireguard@lists.zx2c4.com>; Tue, 16 Mar 2021 07:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wandera.com; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc:message-id:references
 :to:content-transfer-encoding;
 bh=PSQh5YMXioAZEmd9CnJz4lV1vMsNkZkfjp9UNeOt2y8=;
 b=f00c++hgOQFUL0kQSoE3fZ01oRrSvMVuUx4jvniZbbZD/nG6o38yghhCAlKDjgLKMu
 PGx4gn/OR1aWZJxzdFG/uyypkIJ6rsyZM6qjsbI9vUZFz0f+CIRzCNAvG0NNMZIaLG2U
 7/0XyCGjhgOy1XSJhSnHjWOECdmS2xSwTXuZlaRg25b+0X0nRlBxdWbOuHOnfuI//1+4
 xpv3eJNcGu1k2ExTdUHMZqKvGlf5jBTCtoYi8wxMUdkD7PgQQw4CiAugTrqbB7brDK7M
 nj7rbGS8CuMuq/I3KBovVLWpg+huqdN4xCqEcKW2e3nVWSdkHr9SMR9cRfEj4+jhPoE7
 RqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :message-id:references:to:content-transfer-encoding;
 bh=PSQh5YMXioAZEmd9CnJz4lV1vMsNkZkfjp9UNeOt2y8=;
 b=WggorrYlx7qmXsD+ZfB/CbFNfVD0tFl+WQOMrM01VKHIh2a0fOcHo1DwySKDjMdudn
 5Wv4jYQkjQ4tFrHA3DXwe0kdlkQzP0v436UWWfBBRW8wILzy/d+N8F6oEuKzeeyg2R23
 oIGeF6v4+uiM4vh+Z0MN6KGQxPwIWAwnj3x4FJzWxOcNlGpGikkZ+pbEW2TKeD2e83Ld
 WhRWBZdUZYX3EWgQVX6h9IM4P1ZLjnDPWcAOOM9nTr+0rZjbiCpK0sWSu/n3+ejonCxt
 d4NMc5B0h0N4U6v3qqxcPwN6LPbh+jLza2HHjQ8+8oYOz7icDJHam+3S/HSGSw/akDhJ
 AIGg==
X-Gm-Message-State: AOAM530uSTWym0Qrlx0aK0K5NEKueJi9010IT4WzBCW//E41gTva3Sf5
 1F/BcPm6GOH/Q8MpjQ83JmD4Kz5/UIcsjV5mUYL+srcV2exj/4FqtVfS3wOTyLT5Te97S0n10F1
 Qg4l0QO53rDOtmQ==
X-Google-Smtp-Source: ABdhPJyPJOzZeR5ypLXvOaX4LF7Dqw8eanbFS7atM1WqzGwTsuAXZUTxTvOfvuTeIPt/F4UdYWcQYw==
X-Received: by 2002:a5d:55c4:: with SMTP id i4mr5189847wrw.84.1615903392782;
 Tue, 16 Mar 2021 07:03:12 -0700 (PDT)
Received: from ?IPv6:fddd:dddd:1000:0:9a12:47ec:bb66:3813?
 (ec2-18-130-213-235.eu-west-2.compute.amazonaws.com. [18.130.213.235])
 by smtp.gmail.com with ESMTPSA id j20sm3012765wmp.30.2021.03.16.07.03.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Mar 2021 07:03:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: Handshake state collision between parralel RoutineHandshake
 threads
From: Laura Zelenku <laura.zelenku@wandera.com>
In-Reply-To: <92B58443-8904-417B-A866-7BD2C6240B42@wandera.com>
Date: Tue, 16 Mar 2021 15:03:09 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-Id: <6B92ECA6-AEC9-42F2-AB98-013CBB70691C@wandera.com>
References: <27D86318-AED9-49EC-94EE-1FFC806533DC@wandera.com>
 <CAHmME9oOKvMqvSw_CrjhiWU+R60AEVxLYzoaC8W7F7D5vWgWvA@mail.gmail.com>
 <92B58443-8904-417B-A866-7BD2C6240B42@wandera.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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

Still struggling with this issue. Running RoutineHandshake in single instan=
ce will help. Remember there is shared resource =E2=80=9Cpeer.handshake.sta=
te=E2=80=9D. Even the resource is per peer there are two directions (upstre=
am/downstream) that can fight for this resource and write it=E2=80=99s own =
value.

Index: device/receive.go
IDEA additional info:
Subsystem: com.intellij.openapi.diff.impl.patch.CharsetEP
<+>UTF-8
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- device/receive.go	(revision 5f0c8b942d93be6ac36a156c0ba44c86c3698f91)
+++ device/receive.go	(date 1615902577604)
@@ -10,6 +10,7 @@
 	"encoding/binary"
 	"errors"
 	"net"
+	"runtime"
 	"sync"
 	"sync/atomic"
 	"time"
@@ -239,7 +240,9 @@
 func (device *Device) RoutineHandshake() {
 	defer func() {
 		device.log.Verbosef("Routine: handshake worker - stopped")
-		device.queue.encryption.wg.Done()
+		for i :=3D 0; i < runtime.NumCPU(); i++ {
+			device.queue.encryption.wg.Done()
+		}
 	}()
 	device.log.Verbosef("Routine: handshake worker - started")
=20
Index: device/device.go
IDEA additional info:
Subsystem: com.intellij.openapi.diff.impl.patch.CharsetEP
<+>UTF-8
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- device/device.go	(revision 5f0c8b942d93be6ac36a156c0ba44c86c3698f91)
+++ device/device.go	(date 1615902577566)
@@ -305,12 +305,12 @@
=20
 	cpus :=3D runtime.NumCPU()
 	device.state.stopping.Wait()
-	device.queue.encryption.wg.Add(cpus) // One for each RoutineHandshake
+	device.queue.encryption.wg.Add(cpus)
 	for i :=3D 0; i < cpus; i++ {
 		go device.RoutineEncryption()
 		go device.RoutineDecryption()
-		go device.RoutineHandshake()
-	}
+	}
+	go device.RoutineHandshake()
=20
 	device.state.stopping.Add(1)      // RoutineReadFromTUN
 	device.queue.encryption.wg.Add(1) // RoutineReadFromTUN


> On 1. 3. 2021, at 15:08, Laura Zelenku <laura.zelenku@wandera.com> wrote:
>=20
> Hi Jason,
> I=E2=80=99ll try to explain the issue.
>=20
> For incomming hanshake, the `handshake.state` is changing in the followin=
g way:
> 1. set state handshakeInitiationConsumed
> 2. check the state is handshakeInitiationConsumed otherwise "handshake in=
itiation must be consumed first=E2=80=9D error
> 3. set state handshakeResponseCreated
> 4. check the state is handshakeResponseCreated, otherwise "invalid state =
for keypair derivation=E2=80=9D error
> 5. set state handshakeZeroed
>=20
> For outgoing handshake the `handshake.state` is changing:
> 1. set state handshakeInitiationCreated
> 2. <sending handshake and waiting for response>
> 3. check the state is handshakeInitiationCreated, otherwise skip the pack=
et
> 4. set state handshakeResponseConsumed
> 5. check the state is handshakeResponseConsumed, otherwise "invalid state=
 for keypair derivation=E2=80=9D error
> 6. set state handshakeZeroed
>=20
> Usually only =E2=80=9Cclient=E2=80=9D is sending handshake initiations an=
d the =E2=80=9Cserver=E2=80=9D responding. But in case some delay (e.g. cau=
se by some network issues mainly for mobile devices) the =E2=80=9Cserver=E2=
=80=9D can start sending handshake initiations (expiredNewHandshake or expi=
redRetransmitHandshake timers). In this time the client and server are send=
ing hanshake initiations against each other. "go device.RoutineHandshake()=
=E2=80=9D is running in multiple threads. `handshake.state` is defined per =
peer. Two threads (RoutineHandshake) can process both handshakes (incomming=
, outgoing) in the same time and these threads are working with shared reso=
urce, handshake.state. Because the routine is expecting state that was set =
before and the second thread can modify the state, the routine can fail on =
checking the expected handshake.state.
> This is happening to us. We are getting error "handshake initiation must =
be consumed first=E2=80=9D. handshakeInitiationConsumed is expected but han=
dshakeZeroed is actually set (set by different thread). The error is logged=
 on error level (Failed to create response message).
>=20
> Hope this will help to understand the issue well.
>=20
> Laura
>=20
>=20
>> On 25 Feb 2021, at 12:23, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>=20
>> Hi Laura,
>>=20
>> I'm not sure this is actually a problem. The latest handshake message
>> should probably win the race. I don't see state machine or data
>> corruption here, but just one handshake interrupting another, which is
>> par for the course with WireGuard.
>>=20
>> Or have I overlooked something important in the state machine implementa=
tion?
>>=20
>> Jason
>=20


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
