Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 463f407e
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 15:10:11 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.vm.smurf.noris.de
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9eb29f4
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 15:10:11 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1fWNlg-0001gP-8w
 for wireguard@lists.zx2c4.com; Fri, 22 Jun 2018 17:14:32 +0200
Subject: Re: PostUp/PreUp/PostDown/PreDown Dangerous?
To: wireguard@lists.zx2c4.com
References: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
 <CAHmME9qPwF-YdSKRhngVuL4JXrMD_1=nbP0jDUAejBxexsN3EA@mail.gmail.com>
 <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
 <a7989c95-0047-dfe9-e870-59db44fbb463@unstable.cc>
 <CgE9_flxwDk6vYs9xSAoTvLJp5qHdNF20xieK4syAMzldOBqEq5lZ3gZN77A7ambiqtFeuBfm-jXarYLMvcY4LAn1aC9ub1su871JPhDpUo=@protonmail.ch>
 <6645df4c-3f98-6df9-fc48-6748ad4d6c00@unstable.cc>
 <CAEypN9LgpCN_3Zt3H4YgUEtiJWFF7d-=H=jQoTH9DNUN3DX42w@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <4663e0b5-fe87-b26a-e87d-279305188976@urlichs.de>
Date: Fri, 22 Jun 2018 17:14:31 +0200
MIME-Version: 1.0
In-Reply-To: <CAEypN9LgpCN_3Zt3H4YgUEtiJWFF7d-=H=jQoTH9DNUN3DX42w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 22.06.2018 15:08, Jacob Baines wrote:
> Excuse my speaking in generalities but a majority of users aren't
> going to understand how OpenVPN works, let alone how the configuration
> file affects the program.

Fortunately, WireGuard is a lot more approachable. All you really need
is a basic understanding of PK crypto, i.e. you need a private key for
yourself and the public key of whoever you want to talk with, both of
which can be generated with very simple commands. You can learn how to
set it up in half an hour.

In contrast, understanding SSL and OpenVPN well enough to be able to
generate a config file, let alone know how to debug it, takes a day –
and then you don't know how to debug it. With WireGuard you need to
answer three questions – do the endpoints see each others' packets? do
the public keys match? are the remote IP addresses correct (plus routed
to the WG network interface, not filtered, etc.)? If "yes", it'll work.
Dead simple.

-- 
-- Matthias Urlichs
