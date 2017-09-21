Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51e18274
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 11:18:49 +0000 (UTC)
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
 [209.85.223.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45f77036
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 11:18:49 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id d16so10138835ioj.3
 for <wireguard@lists.zx2c4.com>; Thu, 21 Sep 2017 04:46:11 -0700 (PDT)
MIME-Version: 1.0
Sender: nicolas.prochazka@gmail.com
In-Reply-To: <CAHmME9oMQ+3yUA8Da-m8YAkNgJ-aJ3uRuhp-uHJq_mRQ1hJDDQ@mail.gmail.com>
References: <CADdae-hcrAL6-pMPwVOmGe3cb299jtUj68WVbz3EU5MmGQbtaQ@mail.gmail.com>
 <CAHmME9oMQ+3yUA8Da-m8YAkNgJ-aJ3uRuhp-uHJq_mRQ1hJDDQ@mail.gmail.com>
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Thu, 21 Sep 2017 13:46:10 +0200
Message-ID: <CADdae-jaxO+P-fcqgqjDRWkih4YhxS__A=weDtHVhB3j4R6W_A@mail.gmail.com>
Subject: Re: [wireguard-dev] Ability to use one udp port for multiple wg
 interfaces
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,
i known, but we are using one interface by customer, each interface
manages multiple peers ( > 500 )
as
wg_interface0 = client 0  = 500 peers
wf_interfacen= client n = 500 peers

at this moment, only one interface wg0  manage all peers and all
customers , it's very complicating for the administrive tasks , qos,
client separation ....

Regards,
NIcolas

2017-09-21 13:25 GMT+02:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> I'd recommend you use multiple peers per interface. The strong binding
> with allowed-ips enables you to use qos, network analysis, security,
> and iptables rules in a very straightforward way.
