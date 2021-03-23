Return-Path: <SRS0=PPOQ=IV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887A5C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Mar 2021 14:44:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DAC461974
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Mar 2021 14:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DAC461974
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wandera.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c3c4c2a;
	Tue, 23 Mar 2021 14:44:21 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a1d647c4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Mar 2021 09:47:11 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 a132-20020a1c668a0000b029010f141fe7c2so10394355wmc.0
 for <wireguard@lists.zx2c4.com>; Tue, 23 Mar 2021 02:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wandera.com; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc:message-id:references
 :to:content-transfer-encoding;
 bh=A97M6Z2AORCYTNmjBn4qA+zhbptTeRmphDo+plSZq14=;
 b=URUmaGVq063SS8o1OxVuMufxJugjK+8SVGIiLVOe9s0Gcz5WjjtPFcI8BnGmP4nSKt
 I+Jeh9c65qsIi/ZqsXv/Bz2zMszwq7zwXKQwCUDywF9isxBZ2GT3MzBZwg27T5Jun+uN
 yMVf+7ruEdZsaIql9zp8XvcVIyljgPLn+sNcDzLHS9tHyyVwgnsRnnyPLi7PAJktTgfg
 vnTAKXgqtthPb0KzKGBcy+6YRk8JGEJn8JOfgnUrzGjeZL/4QtYYDmEIrTIJmyAlFIml
 FF3nR1uPvWQNYQj6L+Uq0gN+PQqw57u087GYisRAB24I3yv3xXxWGXU4sMNdgJWdoIoe
 ZfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :message-id:references:to:content-transfer-encoding;
 bh=A97M6Z2AORCYTNmjBn4qA+zhbptTeRmphDo+plSZq14=;
 b=jX1/CFaKjFt19WMTvMRMG6Ef65ignEEWS1KsS/0YDTOv3vkW/cQXhF6Lb3mdZa3DsM
 gEQpRkjVZyuOgX24HwCZQMRqmxdUPdQOQzxeNEUWMG21GzBsY8zzVlYd2eFCJI15YRnz
 h6xjeaLeoThhczSgMDb5KGa77aExXM52FbgXaJNUU5bhD0c94b1zTqAOw47WldOfd0kI
 dHIz4G2CRXQkXcTlv2/u8A7d4jY7cqsafoaRaQZBOz6QCrzT6aErYLL7vWfP1qUyB0jq
 6AJfWtHDaCJ9GBIb9/M+S6KzrkNMLrVH5Ut9WkKfOUpIBVuSK/7GA2aBYm60gIgi8NZQ
 ss5A==
X-Gm-Message-State: AOAM5338ls2sE9t4lk2zwaki8L8xWaOcSbR8jdDwRUasKiwVN9Wu4BGJ
 HByAKT2Dl2UuXme4DSXlE0KUVkXrsgNPdDIRlgjeaa8cd8cbdTLJGtzn+MhNXejxEtdQUi0Xj8n
 m6CWTaPm/3zzmhAUSin0suulN
X-Google-Smtp-Source: ABdhPJzN0zBs6V1EqLgyGxSOcSavX4cVETNsKlHDbgKGA9AvpQSEiWkCS0O8rXQFSokH+LFceuXnKA==
X-Received: by 2002:a1c:1f4a:: with SMTP id f71mr2467257wmf.101.1616492831201; 
 Tue, 23 Mar 2021 02:47:11 -0700 (PDT)
Received: from ?IPv6:fddd:dddd:1000:0:9a12:47ec:bb66:3813?
 (ec2-18-130-213-235.eu-west-2.compute.amazonaws.com. [18.130.213.235])
 by smtp.gmail.com with ESMTPSA id p18sm27003689wro.18.2021.03.23.02.47.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Mar 2021 02:47:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: Handshake state collision between parralel RoutineHandshake
 threads
From: Laura Zelenku <laura.zelenku@wandera.com>
In-Reply-To: <6B92ECA6-AEC9-42F2-AB98-013CBB70691C@wandera.com>
Date: Tue, 23 Mar 2021 10:47:08 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-Id: <2F538518-C3E5-4418-910F-E8EBF7686C19@wandera.com>
References: <27D86318-AED9-49EC-94EE-1FFC806533DC@wandera.com>
 <CAHmME9oOKvMqvSw_CrjhiWU+R60AEVxLYzoaC8W7F7D5vWgWvA@mail.gmail.com>
 <92B58443-8904-417B-A866-7BD2C6240B42@wandera.com>
 <6B92ECA6-AEC9-42F2-AB98-013CBB70691C@wandera.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 23 Mar 2021 14:44:17 +0000
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

Or can we at least lower log level of "Failed to create response message=E2=
=80=9D if it is not problem? The error is really disturbing and as you wrot=
e one of the handshakes is processed.

> On 16. 3. 2021, at 15:03, Laura Zelenku <laura.zelenku@wandera.com> wrote=
:
>=20
> Still struggling with this issue. Running RoutineHandshake in single inst=
ance will help. Remember there is shared resource =E2=80=9Cpeer.handshake.s=
tate=E2=80=9D. Even the resource is per peer there are two directions (upst=
ream/downstream) that can fight for this resource and write it=E2=80=99s ow=
n value.
>=20
> Index: device/receive.go
> IDEA additional info:
> Subsystem: com.intellij.openapi.diff.impl.patch.CharsetEP
> <+>UTF-8
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- device/receive.go	(revision 5f0c8b942d93be6ac36a156c0ba44c86c3698f91)
> +++ device/receive.go	(date 1615902577604)
> @@ -10,6 +10,7 @@
> 	"encoding/binary"
> 	"errors"
> 	"net"
> +	"runtime"
> 	"sync"
> 	"sync/atomic"
> 	"time"
> @@ -239,7 +240,9 @@
> func (device *Device) RoutineHandshake() {
> 	defer func() {
> 		device.log.Verbosef("Routine: handshake worker - stopped")
> -		device.queue.encryption.wg.Done()
> +		for i :=3D 0; i < runtime.NumCPU(); i++ {
> +			device.queue.encryption.wg.Done()
> +		}
> 	}()
> 	device.log.Verbosef("Routine: handshake worker - started")
>=20
> Index: device/device.go
> IDEA additional info:
> Subsystem: com.intellij.openapi.diff.impl.patch.CharsetEP
> <+>UTF-8
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- device/device.go	(revision 5f0c8b942d93be6ac36a156c0ba44c86c3698f91)
> +++ device/device.go	(date 1615902577566)
> @@ -305,12 +305,12 @@
>=20
> 	cpus :=3D runtime.NumCPU()
> 	device.state.stopping.Wait()
> -	device.queue.encryption.wg.Add(cpus) // One for each RoutineHandshake
> +	device.queue.encryption.wg.Add(cpus)
> 	for i :=3D 0; i < cpus; i++ {
> 		go device.RoutineEncryption()
> 		go device.RoutineDecryption()
> -		go device.RoutineHandshake()
> -	}
> +	}
> +	go device.RoutineHandshake()
>=20
> 	device.state.stopping.Add(1)      // RoutineReadFromTUN
> 	device.queue.encryption.wg.Add(1) // RoutineReadFromTUN
>=20
>=20
>> On 1. 3. 2021, at 15:08, Laura Zelenku <laura.zelenku@wandera.com> wrote=
:
>>=20
>> Hi Jason,
>> I=E2=80=99ll try to explain the issue.
>>=20
>> For incomming hanshake, the `handshake.state` is changing in the followi=
ng way:
>> 1. set state handshakeInitiationConsumed
>> 2. check the state is handshakeInitiationConsumed otherwise "handshake i=
nitiation must be consumed first=E2=80=9D error
>> 3. set state handshakeResponseCreated
>> 4. check the state is handshakeResponseCreated, otherwise "invalid state=
 for keypair derivation=E2=80=9D error
>> 5. set state handshakeZeroed
>>=20
>> For outgoing handshake the `handshake.state` is changing:
>> 1. set state handshakeInitiationCreated
>> 2. <sending handshake and waiting for response>
>> 3. check the state is handshakeInitiationCreated, otherwise skip the pac=
ket
>> 4. set state handshakeResponseConsumed
>> 5. check the state is handshakeResponseConsumed, otherwise "invalid stat=
e for keypair derivation=E2=80=9D error
>> 6. set state handshakeZeroed
>>=20
>> Usually only =E2=80=9Cclient=E2=80=9D is sending handshake initiations a=
nd the =E2=80=9Cserver=E2=80=9D responding. But in case some delay (e.g. ca=
use by some network issues mainly for mobile devices) the =E2=80=9Cserver=
=E2=80=9D can start sending handshake initiations (expiredNewHandshake or e=
xpiredRetransmitHandshake timers). In this time the client and server are s=
ending hanshake initiations against each other. "go device.RoutineHandshake=
()=E2=80=9D is running in multiple threads. `handshake.state` is defined pe=
r peer. Two threads (RoutineHandshake) can process both handshakes (incommi=
ng, outgoing) in the same time and these threads are working with shared re=
source, handshake.state. Because the routine is expecting state that was se=
t before and the second thread can modify the state, the routine can fail o=
n checking the expected handshake.state.
>> This is happening to us. We are getting error "handshake initiation must=
 be consumed first=E2=80=9D. handshakeInitiationConsumed is expected but ha=
ndshakeZeroed is actually set (set by different thread). The error is logge=
d on error level (Failed to create response message).
>>=20
>> Hope this will help to understand the issue well.
>>=20
>> Laura
>>=20
>>=20
>>> On 25 Feb 2021, at 12:23, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>>=20
>>> Hi Laura,
>>>=20
>>> I'm not sure this is actually a problem. The latest handshake message
>>> should probably win the race. I don't see state machine or data
>>> corruption here, but just one handshake interrupting another, which is
>>> par for the course with WireGuard.
>>>=20
>>> Or have I overlooked something important in the state machine implement=
ation?
>>>=20
>>> Jason
>>=20
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
