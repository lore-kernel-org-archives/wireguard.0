Return-Path: wasabee18@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30186357
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Jan 2017 19:00:56 +0000 (UTC)
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9fe3147a
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Jan 2017 19:00:56 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id r126so107780566wmr.0
 for <wireguard@lists.zx2c4.com>; Sat, 14 Jan 2017 11:11:12 -0800 (PST)
MIME-Version: 1.0
From: Wasa Bee <wasabee18@gmail.com>
Date: Sat, 14 Jan 2017 19:11:07 +0000
Message-ID: <CAOnWvx_BCaSO3i=319vCUjKuXG6E+8ReGsFGFFVgJLsdyb4RGg@mail.gmail.com>
Subject: limitations
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary=94eb2c065e60790789054612b68f
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c065e60790789054612b68f
Content-Type: text/plain; charset=UTF-8

Hi

i've got 2 simple questions about WireGuard, correct me if I'm wrong:

- it is only over UDP. If so, is there ever going to be a TCP version? A
lot of applications that could benefit from WG use TCP. It does not seem
wise to expect programmers to implement a TCP-like layer (eg
retransmission, ack, etc) in userspace, is it? This would increase
complexity unnecessarily and would lead to vuln in practice...

- WG is implemented as a patch to the kernel or a kernel module? The reason
I ask is that when an update is available for WG, it would be good not to
have to replace the whole kernel, but only reload a patched WG module.
Also: if there are ongoing sessions with some clients, how would sessions
be re-established (afaik, the current design is to simply ignore irrelevant
messages)?

Thanks

--94eb2c065e60790789054612b68f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div><br></div><div>i&#39;ve got 2 simple questions abou=
t WireGuard, correct me if I&#39;m wrong:</div><div><br></div><div>- it is =
only over UDP. If so, is there ever going to be a TCP version? A lot of app=
lications that could benefit from WG use TCP. It does not seem wise to expe=
ct programmers to implement a TCP-like layer (eg retransmission, ack, etc) =
in userspace, is it? This would increase complexity unnecessarily and would=
 lead to vuln in practice...</div><div><br></div><div>- WG is implemented a=
s a patch to the kernel or a kernel module? The reason I ask is that when a=
n update is available for WG, it would be good not to have to replace the w=
hole kernel, but only reload a patched WG module. Also: if there are ongoin=
g sessions with some clients, how would sessions be re-established (afaik, =
the current design is to simply ignore irrelevant messages)?</div><div><br>=
</div><div>Thanks</div></div>

--94eb2c065e60790789054612b68f--
