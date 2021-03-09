Return-Path: <SRS0=TBPu=IH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF36C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 16:30:39 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9533614A7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 16:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9533614A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wandera.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 084a18f3;
	Tue, 9 Mar 2021 16:30:36 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 860e014e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Mar 2021 16:30:35 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso6964600wme.0
 for <wireguard@lists.zx2c4.com>; Tue, 09 Mar 2021 08:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wandera.com; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc:message-id:references
 :to:content-transfer-encoding;
 bh=DuDWkJIWqAHDDlg7CW0lv/K0dMiKwLHZFOgKkhe5jgQ=;
 b=QstiszoLRsz2OqNsGiHGh3VoGdjM2QmjvuWCb5lyTZzz+sWF5CAxR1mVy7FrylKG1u
 oHSFcXH71xjV4lKx+35oQOLNy3hdXk3A6A89GY5ANelB3/o891SkZOpjyxGkS9HtSDUB
 T/B9wYhl82GX75k0VAL3DlrkBv4y5T77DxZRp0lwuB4wgR1C8vOdKgxziTfQrFI1EuVB
 xAIaz6Ts1X4cama5YljU2/noZdghmjMQYK4LOJnMjcIu/MlDfFLT8FiCtjVwWwA2oG4F
 M9MDRwIB/2IAsrWuWzfkvW96UPW084o8UPX+9FQ6CRNZOSVBltPfqhCj62ccCKRB+mxA
 PICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :message-id:references:to:content-transfer-encoding;
 bh=DuDWkJIWqAHDDlg7CW0lv/K0dMiKwLHZFOgKkhe5jgQ=;
 b=l7haE5WhTvV2+OElMyuWvE0EG1B9Dvc0gRpTCyOFmqC2HzWmMvkKa3lBLSRVQrYSEB
 4WflzDOyW3j7em91hvJiLeRwdoRFrZ/iJ4VLXV2MU6ci7aIOFg45Gc5RDp6MLUZBluuM
 J7PML9oCwpkRe6QfU71eObWLNAHW/l0xuGt2S2EULet9UqnpGatuPWg+2suSEA1vE78o
 hMJl4JmXCSe/wI26Nbdoa6gtjusiwIk4oo3AkmbEqMFqtAcyOo+5MPFu7wuw1enMmnKG
 /fDZBDufQwdxQW26+0Lv7wpTu5l7ecATH2uxZSHbZLnVnOJHbIySaWcmCjs2e+n6Leq5
 bHFA==
X-Gm-Message-State: AOAM53247KLkP856OE5GUhQRQKlS/286zqqV8OKszUE/fTps3TE56unX
 60CDPg6CYWxO2nzMAK7dm+Cx9iVbK9M170zKR3EmwoyhXQNj0qTSv4dxFEvlUI1vyU3UEcRp5U6
 JOgaimSE48U1qYA==
X-Google-Smtp-Source: ABdhPJxrzvJTUoiELQN/zACHuqTOmAFlBiTj9v2dOx5E6qfy56Vm9AOyXu/8xAAgYvfCwEKZMXoBMw==
X-Received: by 2002:a1c:ed13:: with SMTP id l19mr4855934wmh.83.1615307434610; 
 Tue, 09 Mar 2021 08:30:34 -0800 (PST)
Received: from [10.255.240.33]
 (ec2-54-246-181-160.eu-west-1.compute.amazonaws.com. [54.246.181.160])
 by smtp.gmail.com with ESMTPSA id v7sm4946163wme.47.2021.03.09.08.30.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Mar 2021 08:30:34 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] device: revert pipelining UAPI requests
From: Laura Zelenku <laura.zelenku@wandera.com>
In-Reply-To: <CAHmME9rakmzN2ndkXchvcRXONjfk4ikJScWCSEYzNR8+1ow03w@mail.gmail.com>
Date: Tue, 9 Mar 2021 17:30:32 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-Id: <3A2A1B3E-75FB-4CCA-A7B9-FC7C02B7E9DB@wandera.com>
References: <038632B3-A3F3-4FC6-8242-265A42F89F1F@wandera.com>
 <CAHmME9rakmzN2ndkXchvcRXONjfk4ikJScWCSEYzNR8+1ow03w@mail.gmail.com>
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
I=E2=80=99m just using =E2=80=9Cwg-quick up wg0=E2=80=9D command on Linux e=
nv with NO kernel module, just userspace implementation.
My config file looks like:
[Interface]
PrivateKey =3D =E2=80=A6.mEw=3D
Address =3D fddd:dddd:1000::1/128
DNS =3D fddd:dddd::
MTU =3D 1420
[Peer]
PublicKey =3D =E2=80=A6..pC0=3D
AllowedIPs =3D fd53::/32,fddd:dddd::/128
Endpoint =3D dev.wandera.com:3005
PersistentKeepalive =3D 25

In the command output you can see that "wg setconf wg0 /dev/fd/63=E2=80=9D =
stucked and no following commands (set IP address, set MTU, =E2=80=A6) are =
processed.
The output is:

# wg-quick up wg0
[#] ip link add wg0 type wireguard
RTNETLINK answers: Not supported
[!] Missing WireGuard kernel module. Falling back to slow userspace impleme=
ntation.
[#] /wireguard/wireguard-go wg0
=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=90
=E2=94=82                                                   =E2=94=82
=E2=94=82   Running this software on Linux is unnecessary,  =E2=94=82
=E2=94=82   because the Linux kernel has built-in first     =E2=94=82
=E2=94=82   class support for WireGuard, which will be      =E2=94=82
=E2=94=82   faster, slicker, and better integrated. For     =E2=94=82
=E2=94=82   information on installing the kernel module,    =E2=94=82
=E2=94=82   please visit: <https://wireguard.com/install>.  =E2=94=82
=E2=94=82                                                   =E2=94=82
=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=98
DEBUG: (wg0) 2021/03/09 13:11:41 Starting wireguard-go version 0.0.20210212=
-dirty
DEBUG: (wg0) 2021/03/09 13:11:41 Starting wireguard-go version 0.0.20210212=
-dirty
DEBUG: (wg0) 2021/03/09 13:11:41 Device started
DEBUG: (wg0) 2021/03/09 13:11:41 UAPI listener started
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: decryption worker - started
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: encryption worker - started
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: decryption worker - started
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: handshake worker - started
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: encryption worker - started
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: handshake worker - started
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: handshake worker - started
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: encryption worker - started
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: decryption worker - started
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: decryption worker - started
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: encryption worker - started
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: handshake worker - started
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: TUN reader - started
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: event worker - started
DEBUG: (wg0) 2021/03/09 13:11:41 Interface up requested
DEBUG: (wg0) 2021/03/09 13:11:41 UDP bind has been updated
DEBUG: (wg0) 2021/03/09 13:11:41 Interface state was Down, requested Up, no=
w Up
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: receive incoming IPv6 - started
[#] wg setconf wg0 /dev/fd/63
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: receive incoming IPv4 - started
DEBUG: (wg0) 2021/03/09 13:11:41 UAPI: Updating private key
DEBUG: (wg0) 2021/03/09 13:11:41 UAPI: Updating listen port
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: receive incoming IPv4 - stopped
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: receive incoming IPv6 - stopped
DEBUG: (wg0) 2021/03/09 13:11:41 UDP bind has been updated
DEBUG: (wg0) 2021/03/09 13:11:41 UAPI: Updating fwmark
DEBUG: (wg0) 2021/03/09 13:11:41 UAPI: Removing all peers
DEBUG: (wg0) 2021/03/09 13:11:41 peer(0DIu=E2=80=A6qpC0) - Starting...
DEBUG: (wg0) 2021/03/09 13:11:41 peer(0DIu=E2=80=A6qpC0) - UAPI: Created
DEBUG: (wg0) 2021/03/09 13:11:41 peer(0DIu=E2=80=A6qpC0) - UAPI: Updating e=
ndpoint
DEBUG: (wg0) 2021/03/09 13:11:41 peer(0DIu=E2=80=A6qpC0) - UAPI: Updating p=
ersistent keepalive interval
DEBUG: (wg0) 2021/03/09 13:11:41 peer(0DIu=E2=80=A6qpC0) - Sending keepaliv=
e packet
DEBUG: (wg0) 2021/03/09 13:11:41 peer(0DIu=E2=80=A6qpC0) - Sending handshak=
e initiation
DEBUG: (wg0) 2021/03/09 13:11:41 peer(0DIu=E2=80=A6qpC0) - UAPI: Removing a=
ll allowedips
DEBUG: (wg0) 2021/03/09 13:11:41 peer(0DIu=E2=80=A6qpC0) - UAPI: Adding all=
owedip
DEBUG: (wg0) 2021/03/09 13:11:41 peer(0DIu=E2=80=A6qpC0) - UAPI: Adding all=
owedip
DEBUG: (wg0) 2021/03/09 13:11:41 peer(0DIu=E2=80=A6qpC0) - Routine: sequent=
ial receiver - started
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: receive incoming IPv4 - started
DEBUG: (wg0) 2021/03/09 13:11:41 Routine: receive incoming IPv6 - started
DEBUG: (wg0) 2021/03/09 13:11:41 peer(0DIu=E2=80=A6qpC0) - Routine: sequent=
ial sender - started
DEBUG: (wg0) 2021/03/09 13:11:41 peer(0DIu=E2=80=A6qpC0) - Received handsha=
ke response
DEBUG: (wg0) 2021/03/09 13:11:42 Interface up requested
DEBUG: (wg0) 2021/03/09 13:11:43 Interface up requested
DEBUG: (wg0) 2021/03/09 13:11:44 Interface up requested
DEBUG: (wg0) 2021/03/09 13:11:45 Interface up requested

As I=E2=80=99m thinking about proper fix I have no idea. The solution would=
 also be to =E2=80=9Creturn=E2=80=9D after first set command (no second loo=
p processing).

Laura


> On 9 Mar 2021, at 16:09, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> On Tue, Mar 9, 2021 at 8:04 AM Laura Zelenku <laura.zelenku@wandera.com> =
wrote:
>>=20
>> Hello devs,
>> there is an issue when using wg-quick tool and wg tool bellow from wireg=
uard-tools repository (version v1.0.20210223). I=E2=80=99m running: wg-quic=
k up operation with config file in /etc/wireguard/ directory. Get operation=
s are ok. Processed without a problem. But for Set operation the processing=
 will stuck on "buffered.ReadString('\n=E2=80=99)=E2=80=9D (in the second r=
un of for loop cycle, after set command is processed in first for loop cycl=
e) because bufio.Scanner will read everything from the socket.
>=20
> I'm unable to reproduce this issue. Can you send a small shell script
> that does so?
>=20
>> Please revert till proper fix is ready.
>=20
> How hard can a proper fix be? Can't we just commit the actual fix instead=
?
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
