Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80a4b1d4
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 03:57:14 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.vm.smurf.noris.de
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a45d8dbc
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 03:57:14 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1fWDGV-000JiQ-Ki
 for wireguard@lists.zx2c4.com; Fri, 22 Jun 2018 06:01:39 +0200
Subject: Re: PostUp/PreUp/PostDown/PreDown Dangerous?
To: wireguard@lists.zx2c4.com
References: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
 <CAHmME9qPwF-YdSKRhngVuL4JXrMD_1=nbP0jDUAejBxexsN3EA@mail.gmail.com>
 <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <ec7cad9e-c89c-fdad-0059-9cafef495233@urlichs.de>
Date: Fri, 22 Jun 2018 06:01:38 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 22.06.2018 03:41, Jason A. Donenfeld wrote:
> So, the question we need to ask is whether this problem is important
> enough that these useful features should be _removed_? Or if there's a
> way to make them safer? Or if it just doesn't matter that much and we
> shouldn't do anything.

User is able to shoot themselves in the foot. Film at 11.

Seriously. If you accept untrusted "secure" network configuration
scripts from anybody without checking them, you deserve to lose. Also,
OpenVPN config is somewhat more arcane+verbose than wireguard's, thus
it's much harder to hide random script calls from even cursory glances
in a wg config file.

If we want to, we could emit a big fat warning and/or ask the user to
confirm whenever their wg-quick script is newer than
/etc/wireguard/.{NAME].warned (or we could copy the contents of the
up/down script options to that file and warn when they've changed).

That being said, tools like systemd-networkd or NetworkManager do a good
job of making that option (and thus wg-quick itself) unnecessary
altogether, so I consider that to be a mostly-non-problem.

-- 
-- Matthias Urlichs
